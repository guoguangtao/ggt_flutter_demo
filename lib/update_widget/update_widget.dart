import 'package:flutter/material.dart';

class YXCUpdateWidgetView extends StatelessWidget {
  const YXCUpdateWidgetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("刷新界面"),
      ),
      body: const _YXCUpdateWidgetBodyView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("加 1");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _YXCUpdateWidgetBodyView extends StatelessWidget {
  const _YXCUpdateWidgetBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          YXCUseGlobalKeyView(),
          YXCUseStreamBuilderView(),
        ],
      ),
    );
  }
}

class YXCUseGlobalKeyView extends StatefulWidget {
  const YXCUseGlobalKeyView({Key? key}) : super(key: key);

  @override
  _YXCUseGlobalKeyViewState createState() => _YXCUseGlobalKeyViewState();
}

class _YXCUseGlobalKeyViewState extends State<YXCUseGlobalKeyView> {

  int _count = 0;
  GlobalKey<_>

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("GlobalKey");
      },
      child: Container(
        height: 50,
        width: 150,
        alignment: Alignment.center,
        color: Colors.deepPurple,
        child: const Text("GlobalKey"),
      ),
    );
  }
}

class YXCUseStreamBuilderView extends StatefulWidget {
  const YXCUseStreamBuilderView({Key? key}) : super(key: key);

  @override
  _YXCUseStreamBuilderViewState createState() => _YXCUseStreamBuilderViewState();
}

class _YXCUseStreamBuilderViewState extends State<YXCUseStreamBuilderView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("StreamBuilder");
      },
      child: Container(
        height: 50,
        width: 150,
        color: Colors.orange,
        alignment: Alignment.center,
        child: const Text("StreamBuilder"),
      ),
    );
  }
}
