//
//  ImageConverter.swift
//  Filter+
//
//  Created by Achem Samuel on 3/4/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//


import UIKit

class ImageConverter {
    
    func convertCIImageToUIImage (image : CIImage) -> UIImage
        
    {
        
        let context : CIContext = CIContext.init(options: nil)
        let cgImage : CGImage = context.createCGImage(image, from: image.extent)!
        let image : UIImage = UIImage.init(cgImage: cgImage)
        
        return image
        
    }
    

}
