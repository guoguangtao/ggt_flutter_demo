import 'package:flutter/material.dart';

/// 如果在首页设置 AppBar，需要 icon 在最左边显示，这时候千万别设置 actions
/// 设置了 actions 之后会导致，左边留相同宽度的空白，导致不会从最左边开始显示
class YXCAppBarUseWidget extends StatelessWidget {
  const YXCAppBarUseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 设置背景颜色
        backgroundColor: Colors.purple,
        // 设置底部阴影效果
        elevation: 0,
        // 设置标题 widget
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // 所有子 widget 都在中间排版
          children: const [
            Icon(Icons.language),
            Text("AppBar 的使用记载"),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('扫描二维码');
            },
            icon: const Icon(Icons.add),
            // 取消点击效果
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
