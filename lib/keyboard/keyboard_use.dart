import 'package:flutter/material.dart';

class YXCKeyBoardUseView extends StatelessWidget {
  const YXCKeyBoardUseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("键盘的使用"),
      ),
      body: const _YXCUseKeyBoardBodyView(),
    );
  }
}

class _YXCUseKeyBoardBodyView extends StatelessWidget {
  const _YXCUseKeyBoardBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      color: Colors.cyan,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        content: const _YXCTextFieldDialogView(),
                      );
                    });
              },
              child: Container(
                height: 500,
                color: Colors.orange,
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "输入框",
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _YXCTextFieldDialogView extends StatelessWidget {
  const _YXCTextFieldDialogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          TextField(
            decoration: InputDecoration(
              hintText: "输入框 01",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "输入框 02",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "输入框 03",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "输入框 04",
            ),
          )
        ],
      ),
    );
  }
}
