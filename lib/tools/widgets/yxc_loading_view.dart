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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 32.5, right: 32.5),
            padding: const EdgeInsets.only(top: 36.0, bottom: 36.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              children: [
                Container(
                  color: Colors.transparent,
                  width: 36.0,
                  height: 36.0,
                  child: const CircularProgressIndicator(
                    color: Color(0xFF1979FF),
                    strokeWidth: 3.0,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "正在请求网络...",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Color(0xFF17181A)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static show(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return _loadingView;
        });
  }

  static hidden(context) {
    print("hidden Loading");
    _loadingView.dismiss(context);
  }
}
