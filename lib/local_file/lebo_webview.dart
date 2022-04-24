import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LeBoWebView extends StatefulWidget {
  final String? title;
  final String? url;

  const LeBoWebView({Key? key, this.title, this.url}) : super(key: key);

  @override
  State<LeBoWebView> createState() => _LeBoWebViewState();
}

class _LeBoWebViewState extends State<LeBoWebView> {
  late WebViewController _controller;

  String? text;

  @override
  void initState() {
    super.initState();
    text = widget.title;
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  void _loadTitle() async {
    String? title = await _controller.getTitle();
    setState(() {
      text = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          text ?? "",
          style: const TextStyle(
            fontSize: 18.0,
            color: Color(0xFF131415),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
        onPageFinished: (url) {
          print("加载完成:$url");
          _loadTitle();
        },
        onWebResourceError: (error) {
          print("网页加载错误:${error.failingUrl}, error:${error.description}");
        },
      ),
    );
  }
}
