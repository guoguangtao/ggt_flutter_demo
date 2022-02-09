
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sprintf/sprintf.dart';

/// 日志写入工具
class YXCDayLogTools {

  /// 单例*实例
  static YXCDayLogTools? _instance;
  String? _fileName;

  YXCDayLogTools._internal();
  factory YXCDayLogTools() => _getInstance();
  static YXCDayLogTools get instance => _getInstance();
  static YXCDayLogTools _getInstance() {
    _instance ??= YXCDayLogTools._internal();
    return _instance!;
  }

  Future<void> _createDir() async {
    DateTime dateTime = DateTime.now();
    String yearString = dateTime.year.toString();
    String monthString = sprintf("%02d", [dateTime.month]);
    String dayString = sprintf("%02d", [dateTime.day]);
    String hourString = sprintf("%02d", [dateTime.hour]);
    String minuteString = sprintf("%02d", [dateTime.minute]);
    String secondString = sprintf("%02d", [dateTime.second]);
    String dayFolderName = "${yearString}_${monthString}_$dayString";
    String fileName = "${hourString}_${minuteString}_$secondString";
    String logFileName = "DayLogFile";
    // 判断文件夹是否存在
    final dir = await getApplicationDocumentsDirectory();
    String pathName = dir.path;
    pathName += "/$logFileName";
    var directory = Directory(pathName);
    try {
      bool exists = await directory.exists();
      if (exists == false) {
        await directory.create();
        print("创建 $pathName 成功");
      }
      print("已经存在 $pathName");
    } catch (e) {
      print("创建 $pathName 失败");
    }
    pathName += "/$dayFolderName";
    directory = Directory(pathName);
    try {
      bool exists = await directory.exists();
      if (exists == false) {
        await directory.create();
        print("创建 $pathName 成功");
      }
      print("已经存在 $pathName");
    } catch (e) {
      print("创建 $pathName 失败");
    }
    pathName += "/$fileName.txt";
    _fileName = pathName;
  }

  /// 日志写入
  Future<void> writeLog(String logString) async {
    if (_fileName == null) {
      await _createDir();
    }
    var file = File(_fileName!);
    // 将 Log 写入到文件中
    file.writeAsStringSync(DateTime.now().toString() + " FlutterLog : " + logString + "\n", mode: FileMode.append);
    String logStr = await file.readAsString();
    print(logStr);
  }
}