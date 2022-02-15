import 'package:flutter/material.dart';

class YXCBoxConstraints extends StatelessWidget {
  const YXCBoxConstraints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("盒子协议 BoxConstraints"),
      ),
      body: const _YXCBoxConstraintsBodyView(),
    );
  }
}

class _YXCBoxConstraintsBodyView extends StatelessWidget {
  const _YXCBoxConstraintsBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 100,
              minHeight: 20,
              maxWidth: 200,
              maxHeight: 200,
            ),
            // Container 在没有子组件的情况下会根据约束，尽可能的扩展到最大宽度和高度
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 100,
              minHeight: 100,
              maxHeight: 200,
              maxWidth: 200,
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Text(
                "Container设置了子组件后，会根据约束设置适应的宽度和高度",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
