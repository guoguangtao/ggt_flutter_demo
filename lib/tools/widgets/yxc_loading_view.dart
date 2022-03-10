import 'package:flutter/material.dart';

class YXCLoadingView extends StatelessWidget {
  const YXCLoadingView({Key? key}) : super(key: key);

  static const YXCLoadingView _loadingView = YXCLoadingView();

  void dismiss(context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
      print("dismiss Loading");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const CircularProgressIndicator(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  static show(BuildContext context) {
    showDialog(context: context, barrierDismissible: false, builder: (context) {
      return _loadingView;
    });
  }

  static hidden(context) {
    print("hidden Loading");
    _loadingView.dismiss(context);
  }
}
