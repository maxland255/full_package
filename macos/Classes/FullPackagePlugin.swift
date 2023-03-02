import Cocoa
import FlutterMacOS

public class FullPackagePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "full_package", binaryMessenger: registrar.messenger)
    let instance = FullPackagePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
        
    case "getAppInformation":
        result(getAppInformation())
    case "alertMessage":
        let args = call.arguments as? Dictionary<String, Any>
        
        let title = args?["title"] as? String
        let message = args?["message"] as? String
        let alertStyle = args?["alertStyle"] as? String
        
        if let title = title, let message = message, let alertStyle = alertStyle{
            alertMessage(title: title, message: message, alertStyle: alertStyle)
            
            result(nil)
        }else{
            result("Error")
        }
    case "alertButton":
        let args = call.arguments as? Dictionary<String, Any>
        
        let title = args?["title"] as? String
        let message = args?["message"] as? String
        let alertStyle = args?["alertStyle"] as? String
        let button = args?["button"] as? [String]
        
        if let title = title, let message = message, let alertStyle = alertStyle, let button = button{
            let button = alertButton(title: title, message: message, alertStyle: alertStyle, button: button)
            
            result(button)
        }else{
            result("Error")
        }
        
    case "filePicker":
        let args = call.arguments as? Dictionary<String, Any>
        
        let prompt = args?["prompt"] as? String
        let message = args?["message"] as? String
        let allowedFileTypes = args?["allowedFileTypes"] as? [String]
        let canChooseFiles = args?["canChooseFiles"] as? Bool
        let canChooseDirectories = args?["canChooseDirectories"] as? Bool
        let allowsMultipleSelection = args?["allowsMultipleSelection"] as? Bool
        let canCreateDirectories = args?["canCreateDirectories"] as? Bool
        
        if let prompt = prompt, let message = message, let allowedFileTypes = allowedFileTypes, let canChooseFiles = canChooseFiles, let canChooseDirectories = canChooseDirectories, let allowsMultipleSelection = allowsMultipleSelection, let canCreateDirectories = canCreateDirectories{
            let response = filePicker(prompt: prompt, message: message, allowedFileTypes: allowedFileTypes, canChooseFiles: canChooseFiles, canChooseDirectories: canChooseDirectories, allowsMultipleSelection: allowsMultipleSelection, canCreateDirectories: canCreateDirectories)
            
            result(response)
            
            galleryPicker()
        }else{
            result("Error")
        }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
