import 'package:flutter/material.dart';
import 'package:ggt_flutter_demo/button/yxc_prevent_repeat_click.dart';
import 'package:ggt_flutter_demo/local_file/lebo_file_list.dart';
import 'package:ggt_flutter_demo/tools/global_tools.dart';

class LeBoChooseFileView extends StatelessWidget {
  const LeBoChooseFileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppGlobalConfigure.instance.screenBottomPadding + 274,
      decoration: const BoxDecoration(
        color: Color(0xFFF2F6F9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 20,
            top: 19,
            child: GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Container(
                height: 25,
                width: 25,
                color: Colors.amberAccent,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "选择文件",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF131415),
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  width: AppGlobalConfigure.instance.screenWidth,
                  height: 200,
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 16,
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 32),
                    childAspectRatio: 52.0 / 75.0,
                    children: [
                      fileChooseItem("微信文件"),
                      fileChooseItem("钉钉文件"),
                      fileChooseItem("QQ文件"),
                      fileChooseItem("手机文档", onTap: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return const LeBoFileListView(
                                chooseType: LeBoChooseType.mobileDocument);
                          },
                        );
                      }),
                      fileChooseItem("手机相册"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget fileChooseItem(String text, {VoidCallback? onTap}) {
    return YXCPreventRepeatClickButton(
      delay: 10,
      onTap: () {
        print("选择 $text");
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 20,
        height: 20,
        child: Column(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13.87),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              text,
              style: const TextStyle(color: Color(0xFF363A40), fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}

enum LeBoChooseType {
  weChat,
  dingTalk,
  qq,
  mobileDocument,
  mobilePicture,
}
