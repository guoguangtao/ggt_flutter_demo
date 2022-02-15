import 'package:flutter/material.dart';

class YXCUseTableView extends StatelessWidget {
  const YXCUseTableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Use Table"),
      ),
      body: Center(
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          defaultColumnWidth: const FixedColumnWidth(80.0),
          border: TableBorder.all(color: Colors.blue, width: 1.0),
          children: [
            TableRow(
              children: [
                const _YXCBuildItem(text: "Row11", color: Colors.redAccent),
                const _YXCBuildItem(text: "Row12", color: Colors.orangeAccent),
                const _YXCBuildItem(text: "Row13", color: Colors.yellowAccent),
                const _YXCBuildItem(text: "Row14", color: Colors.greenAccent),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    height: 44.0,
                    color: Colors.purpleAccent,
                    alignment: Alignment.center,
                    child: const Text("Row15"),
                  ),
                )
              ],
            ),
            const TableRow(
              children: [
                _YXCBuildItem(text: "Row21", color: Colors.redAccent),
                _YXCBuildItem(text: "Row22", color: Colors.orangeAccent),
                _YXCBuildItem(text: "Row23", color: Colors.yellowAccent),
                _YXCBuildItem(text: "Row24", color: Colors.greenAccent),
                _YXCBuildItem(text: "Row25", color: Colors.purpleAccent,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _YXCBuildItem extends StatelessWidget {
  final String? text;
  final Color? color;

  const _YXCBuildItem({
    Key? key,
    this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      color: color,
      alignment: Alignment.center,
      child: Text(text ?? ""),
    );
  }
}
