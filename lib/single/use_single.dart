/*全局配置单例*/
class AppConfig {
  /// 创建一个静态变量
  static AppConfig? _instance;

  /// 构造方法
  factory AppConfig() => _getInstance();

  /// 获取单例对象
  static AppConfig get instance => _getInstance();

  /// 创建一个单例对象
  static AppConfig _getInstance() {
    // 对静态变量进行初始化
    _instance ??= AppConfig._init();
    return _instance!;
  }

  /// 定义一个命名构造函数，可在这个方法里面进行一些初始化操作
  AppConfig._init();
}
