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
    
    func makeUIViewController(context: Context) ->  PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .any(of: [.images]) //filter images
        configuration.selectionLimit = 0 // select multiple images
        
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
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
            
        }
        
    }
}
