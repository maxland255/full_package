import Flutter
import UIKit
import NotificationCenter

public class FullPackagePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "full_package", binaryMessenger: registrar.messenger())
    let instance = FullPackagePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method{
      case "getPlatformVersion":
          result("iOS " + UIDevice.current.systemVersion)
      case "getAppInformation":
              result(getAppInformation())
      case "openAppSettingsURL":
          if #available(iOS 16.0, *) {
              if let url = URL(string: UIApplication.openNotificationSettingsURLString){
                  UIApplication.shared.open(url) { success in
                      result(success)
                  }
              }else{
                  result(false)
              }
          } else {
              if let url = URL(string: UIApplication.openSettingsURLString){
                  UIApplication.shared.open(url) { success in
                      result(success)
                  }
              }else{
                  result(false)
              }
          }
      case "openNotificationSettingsURL":
          if #available(iOS 16.0, *) {
              if let url = URL(string: UIApplication.openNotificationSettingsURLString){
                  UIApplication.shared.open(url) { success in
                      result(success)
                  }
              }else{
                  result(false)
              }
          } else if #available(iOS 15.4, *) {
              if let url = URL(string: UIApplicationOpenNotificationSettingsURLString){
                  UIApplication.shared.open(url) { success in
                      result(success)
                  }
              }else{
                  result(false)
              }
          }else{
              result(FlutterError(code: "Open Notification Settings", message: "This function is only available for iOS 15.4 or newer", details: nil))
          }
      default:
          result(FlutterMethodNotImplemented)
      }
  }
}
