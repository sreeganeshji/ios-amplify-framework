//
//  ImageHandler.swift
//  awsAmplifyTest1
//
//  Created by SreeGaneshji Bangalore Chandrashekar on 12/27/20.
//

import Foundation
import PhotosUI

class ImageHandler{
    let picker:PHPickerViewController
    
    init(){
        var configuration = PHPickerConfiguration()
        
        //selection limit 0:unlimited
        configuration.selectionLimit = 0
        
        //type images
        configuration.filter = .images
        
        picker = PHPickerViewController(configuration: configuration)

    }
    
}
