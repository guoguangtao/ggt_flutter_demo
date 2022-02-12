import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    YXCDayLogHandler.redirectLEBLogToDocumentFolder()
    print("App 已启动")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
