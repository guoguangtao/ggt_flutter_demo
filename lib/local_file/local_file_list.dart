import 'package:flutter/material.dart';
import 'package:ggt_flutter_demo/button/yxc_prevent_repeat_click.dart';
import 'package:ggt_flutter_demo/local_file/lebo_choose_file.dart';

class YXCLocalFilesListView extends StatelessWidget {
  const YXCLocalFilesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("文件列表"),
      ),
      body: const _YXCLocalFilesListBodyView(),
    );
  }
}

class _YXCLocalFilesListBodyView extends StatelessWidget {
  const _YXCLocalFilesListBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: YXCPreventRepeatClickButton(
        delay: 10,
        onTap: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isDismissible: false,
              builder: (context) {
                return const LeBoChooseFileView();
              });
        },
        child: Container(
          color: Colors.orange,
          alignment: Alignment.center,
          width: 200,
          height: 50,
          child: const Text("选择文件"),
        ),
      ),
    );
  }
}
