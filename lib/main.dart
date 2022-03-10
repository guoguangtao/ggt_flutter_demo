
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ggt_flutter_demo/Provide/provider_use.dart';
import 'package:ggt_flutter_demo/appbar/appbar_use.dart';
import 'package:ggt_flutter_demo/box_constraints/box_constraints.dart';
import 'package:ggt_flutter_demo/common/app_setting_config.dart';
import 'package:ggt_flutter_demo/file/day_log_tools.dart';
import 'package:ggt_flutter_demo/file/file_use.dart';
import 'package:ggt_flutter_demo/generated/l10n.dart';
import 'package:ggt_flutter_demo/image/image_use.dart';
import 'package:ggt_flutter_demo/internationalizing/internationalizing.dart';
import 'package:ggt_flutter_demo/key_use/key_use.dart';
import 'package:ggt_flutter_demo/keyboard/keyboard_use.dart';
import 'package:ggt_flutter_demo/loading/use_loading.dart';
import 'package:ggt_flutter_demo/scrollview/scroll_view_use.dart';
import 'package:ggt_flutter_demo/table/table_use.dart';
import 'package:ggt_flutter_demo/timer/timer_use.dart';
import 'package:ggt_flutter_demo/update_widget/update_widget.dart';

// void main() => runApp(const _YXCApp());

void main() {
  YXCDayLogTools.instance;
  runApp(const _YXCApp());
}

class _YXCApp extends StatelessWidget {
  const _YXCApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _YXCAppContent();
  }
}

class _YXCAppContent extends StatefulWidget {
  const _YXCAppContent({Key? key}) : super(key: key);

  @override
  _YXCAppContentState createState() => _YXCAppContentState();
}

class _YXCAppContentState extends State<_YXCAppContent> {

  @override
  void initState() {
    super.initState();

    AppSetting.instance.changedLocale = (Locale locale) {
      setState(() {
        AppSetting.instance.selectedLocale = locale;
      });
    };
  }

  Locale getSystemLocal(Locale? locale, Iterable<Locale> supportedLocales) {
    if (locale == null) {
      // locale 为空就返回中文
      return const Locale('zh');
    }
    var result = supportedLocales
        .where((element) => element.languageCode == locale.languageCode);
    if (result.isNotEmpty) {
      return locale;
    }
    // 当设置语言之后，发现没有支持的语言就默认中文
    return const Locale('zh');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/Internationalizing": (context) => const YXCInternationalizing(),
        "/UseAppBar" : (context) => const YXCAppBarUseWidget(),
        "/DataProvide" : (context) => const YXCProviderWidget(),
        "/UseTimer" : (context) => const YXCUseTimerView(),
        "/UseFile" : (context) => const YXCFileUseView(),
        "/BoxConstraints" : (context) => const YXCBoxConstraints(),
        "/CustomScrollView" : (context) => const YXCUseCustomScrollView(),
        "/Table" : (context) => const YXCUseTableView(),
        "/UseKey" : (context) => const YXCUseKeyView(),
        "/UpdateView" : (context) => const YXCUpdateWidgetView(),
        "/LoadImage" : (context) => const YXCUseImageView(),
        "/UseKeyBoard" : (context) => const YXCKeyBoardUseView(),
        "/NetLoading" : (context) => const YXCUseLoadingView(),
      },
      home: const _YXCHome(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: AppSetting.instance.selectedLocale,
      localeResolutionCallback: (Locale? locales, Iterable<Locale> supportedLocales){
        if (AppSetting.instance.selectedLocale != null) {
          return AppSetting.instance.selectedLocale;
        }
        Locale myLocale = getSystemLocal(locales, supportedLocales);
        AppSetting.instance.selectedLocale = myLocale;
        return AppSetting.instance.selectedLocale;
      },
    );
  }
}

class _YXCHome extends StatelessWidget {
  const _YXCHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<_YXCHomeModel> models = const [
      _YXCHomeModel(text: '国际化与多语言', route: "/Internationalizing"),
      _YXCHomeModel(text: 'AppBar 的使用记载', route: "/UseAppBar"),
      _YXCHomeModel(text: "状态管理", route: "/DataProvide"),
      _YXCHomeModel(text: "定时器使用", route: "/UseTimer"),
      _YXCHomeModel(text: "文件读写操作", route: "/UseFile"),
      _YXCHomeModel(text: "盒子协议(BoxConstraints)", route: "/BoxConstraints"),
      _YXCHomeModel(text: "Use CustomScrollView", route: "/CustomScrollView"),
      _YXCHomeModel(text: "Use Table", route: "/Table"),
      _YXCHomeModel(text: "Use Key", route: "/UseKey"),
      _YXCHomeModel(text: "刷新View的几种方式", route: "/UpdateView"),
      _YXCHomeModel(text: "加载图片", route: "/LoadImage"),
      _YXCHomeModel(text: "键盘的使用", route: "/UseKeyBoard"),
      _YXCHomeModel(text: "网络加载动画", route: "/NetLoading"),
    ];

    void didSelected(int index) {
      final model = models[index];
      print("跳转 ${model.text}");
      if (model.route != null) {
        Navigator.of(context).pushNamed(model.route!);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Demo',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.separated(itemBuilder: (BuildContext context, int index) {
        return _YXCHomeListCell(model: models[index], onTap: (){
          didSelected(index);
        },);
      }, separatorBuilder: (BuildContext context, int index) {
        return Container(height: 0.5, color: Colors.black45, margin: const EdgeInsets.only(left: 20),);
      }, itemCount: models.length)
    );
  }
}

class _YXCHomeListCell extends StatelessWidget {
  final _YXCHomeModel? model;
  final VoidCallback? onTap;

  const _YXCHomeListCell({
    Key? key,
    this.model,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        height: 44,
        child: Text(model?.text ?? ""),
      ),
    );
  }
}

class _YXCHomeModel {
  final String? text;
  final String? route;

  const _YXCHomeModel({
    this.text,
    this.route,
  });
}
