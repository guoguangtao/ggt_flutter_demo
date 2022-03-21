import 'package:flutter/material.dart';
import 'package:ggt_flutter_demo/tools/extension/string_extension.dart';
import 'package:ggt_flutter_demo/tools/widgets/yxc_widgets.dart';

class YXCUseImageView extends StatelessWidget {
  const YXCUseImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("图片的使用"),
      ),
      body: const _YXCUserImageBodyView(),
    );
  }
}

class _YXCUserImageBodyView extends StatelessWidget {
  const _YXCUserImageBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("home_leBo_icon".localImageName()),
          const SizedBox(height: 20),
          FadeInImage(
            placeholder: AssetImage("home_leBo_icon".localImageName()),
            image: const NetworkImage(
                "https://t7.baidu.com/it/u=615298619,3403416058&fm=193&f=GIF"),
          ),
          const SizedBox(height: 20),
          yxcNetWorkImage(
              url:
                  "https://t7.baidu.com/it/u=3276746738,705029168&fm=193&f=GIF",
              placeholder: "home_leBo_icon".localImageName()),
        ],
      ),
    );
  }
}
