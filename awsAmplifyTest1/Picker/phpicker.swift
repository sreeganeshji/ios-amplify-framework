//
//  phpicker.swift
//  awsAmplifyTest1
//
//  Created by SreeGaneshji Bangalore Chandrashekar on 12/29/20.
//

import Foundation
import UIKit
import PhotosUI
import SwiftUI


struct PhotosPicker:UIViewControllerRepresentable{
    @Binding var isPresented:Bool
    @Binding var Images:[UIImage]
    
    func makeUIViewController(context: Context) ->  PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .any(of: [.images]) //filter images
        configuration.selectionLimit = 0 // select multiple images
        
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator:PHPickerViewControllerDelegate{
        private var parent: PhotosPicker
        
        init(_ parent: PhotosPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.isPresented = false
            for image in results{
                if image.itemProvider.canLoadObject(ofClass: UIImage.self){
                    image.itemProvider.loadObject(ofClass: UIImage.self) { (newImage:NSItemProviderReading?, error:Error?) in
                        if let error = error{
                            print("couldn't load images: \(error.localizedDescription)")
                        }
                        else{
                            let image = newImage as! UIImage
//                          print(image.configuration.)
                            let compressedImage = image.jpegData(compressionQuality: 0.0000001)
                            
                            self.parent.Images.append(UIImage(data: compressedImage!)!)
                        }
                    }
                }
                else{
                    print("The data is not image")
                }
            }
        }
        
    }
}
