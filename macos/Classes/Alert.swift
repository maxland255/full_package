//
//  Alert.swift
//  full_package
//
//  Created by Harry Pieteraerens on 10/02/2023.
//

import Foundation


func alertMessage(title: String, message: String, alertStyle: String){
    let alert = NSAlert()
    
    alert.messageText = title
    alert.informativeText = message
    
    switch alertStyle{
    case "informational":
        alert.alertStyle = .informational
    case "critical":
        alert.alertStyle = .critical
    case "warning":
        alert.alertStyle = .warning
        
    default: alert.alertStyle = .informational
    }
    
    alert.runModal()
}

func alertButton(title: String, message: String, alertStyle: String, button: [String]) -> String{
    
    let alert = NSAlert()
    
    alert.messageText = title
    alert.informativeText = message
    
    switch alertStyle{
    case "informational":
        alert.alertStyle = .informational
    case "critical":
        alert.alertStyle = .critical
    case "warning":
        alert.alertStyle = .warning
        
    default: alert.alertStyle = .informational
    }
    
    if button.count > 3{
        alert.messageText = "Error FullPackage"
        alert.informativeText = "Please add maximum 3 button"
        alert.alertStyle = .critical
        
        alert.runModal()
        
        return "Error please add maximum 3 button"
    }
    
    for b in button{
        alert.addButton(withTitle: b)
    }
    
    let response = alert.runModal()
        
    return response.rawValue.description
}
