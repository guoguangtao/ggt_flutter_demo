
import 'dart:convert';
import 'package:crypto/crypto.dart';


extension YXCStringExtension on String {

  /// 本地图片路径
  String localImageName() {
    return "assets/images/$this.png";
  }

  /// 返回 MD5 字符串
  String yxcMD5() {
    return md5.convert(utf8.encode(this)).toString();
  }

  /// 判断当前手机号是否合法
  bool checkMobileNumber() {
    if (isEmpty) return false;

    String regex = "^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$";
    return RegExp(regex).hasMatch(this);
  }
}