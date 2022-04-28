import 'package:flutter/material.dart';
import 'package:ggt_flutter_demo/local_file/lebo_choose_file.dart';

class LeBoFileListView extends StatefulWidget {
  final LeBoChooseType? chooseType;

  const LeBoFileListView({Key? key, this.chooseType}) : super(key: key);

  @override
  State<LeBoFileListView> createState() => _LeBoFileListViewState();
}

class _LeBoFileListViewState extends State<LeBoFileListView> {
  late int selectedIndex;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    _pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    print("LeBoFileListView 当前选中下标为:$selectedIndex");

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          // 顶部标题栏目
          Row(
            children: [
              SizedBox(
                width: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 15,
                        color: Color(0xFF363A40),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  "手机文档",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                    color: Color(0xFF131415),
                  ),
                ),
              ),
              SizedBox(
                width: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        color: Colors.orangeAccent,
                        width: 25,
                        height: 25,
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          LeBoFileListTopMenuView(
            titles: ["全部", "PPT", "DOC", "XLS", "PDF", "TXT"],
            selectedIndex: selectedIndex,
            indexCallback: (index, text) {
              print("选中下标回调: $index, $text");
              setState(() {
                selectedIndex = index;
                _pageController.jumpToPage(selectedIndex);
              });
            },
          ),
          SizedBox(height: 20),
          Container(
            height: 44,
            margin: EdgeInsets.only(left: 15, right: 15, top: 4, bottom: 4),
            decoration: BoxDecoration(
              color: Color(0xFFF2F6F9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 12),
                Icon(Icons.search, size: 20, color: Color(0xFF899099)),
                SizedBox(width: 12),
                Text(
                  "搜索",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF899099),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: _LeBoFileListBodyView(
              titles: ["全部", "PPT", "DOC", "XLS", "PDF", "TXT"],
              selectedIndex: selectedIndex,
              pageController: _pageController,
              onPageChanged: (index) {
                setState(
                  () {
                    selectedIndex = index;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// 下标回调
typedef LeBoIndexCallback = void Function(int index, String? title);

class LeBoFileListTopMenuView extends StatefulWidget {
  /// menu 字符串数组
  final List<String>? titles;

  /// menu 高度
  final double? height;

  /// menu 背景颜色
  final Color? backgroundColor;

  /// menu 字体属性
  final TextStyle? normalTextStyle;

  /// menu 选中字体属性
  final TextStyle? selectedTextStyle;

  /// menu 选中下标发生改变
  final LeBoIndexCallback? indexCallback;

  /// menu 选中颜色
  final Color? selectedLineColor;

  /// 底部分割线颜色
  final Color? bottomDividerColor;

  /// 选中的下标
  final int? selectedIndex;

  const LeBoFileListTopMenuView({
    Key? key,
    this.titles,
    this.height,
    this.backgroundColor,
    this.normalTextStyle,
    this.selectedTextStyle,
    this.indexCallback,
    this.selectedLineColor,
    this.bottomDividerColor,
    this.selectedIndex,
  }) : super(key: key);

  @override
  State<LeBoFileListTopMenuView> createState() =>
      _LeBoFileListTopMenuViewState();
}

class _LeBoFileListTopMenuViewState extends State<LeBoFileListTopMenuView> {
  /// menuItem 数组
  late List<_LeBoFileListMenuItem> titleWidgets;

  /// 数据源
  late List<_LeBoFileListItemModel> models;

  /// 当前选中的模型
  late _LeBoFileListItemModel selectedModel;

  late int selectedIndex;

  @override
  void initState() {
    super.initState();

    if (widget.titles != null) {
      models = [];
      selectedIndex = widget.selectedIndex ?? 0;
      for (int i = 0; i < widget.titles!.length; i++) {
        String element = widget.titles![i];
        _LeBoFileListItemModel model =
            _LeBoFileListItemModel(i, i == 0, element);
        if (i == selectedIndex) {
          selectedModel = model;
        }
        models.add(model);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // 重新布局
    titleWidgets = [];
    selectedIndex = widget.selectedIndex ?? 0;
    print("LeBoFileListTopMenuView 当前选中下标为:$selectedIndex");

    for (int i = 0; i < models.length; i++) {
      _LeBoFileListItemModel element = models[i];
      element.isSelected = i == selectedIndex;
      titleWidgets.add(_LeBoFileListMenuItem(
        model: element,
        normalTextStyle: widget.normalTextStyle,
        selectedTextStyle: widget.selectedTextStyle,
        indexCallback: (model) {
          int index = models.indexOf(model);
          if (index == selectedIndex) return;
          setState(() {
            selectedModel.isSelected = false;
            selectedModel = model;
            selectedModel.isSelected = true;
          });
          if (widget.indexCallback != null) {
            widget.indexCallback!(model.index, model.text);
          }
        },
      ));
    }

    return Column(
      children: [
        Container(
          height: widget.height ?? 43,
          color: widget.backgroundColor ?? Colors.white,
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(mainAxisSize: MainAxisSize.max, children: titleWidgets),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Container(
              color: widget.bottomDividerColor ?? Color(0xFFE6E8EB),
              height: 0.5),
        ),
      ],
    );
  }
}

class _LeBoFileListMenuItem extends StatelessWidget {
  final _LeBoFileListItemModel? model;

  /// menu 字体属性
  final TextStyle? normalTextStyle;

  /// menu 选中字体属性
  final TextStyle? selectedTextStyle;

  /// menu 选中下划线颜色
  final Color? selectedLineColor;

  /// 索引发生变化回调
  final Function(_LeBoFileListItemModel model)? indexCallback;

  const _LeBoFileListMenuItem({
    Key? key,
    this.model,
    this.normalTextStyle,
    this.selectedTextStyle,
    this.indexCallback,
    this.selectedLineColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;
    TextStyle selectedStyle;

    textStyle =
        normalTextStyle ?? TextStyle(fontSize: 16.0, color: Color(0xFF6D7480));
    selectedStyle = selectedTextStyle ??
        TextStyle(
            fontSize: 16.0,
            color: Color(0xFF131415),
            fontWeight: FontWeight.w600);
    textStyle = model!.isSelected == true ? selectedStyle : textStyle;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                print("${model!.text} 被点击");
                if (indexCallback != null) {
                  indexCallback!(model!);
                }
              },
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
                height: 41,
                child: Text(model!.text, style: textStyle),
              ),
            ),
          ],
        ),
        Container(
          color: model!.isSelected == true
              ? (selectedLineColor ?? Color(0xFF1979FF))
              : Colors.transparent,
          height: 2,
          width: 16,
        ),
      ],
    );
  }
}

class _LeBoFileListItemModel {
  int index;
  bool isSelected;
  String text;

  _LeBoFileListItemModel(this.index, this.isSelected, this.text);
}

class _LeBoFileListBodyView extends StatelessWidget {
  final List<String>? titles;
  final int? selectedIndex;
  final ValueChanged<int>? onPageChanged;
  final PageController? pageController;

  const _LeBoFileListBodyView({
    Key? key,
    this.titles,
    this.onPageChanged,
    this.selectedIndex,
    this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("_LeBoFileListBodyView 当前选中下标为:$selectedIndex");

    return PageView.builder(
        itemCount: 6,
        controller: pageController,
        onPageChanged: (index) {
          if (onPageChanged != null) {
            onPageChanged!(index);
          }
        },
        itemBuilder: (context, index) {
          return _LeBoFileListBodyPageView(
            title: titles![index],
          );
        });
  }
}

class _LeBoFileListBodyPageView extends StatelessWidget {
  final String? title;

  const _LeBoFileListBodyPageView({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(title ?? ""),
    );
  }
}
