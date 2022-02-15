import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YXCUseTimerView extends StatefulWidget {
  const YXCUseTimerView({Key? key}) : super(key: key);

  @override
  State<YXCUseTimerView> createState() => _YXCUseTimerViewState();
}

class _YXCUseTimerViewState extends State<YXCUseTimerView> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => YXCCountProvider()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("定时器的使用"),
        ),
        body: const _YXCUseTimerCustomerView(),
      ),
    );
  }
}

class _YXCUseTimerCustomerView extends StatefulWidget {
  const _YXCUseTimerCustomerView({Key? key}) : super(key: key);

  @override
  State<_YXCUseTimerCustomerView> createState() =>
      _YXCUseTimerCustomerViewState();
}

class _YXCUseTimerCustomerViewState extends State<_YXCUseTimerCustomerView> {
  @override
  Widget build(BuildContext context) {
    return const _LeBoUseTimerBodyView();
  }
}

class _LeBoUseTimerBodyView extends StatefulWidget {
  const _LeBoUseTimerBodyView({Key? key}) : super(key: key);

  @override
  State<_LeBoUseTimerBodyView> createState() => _LeBoUseTimerBodyViewState();
}

class _LeBoUseTimerBodyViewState extends State<_LeBoUseTimerBodyView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(builder:
              (BuildContext context, YXCCountProvider provider, Widget? child) {
            debugPrint("监听文本改变:${provider.count}");
            return Text("${provider.count}");
          }),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              Provider.of<YXCCountProvider>(context, listen: false)
                  .startTimer();
            },
            child: const Text("开启定时器"),
          ),
        ],
      ),
    );
  }
}

class YXCCountProvider extends ChangeNotifier {
  int _count = 60;
  Timer? _timer;

  int get count => _count;

  void _countDown() {
    _count--;
    if (_count == 0) {
      _count = 60;
    }
    debugPrint("定时器:$_count");
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
    _count = 60;
  }

  void startTimer() {
    _timer ??= Timer.periodic(const Duration(seconds: 1), (timer) {
        _countDown();
        if (count == 60) {
          _timer?.cancel();
        }
      });
  }
}
