
import 'package:flutter/material.dart';

class YXCPortraitLandscapeView extends StatelessWidget {
  const YXCPortraitLandscapeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("横竖屏适配"),
      ),
      body: const _YXCPortraitLandscapeBodyView(),
    );
  }
}

class _YXCPortraitLandscapeBodyView extends StatelessWidget {
  const _YXCPortraitLandscapeBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        return SingleChildScrollView(
          child: _bodyWidget(context, true),
        );
      }
      return _bodyWidget(context, false);
    });
  }

  Widget _bodyWidget(BuildContext context, bool isLandscape) {
    return Column(
      children: [
        const Text(
          "横竖屏适配**顶部",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
        Container(height: 200, color: Colors.red),
        isLandscape
            ? Container(height: 100, color: Colors.orange,)
            : Expanded(
                child: Container(
                  color: Colors.orange,
                ),
              ),
        const SizedBox(height: 20),
        const Text(
          "横竖屏适配**底部",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom),
      ],
    );
  }
}
