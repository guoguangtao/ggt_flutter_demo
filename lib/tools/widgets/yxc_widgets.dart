import 'package:flutter/material.dart';

/// 加载网络图片
Widget yxcNetWorkImage({String? placeholder, required String url}) {
  if (url.isEmpty || (url.startsWith("http") == false)) return Image.asset(placeholder ?? "");
  return FadeInImage(
      placeholder: AssetImage(placeholder ?? ""), image: NetworkImage(url));
}
