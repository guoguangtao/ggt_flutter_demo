import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      YXCDayLogHandler.redirectLEBLogToDocumentFolder()
      let mainController = YXCMainController.init()
      let navigationController = UINavigationController(rootViewController: mainController)
      self.window.rootViewController = navigationController;
      print("App 已启动")
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
