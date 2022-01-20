import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YXCProviderWidget extends StatelessWidget {
  const YXCProviderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListProviderModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Provider 使用"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<ListProviderModel>(
                builder: (context, notifier, child) {
                  return Text("${notifier.count}");
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const YXCSecondWidget(),
              const SizedBox(
                height: 20,
              ),
              const YXCAddWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class YXCSecondWidget extends StatelessWidget {
  const YXCSecondWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Consumer<ListProviderModel>(
        builder:
            (BuildContext context, ListProviderModel value, Widget? child) {
          return Text("${value.count}");
        },
      ),
    );
  }
}

class YXCAddWidget extends StatelessWidget {
  const YXCAddWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      color: Colors.blueAccent,
      child: GestureDetector(
        onTap: () {
          Provider.of<ListProviderModel>(context, listen: false).summer();
        },
        child: const Center(child: Text("增加")),
      ),
    );
  }
}

class ListProviderModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void summer() {
    _count++;
    notifyListeners();
  }
}
