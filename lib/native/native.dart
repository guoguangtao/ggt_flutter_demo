
import 'package:flutter/services.dart';

class NativeMethod {
  static const MethodChannel _channel = MethodChannel("com.lebo.channel");

  static void openLocalFile(String path) {
    try {
      print("调用原生 openLocalFile 方法:$path");
      _channel.invokeMethod("openLocalFile", {"path" : path});
    } on PlatformException catch (_) {
      print("Flutter 调用 openLocalFile 方法失败");
    }
  }

  static void jumpNativeView() {
    try {
      print("Flutter 跳转原生界面");
      _channel.invokeMethod("jumpNativeView");
    } on PlatformException catch (_) {
      print("Flutter  跳转原生界面异常");
    }
  }
}