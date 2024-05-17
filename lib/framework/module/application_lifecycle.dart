import 'dart:async';

abstract class ApplicationLifecycle {
  /// 用户模块初始化自己的数据
  FutureOr<void> onAppInit();

  /// 这里可以开始可能交叉的事件
  FutureOr<void> onAfterAppInit();

  /// 同意隐私协议以后
  FutureOr<void> onAgreedPrivacy();
}
