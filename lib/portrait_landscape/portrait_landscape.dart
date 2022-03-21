import 'package:flutter/material.dart';
import 'package:ggt_flutter_demo/tools/extension/string_extension.dart';
import 'package:ggt_flutter_demo/tools/widgets/yxc_widgets.dart';

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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("home_leBo_icon".localImageName()),
            FadeInImage(
              placeholder: AssetImage("home_leBo_icon".localImageName()),
              image: const NetworkImage(
                  "https://t7.baidu.com/it/u=615298619,3403416058&fm=193&f=GIF"),
            ),
            yxcNetWorkImage(
                url:
                    "https://t7.baidu.com/it/u=3276746738,705029168&fm=193&f=GIF",
                placeholder: "home_leBo_icon".localImageName()),
          ],
        ),
      ],
    );
  }
}
