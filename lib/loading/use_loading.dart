
import 'package:flutter/material.dart';
import 'package:ggt_flutter_demo/tools/widgets/yxc_loading_view.dart';

class YXCUseLoadingView extends StatelessWidget {
  const YXCUseLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("加载动画"),
      ),
      body: const _YXCUseLoadingBodyView(),
    );
  }
}

class _YXCUseLoadingBodyView extends StatelessWidget {
  const _YXCUseLoadingBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          YXCLoadingView.show(context);
          Future.delayed(const Duration(seconds: 5), () {
            YXCLoadingView.hidden(context);
          });
        },
        child: Container(
          color: Colors.orange,
          width: 150,
          height: 50,
        ),
      ),
    );
  }
}

