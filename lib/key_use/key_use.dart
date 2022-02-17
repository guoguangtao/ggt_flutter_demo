
import 'dart:math';

import 'package:flutter/material.dart';

class YXCUseKeyView extends StatelessWidget {
  const YXCUseKeyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Key 的使用"),
      ),
      body: const _YXCUseKeyBodyView(),
    );
  }
}

class _YXCUseKeyBodyView extends StatefulWidget {
  const _YXCUseKeyBodyView({Key? key}) : super(key: key);

  @override
  State<_YXCUseKeyBodyView> createState() => _YXCUseKeyBodyViewState();
}

class _YXCUseKeyBodyViewState extends State<_YXCUseKeyBodyView> {

  List<Widget> widgets = [
    _YXCBodyView(key: const ValueKey("1"), myColor: YXCColor.randomColor(),),
    _YXCBodyView(key: const ValueKey("2"), myColor: YXCColor.randomColor(),),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          widgets.insert(1, widgets.removeAt(0));
        });
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: widgets,
        ),
      ),
    );
  }
}

class _YXCBodyView extends StatelessWidget {
  final Color? myColor;
  const _YXCBodyView({Key? key, this.myColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColor,
      child: const Padding(
        padding: EdgeInsets.all(70.0),
      ),
    );
  }
}

class YXCColor {
  static final Random _random = Random();

  static Color randomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(255),
      _random.nextInt(255),
      _random.nextInt(255),
    );
  }
}

