

import 'package:flutter/cupertino.dart';

class AppSetting {

  /// 单例*实例
  static AppSetting? _instance;
  /// 当前语言设置发生改变回调
  late Function(Locale locale) changedLocale;
  /// 选择的语言
  Locale? selectedLocale;

  AppSetting._internal();
  factory AppSetting() => _getInstance();
  static AppSetting get instance => _getInstance();
  static AppSetting _getInstance() {
    _instance ??= AppSetting._internal();
    return _instance!;
  }
}

/// 收起键盘
void closeKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}