import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yxc_cast/yxc_cast.dart';

class YXCCastView extends StatelessWidget {
  const YXCCastView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('投屏操作'),
      ),
      body: _YXCCastBodyView(),
    );
  }
}

class _YXCCastBodyView extends StatefulWidget {
  const _YXCCastBodyView({Key? key}) : super(key: key);

  @override
  State<_YXCCastBodyView> createState() => _YXCCastBodyViewState();
}

class _YXCCastBodyViewState extends State<_YXCCastBodyView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              try {
                YxcCast.cast();
              } on PlatformException {
                print("调用 cast 方法异常");
              }
            },
            child: Text("投屏"),
          ),
          TextButton(
            onPressed: () {
              try {
                YxcCast.devices.then((value) {
                  print("搜索到设备:${value.length}");
                  for (int i = 0; i < value.length; i++) {
                    Object? object = value[i];
                    Map<Object?, Object?> devices =
                        object as Map<Object?, Object?>;
                    String lelinkServiceName =
                        devices["lelinkServiceName"] as String;
                    if (lelinkServiceName == "星宸(1)") {
                      try {
                        YxcCast.connectionDevice(devices);
                      } on PlatformException {
                        print("调用 connectionDevice 方法异常");
                      }
                      return;
                    }
                  }
                });
              } on PlatformException {
                print("调用 devices 方法异常");
              }
            },
            child: Text("搜索设备列表"),
          ),
          TextButton(
              onPressed: () {
                try {
                  YxcCast.playMusic();
                } on PlatformException {
                  print("调用 playMusic 失败");
                }
              },
              child: Text("播放音乐")),
        ],
      ),
    );
  }
}
