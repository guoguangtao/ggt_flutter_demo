import 'package:flutter/material.dart';

class YXCPreventRepeatClickView extends StatelessWidget {
  const YXCPreventRepeatClickView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("按钮防止重复点击"),
      ),
      body: const _YXCPreventRepeatClickBodyView(),
    );
  }
}

class _YXCPreventRepeatClickBodyView extends StatefulWidget {
  const _YXCPreventRepeatClickBodyView({Key? key}) : super(key: key);

  @override
  State<_YXCPreventRepeatClickBodyView> createState() =>
      _YXCPreventRepeatClickBodyViewState();
}

class _YXCPreventRepeatClickBodyViewState
    extends State<_YXCPreventRepeatClickBodyView> {
  String text = "防止重复点击";
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 200, color: Colors.orange),
            Container(
              height: 100,
              color: Colors.indigo,
              child: YXCPreventRepeatClickButton(
                child: Text(text),
                delay: 15,
                onTap: () {
                  setState(() {
                    text = "按钮被点击+${count++}";
                  });
                },
              ),
            ),
            Container(height: 300, color: Colors.amberAccent,),
            Container(height: 300, color: Colors.pinkAccent,),
            Container(height: 300, color: Colors.cyan,),
            Container(height: 300, color: Colors.indigoAccent,),
          ],
        ),
      ),
    );
  }
}

/// 防止重复点击按钮
class YXCPreventRepeatClickButton extends StatefulWidget {
  final VoidCallback? onTap;
  final int? delay;
  final Widget? child;

  const YXCPreventRepeatClickButton(
      {Key? key, this.child, this.onTap, this.delay})
      : super(key: key);

  @override
  State<YXCPreventRepeatClickButton> createState() =>
      _YXCPreventRepeatClickButtonState();
}

class _YXCPreventRepeatClickButtonState
    extends State<YXCPreventRepeatClickButton> {
  bool enable = true;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        count++;
        if (enable == false) return;
        if (widget.onTap == null) return;
        if (widget.delay != null) {
          enable = false;
          Future.delayed(Duration(seconds: widget.delay!), () {
            enable = true;
          });
        }
        widget.onTap!();
      },
      child: widget.child,
    );
  }
}
