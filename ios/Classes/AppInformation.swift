//
//  AppInformation.swift
//  full_package
//
//  Created by Harry Pieteraerens on 05/05/2023.
//

import Foundation


import Foundation


func getAppInformation() -> String?{
    
    let appInformation = AppInformation(appVersion: UIApplication.appVersion, appBuild: UIApplication.buildVersion, appName: UIApplication.appName)
    
    var jsonString: String? = nil;
    
    do{
        let json = try JSONEncoder().encode(appInformation)
        jsonString = String(data: json, encoding: .utf8) ?? nil
    }catch {
        jsonString = nil
    }
        
    return jsonString
}


struct AppInformation: Codable{
    var appVersion: String
    var appBuild: String
    var appName: String
}


extension UIApplication{
    static var appVersion: String{
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "Error"
    }
    
    static var buildVersion: String{
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "Error"
    }
    
    static var appName: String{
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? "Error"
    }
    
    static var minimumOSVersion: String{
        return Bundle.main.object(forInfoDictionaryKey: "MinimumOSVersion") as? String ?? "Error"
    }
    
    static var supportedPlatforms: Array<String>{
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleSupportedPlatforms") as? Array ?? ["Error"]
    }
    
    static var localizations: Array<String>{
        return Bundle.main.localizations
    }
    
    static var developmentLocalization: String?{
        return Bundle.main.developmentLocalization
    }
    
    static var beta: String{
        #if DEBUG
        return "Development"
        #else
        if let url = Bundle.main.appStoreReceiptURL{
            if url.lastPathComponent == "sandboxReceipt"{
                return "Beta"
            }else{
                return "Release"
            }
        }else{
            return "Error"
        }
        #endif
    }
}
