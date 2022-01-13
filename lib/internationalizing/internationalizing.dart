import 'package:flutter/material.dart';
import 'package:ggt_flutter_demo/common/app_setting_config.dart';
import 'package:ggt_flutter_demo/generated/l10n.dart';

/// 国际化与多语言
class YXCInternationalizing extends StatelessWidget {
  const YXCInternationalizing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('国际化与多语言'),
      ),
      body: const _YXCInternationalizingBody(),
    );
  }
}

class _YXCInternationalizingBody extends StatefulWidget {
  const _YXCInternationalizingBody({Key? key}) : super(key: key);

  @override
  _YXCInternationalizingBodyState createState() =>
      _YXCInternationalizingBodyState();
}

class _YXCInternationalizingBodyState
    extends State<_YXCInternationalizingBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.orange,
            child: Text(S.of(context).Internationalization_and_multilingualism),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    AppSetting.instance.changedLocale(const Locale('en'));
                  },
                  child: const Text('英语')),
              const SizedBox(width: 100),
              ElevatedButton(
                  onPressed: () {
                    AppSetting.instance.changedLocale(const Locale('zh'));
                  },
                  child: const Text('中文')),
            ],
          ),
        ],
      ),
    );
  }
}
