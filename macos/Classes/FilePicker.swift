//
//  FilePicker.swift
//  full_package
//
//  Created by Harry Pieteraerens on 10/02/2023.
//

import Foundation



func filePicker(prompt: String, message: String, allowedFileTypes: [String], canChooseFiles: Bool, canChooseDirectories: Bool, allowsMultipleSelection: Bool, canCreateDirectories: Bool) -> String{
    let openPanel = NSOpenPanel()
    
    openPanel.prompt = prompt
    openPanel.message = message
    openPanel.allowedFileTypes = allowedFileTypes
    
    openPanel.canChooseFiles = canChooseFiles
    openPanel.canChooseDirectories = canChooseDirectories
    openPanel.canCreateDirectories = canCreateDirectories
    openPanel.allowsMultipleSelection = allowsMultipleSelection
    
    let reponse = openPanel.runModal()
    
    if reponse == .OK{
        
        do{
            let json = try JSONEncoder().encode(openPanel.urls)
            let jsonString = String(data: json, encoding: .utf8) ?? "Error 3"
            
            return jsonString
        }catch {
            return "Error 2"
        }
    }else{
        return "Error 1"
    }
}


