import 'package:flutter/material.dart';

class AppGlobalConfigure {
  factory AppGlobalConfigure() => _getInstance();

  static AppGlobalConfigure get instance => _getInstance();

  static AppGlobalConfigure? _instance;

  AppGlobalConfigure._internal();

  static AppGlobalConfigure _getInstance() {
    _instance ??= AppGlobalConfigure._internal();
    return _instance!;
  }

  /// 屏幕宽度
  dynamic screenWidth;

  /// 屏幕高度
  dynamic screenHeight;

  /// 刘海屏幕顶部间距
  dynamic screenTopPadding;

  /// 刘海屏幕底部间距
  dynamic screenBottomPadding;

  late BuildContext? globalContext;

  /// 初始化配置
  void initScreenConfigure(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    screenTopPadding = MediaQuery.of(context).padding.top;
    screenBottomPadding = MediaQuery.of(context).padding.bottom;
    globalContext = context;
  }
}
