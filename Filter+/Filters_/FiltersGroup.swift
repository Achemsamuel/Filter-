//
//  FiltersGroup.swift
//  Filter+
//
//  Created by Achem Samuel on 3/3/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import CoreImage
import UIKit


class Sepia : CIFilter {
    
    func applySepiaFIlter (image : CIImage) -> UIImage {
        
//        var finalImage = UIImage()
        
        let sepiaFIlter = image.applyingFilter("CISepiaTone", parameters: [kCIInputIntensityKey: 0.5])
        
        let filteredImage = UIImage(ciImage: sepiaFIlter)

        return filteredImage
    }
    
    
    
}
