#!/usr/bin/perl
# use strict;
# use warnings FATAL => 'all';
use JSON;
use File::Basename;
use POSIX qw(strftime);

my $dirname = dirname(dirname(__FILE__));
my $filePath = "$dirname/assets/fonts/icon/iconfont.json";

if (length($filePath) == 0) {
    print "iconfont.json 文件路径为空\n";
    exit(-2);
}

if (!-e $filePath) {
    print "iconfont.json 文件不存在: $filePath\n";
    exit(-1);
}

print "目标文件: $filePath\n";

# print "文件名是：$filename\n";
# print "目录是：$directories\n";
# print "扩展名是：$suffix\n";

# print("className:$className\n");

sub getFileContent {
    my ($filePath) = @_;
    my $content = '';
    open(my $fh, '<', $filePath) or die "Cannot open file: $!";
    while (my $line = <$fh>) {
        chomp($line); # 去除行末换行符

        $content .= $line;

    }
    close($fh);
    return $content;
}

sub getNow {
    my $now = time(); # 获取当前时间戳
    return strftime("%Y-%m-%d %H:%M:%S", localtime($now));
}

sub writeFile {
    my ($saveFilePath, $content) = @_;

    # print("saveFilePath: $saveFilePath\n");
    # print("$content");

    open(OUT, "> $saveFilePath") or die "Error opening $saveFilePath: $!";;

    print OUT $content;

    close(OUT);
}

my $json_str = getFileContent($filePath);
# print("file content:\n $json_str\n");

eval {
    my $json = JSON->new->decode($json_str);

    # my $json = eval { JSON->new->decode_json($json_str) };
    if ($@) {
        # 处理JSON解析错误
        print "iconfont.json 格式错误, Error: $@\n";
        exit(0)
    }

    my $glyphs = $json->{'glyphs'};
    # print $json->{'glyphs'} . "\n";

    my $iconDeclare = "";

    foreach my $iconItem (@$glyphs) {
        # print $iconItem . "\n";

        my $unicode = $iconItem->{'unicode'};
        my $comment = $iconItem->{'name'};
        my $name = $iconItem->{'font_class'};

        my @parts = split /_/, $name;
        my $length = scalar @parts;

        # print("name1: $name, $length\n");
        if ($length > 1) {
            $name = @parts[$length - 1];
        }
        else {
            $name =~ s/nuoheguanhuaiSVG_//;
        }

        # print("name2: $name\n");

        $name = lc($name);
        $name =~ s/-/_/g;

        $iconDeclare .= "  /// $comment
  static const IconData $name = IconData(0x${unicode}, fontFamily: 'enIcon');\n\n";
    }

    chomp($iconDeclare);

    my $now = getNow();

    my $genContent = "/// GENERATED CODE - DO NOT MODIFY BY HAND
/// FileName: icons.dart
///
/// \@Date: $now
/// \@Description:
///
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
// noinspection ALL
import 'package:flutter/material.dart';

class DNUIconFont {
  DNUIconFont._();

$iconDeclare}
";

    # print($genContent);

    my $iconFilePath = "$dirname/lib/ui/icons/icons.dart";

    writeFile($iconFilePath, $genContent);

    print("icons.dart 生成完成\n");
};

if ($@) {
    # 处理JSON解析错误
    print "Error: $@\n";
}