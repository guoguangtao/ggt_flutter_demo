
import 'package:flutter/material.dart';

class YXCUsePageView extends StatelessWidget {
  const YXCUsePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PageView"),),
      body: _YXCPageViewContentView(),
    );
  }

  Widget _YXCPageViewContentView() {
    print("----");
    return PageView(
      children: [
        Container(child: ListView.builder(itemCount: 30, itemBuilder: (context, index) {
          return SizedBox(height: 50, child: Text("$index"));
        })),
        Container(child: ListView.builder(itemCount: 30, itemBuilder: (context, index) {
          return SizedBox(height: 50, child: Text("$index"));
        })),
        Container(child: ListView.builder(itemCount: 30, itemBuilder: (context, index) {
          return SizedBox(height: 50, child: Text("$index"));
        })),
      ],
    );
  }
}
