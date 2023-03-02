//
//  GalleryPicker.swift
//  full_package
//
//  Created by Harry Pieteraerens on 10/02/2023.
//

import Foundation
import PhotosUI
import SwiftUI


func galleryPicker(image: Bool = true, movie: Bool = true, allowsMultipleSelection: Bool = true){
    if #available(macOS 13, *){
        let windowSheet = NSWindow()
        
        let windowController = NSHostingView(rootView: ImagePicker())
        
        windowSheet.setContentSize(NSSize(width: 750, height: 500))
        
        windowSheet.contentView = windowController
                
        NSApp.mainWindow!.beginSheet(windowSheet)
    }else{
        var allowedFileTypes: [String] = []
        
        if image{
            allowedFileTypes.append("public.image")
        }
        
        if movie{
            allowedFileTypes.append("public.movie")
        }
        
        let response = filePicker(prompt: "Select", message: "Select image", allowedFileTypes: allowedFileTypes, canChooseFiles: true, canChooseDirectories: false, allowsMultipleSelection: allowsMultipleSelection, canCreateDirectories: false)
    }
}


@available(macOS 13, *)
struct ImagePicker: NSViewControllerRepresentable {
    var image: NSImage?

    func makeNSViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 0
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateNSViewController(_ uiViewController: PHPickerViewController, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(true)
            NSApp.mainWindow?.sheets.first?.close()

            guard let provider = results.first?.itemProvider else { return }

            if provider.canLoadObject(ofClass: NSImage.self) {
                provider.loadObject(ofClass: NSImage.self) { image, _ in
//                    self.parent.image = image as? NSImage
                    print(image)
                }
            }
        }
    }
}
