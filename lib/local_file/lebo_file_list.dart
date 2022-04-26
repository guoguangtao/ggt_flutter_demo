import 'package:flutter/material.dart';
import 'package:ggt_flutter_demo/local_file/lebo_choose_file.dart';
import 'package:ggt_flutter_demo/tools/global_tools.dart';

class LeBoFileListView extends StatelessWidget {
  final LeBoChooseType? chooseType;

  const LeBoFileListView({Key? key, this.chooseType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: AppGlobalConfigure.instance.screenHeight - 88,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 19,
            child: GestureDetector(
              child: const Icon(Icons.arrow_back_ios),
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
          ),
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
              children: const [
                SizedBox(height: 20),
                Text(
                  "手机文档",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF131415),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
