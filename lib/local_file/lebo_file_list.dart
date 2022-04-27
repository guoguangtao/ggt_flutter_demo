import 'package:flutter/material.dart';
import 'package:ggt_flutter_demo/local_file/lebo_choose_file.dart';

class LeBoFileListView extends StatelessWidget {
  final LeBoChooseType? chooseType;

  const LeBoFileListView({Key? key, this.chooseType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            indexCallback: (index, text) {
              print("选中下标回调: $index, $text");
            },
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

  const LeBoFileListTopMenuView({
    Key? key,
    this.titles,
    this.height,
    this.backgroundColor,
    this.normalTextStyle,
    this.selectedTextStyle,
    this.indexCallback,
    this.selectedLineColor,
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

  @override
  void initState() {
    super.initState();

    if (widget.titles != null) {
      models = [];
      for (int i = 0; i < widget.titles!.length; i++) {
        String element = widget.titles![i];
        _LeBoFileListItemModel model =
            _LeBoFileListItemModel(i, i == 0, element);
        if (i == 0) {
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
    models.forEach((element) {
      titleWidgets.add(_LeBoFileListMenuItem(
        model: element,
        normalTextStyle: widget.normalTextStyle,
        selectedTextStyle: widget.selectedTextStyle,
        indexCallback: (model) {
          if (model == selectedModel) return;
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
    });

    return Container(
      height: widget.height ?? 43,
      color: widget.backgroundColor ?? Colors.white,
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(mainAxisSize: MainAxisSize.max, children: titleWidgets),
      ),
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
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (indexCallback != null) {
                  indexCallback!(model!);
                }
              },
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                color: Colors.transparent,
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
