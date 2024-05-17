#!/usr/bin/perl
# use strict;
# use warnings FATAL => 'all';

use File::Basename;

sub upperFirst {
    my ($name) = @_;
    my $newItem = uc(substr($name, 0, 1)) . substr($name, 1);
    return $newItem;
}

sub convertName {
    my ($name) = @_;
    # print("old:" . $name . "\n");

    $name =~ s/-/_/g;

    my @parts = split /_/, $name;

    my $ret = $parts[0];
    for my $i (1 .. $#parts) {
        my $newItem = upperFirst($parts[$i]);

        $ret .= $newItem;
    }

    # print("ret:" . $ret . "\n");

    return $ret;
}



sub getModImageName {
    my ($name) = @_;
    $name = lc($name);
    $name = upperFirst($name);
    return "_DNU${name}Images";
}

sub getOtherDirName {
    my ($name) = @_;
    $name = lc($name);
    $name = upperFirst($name);
    return "_DNU${name}Dir";
}

sub genSubImageCode {
    my ($name, $filePath) = @_;

    # print("$name, $filePath\n");

    my $className = getModImageName($name);

    opendir(SUBDIR, $filePath) or die "无法打开目录, $!";
    $content = '';
    while (my $file = readdir SUBDIR) {
        # print "$file\n";
        if (!-d "$filePath/${file}" and $file ne '.DS_Store') {
            my @fileParts = split /\./, $file;
            my $fileName = @fileParts[0];
            my $varName = convertName($fileName);
            my $assetsPath = "assets/images/$name/$file";
            # print("$file, $fileName, $varName, $assetsPath\n");

            $content .= "  String get ${varName} => '$assetsPath';\n";
        }
    }

    closedir SUBDIR;

    # print(" $content\n");

    return "
class $className {
  const $className();

$content}\n";
}

sub genImages {
    my ($assetPath) = @_;

    # print("=====.$assetPath");

    my $imageContent = '';

    my $modFileContent = '';
    my $filePath = "$assetPath/images";
    opendir(DIRIMAGE, $filePath) or die "无法打开目录, $$filePath";
    while (my $file = readdir DIRIMAGE) {

        # print("=====./assets/images/${file}");

        # if(-d "./assets/images/${file}") {
        #     print("======");
        # }
        if ($file ne "." && $file ne ".." && -d "$filePath/${file}") {
            my $className = getModImageName($file);

            $imageContent .= "  $className get $file => const $className();\n";
            $modFileContent .= genSubImageCode($file, "$filePath/${file}");

            # print "$file\n";
        }
    }

    closedir DIRIMAGE;

    return "
// **************************************************************************
// dir images
// **************************************************************************$modFileContent

class _DNUImages {
  const _DNUImages();

$imageContent}";
}

sub genOtherClass {
    my ($dirName, $dirPath) = @_;

    my $dirContent = '';

    my $modFileContent = '';
    my $dirFullPath = "$dirPath/$dirName";
    opendir(DIR, $dirFullPath) or die "无法打开目录: $dirFullPath, $!";
    while (my $file = readdir DIR) {

        if (!-d "$dirFullPath/${file}" and $file ne '.DS_Store') {
            my @fileParts = split /\./, $file;
            my $fileName = @fileParts[0];
            my $varName = convertName($fileName);
            my $assetsPath = "assets/$dirName/$file";
            # print("$file, $fileName, $varName, $assetsPath\n");

            $modFileContent .= "  String get ${varName} => '$assetsPath';\n";
        }

    }

    closedir DIR;

    my $classname = getOtherDirName($dirName);
    return "
// **************************************************************************
// dir $dirName
// **************************************************************************
class $classname {
  const $classname();

$modFileContent}";
}

sub genClassDeclare {
    my ($dirName) = @_;
    my $classname = getOtherDirName($dirName);
    return "  $classname get $dirName => const $classname();\n";
}

sub writeFile {
    my ($saveFilePath, $content)=@_;

    # print("saveFilePath: $saveFilePath\n");
    # print("$content");

    open( OUT, "> $saveFilePath") or die "Error opening $saveFilePath: $!";;

    print OUT $content;

    close(OUT);
}
my $dirname = dirname(dirname(__FILE__));

my $imageClass = genImages("$dirname/assets");
my $htmlClass = genOtherClass('html', "$dirname/assets");
my $assetDeclare = genClassDeclare("html");

my $assetContent = "// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// **************************************************************************
// AssetsGenerator
// **************************************************************************
part of 'dnu_assets.dart';

$imageClass

$htmlClass

// **************************************************************************
// assets
// **************************************************************************
mixin _\$DNUAssets {
  _DNUImages get images => const _DNUImages();
$assetDeclare}
";

# print($assetContent);

# print(getModImageName("USER"));


my $assetFilePath = "$dirname/lib/resource/dnu_assets.g.dart";
# print("$assetFilePath\n");

writeFile($assetFilePath, $assetContent);
print("生成dnu_assets.g.dart完成\n");