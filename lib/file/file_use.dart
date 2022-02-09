
import 'package:flutter/material.dart';
import 'package:ggt_flutter_demo/file/day_log_tools.dart';

/// 文件读写模块
class YXCFileUseView extends StatelessWidget {
  const YXCFileUseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("文件读写操作"),
      ),
      body: const _YXCFileUseBodyView(),
    );
  }
}

class _YXCFileUseBodyView extends StatelessWidget {
  const _YXCFileUseBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    YXCDayLogTools.instance.writeLog(DateTime.now().toString());

    return Container();
  }
}

