import 'package:flutter/material.dart';
import 'package:ggt_flutter_demo/button/yxc_prevent_repeat_click.dart';
import 'package:ggt_flutter_demo/local_file/lebo_choose_file.dart';
import 'package:ggt_flutter_demo/local_file/lebo_file_list.dart';
import 'package:ggt_flutter_demo/tools/global_tools.dart';

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
        onTap: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isDismissible: true,
              isScrollControlled: true,
              constraints: BoxConstraints(
                minHeight: 100,
                maxHeight: AppGlobalConfigure.instance.screenHeight - 88,
              ),
              builder: (context) {
                // return const LeBoChooseFileView();
                return const LeBoFileListView(
                    chooseType: LeBoChooseType.mobileDocument);
              },);
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
