import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ggt_flutter_demo/native/native.dart';
import 'package:path_provider/path_provider.dart';

/// 加载本地文件
class YXCLocalFileLoadView extends StatelessWidget {
  const YXCLocalFileLoadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("加载本地文件"),
      ),
      body: const _YXCLoadLocalFileBodyView(),
    );
  }
}

class _YXCLoadLocalFileBodyView extends StatefulWidget {
  const _YXCLoadLocalFileBodyView({Key? key}) : super(key: key);

  @override
  State<_YXCLoadLocalFileBodyView> createState() =>
      _YXCLoadLocalFileBodyViewState();
}

class _YXCLoadLocalFileBodyViewState extends State<_YXCLoadLocalFileBodyView> {
  List<_YXCLocalFileModel> files = [];
  List<Widget> widgets = [];

  YXCLocalFileType isLocalFile(String? fileName) {
    if (fileName == null || fileName.isEmpty) return YXCLocalFileType.none;
    if (fileName.toLowerCase().endsWith("txt")) return YXCLocalFileType.txt;
    if (fileName.toLowerCase().endsWith("doc")) return YXCLocalFileType.word;
    if (fileName.toLowerCase().endsWith("pdf")) return YXCLocalFileType.pdf;
    if (fileName.toLowerCase().endsWith("ppt")) return YXCLocalFileType.ppt;
    if (fileName.toLowerCase().endsWith("xls")) return YXCLocalFileType.excel;
    return YXCLocalFileType.none;
  }

  void loadLocalFile() async {
    // files.removeRange(0, files.length - 1);
    if (files.isNotEmpty) {
      files.removeRange(0, files.length - 1);
    }
    if (widgets.isNotEmpty) {
      widgets.removeRange(0, widgets.length - 1);
    }
    Directory dir = await getApplicationDocumentsDirectory();
    await dir.list(recursive: true).forEach((element) {
      String filePath = element.path;
      if (isLocalFile(filePath) != YXCLocalFileType.none) {
        List<String> stringList = filePath.split("/");
        String fileName = stringList.last;
        YXCLocalFileType type = isLocalFile(filePath);
        if (type != YXCLocalFileType.none) {
          _YXCLocalFileModel fileModel = _YXCLocalFileModel(
              path: filePath, fileName: fileName, type: type);
          files.add(fileModel);
          widgets.add(GestureDetector(
              child: Text(fileName),
              onTap: () {
                print("当前点击了 $fileName 文件，文件类型为 $type");
                NativeMethod.openLocalFile(filePath);
              }));
          widgets.add(const SizedBox(height: 20));
        }
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadLocalFile();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets,
        ),
      ),
    );
  }
}

/// 文件类型
enum YXCLocalFileType {
  /// 未知类型
  none,
  /// txt 文件
  txt,
  /// pdf 文件
  pdf,
  /// word 文件
  word,
  /// excel 文件
  excel,
  /// ppt 文件
  ppt,
}

class _YXCLocalFileModel {
  final String? path;
  final String? fileName;
  final YXCLocalFileType? type;

  const _YXCLocalFileModel({this.path, this.fileName, this.type});
}
