import UIKit
import Flutter
import LBLelinkKit

let LBAPPID = "20";
let LBSECRETKEY = "a20b4b19e6da15f95464af0e4aa59564";

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      DispatchQueue.global().async {
          do {
              let result: () = try LBLelinkKit.auth(withAppid: LBAPPID, secretKey: LBSECRETKEY)
              print("乐播授权结果-\(result)");
          } catch let error as NSError {
              print(error);
          } catch {
              print("others");
          }
      }
      YXCDayLogHandler.redirectLEBLogToDocumentFolder()
      let mainController = YXCMainController.init()
      let navigationController = UINavigationController(rootViewController: mainController)
      self.window.rootViewController = navigationController;
      print("App 已启动")
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
