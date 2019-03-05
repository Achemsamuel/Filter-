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
    
    func applySepiaFIlter (image : CIImage) -> CIImage {
        
//        var finalImage = UIImage()
        
        let sepiaFIlteredImage = image.applyingFilter("CISepiaTone", parameters: [kCIInputIntensityKey: 0.5])

        return sepiaFIlteredImage
    }
    
}

class CIBloom : CIFilter {
    
    func applyBloomFilter (image: CIImage) -> UIImage {
        
        let bloomFilter = image.applyingFilter("CIBloom", parameters: [kCIInputRadiusKey: 8, kCIInputIntensityKey: 1.25])
        
        let filteredImage = UIImage(ciImage: bloomFilter)
        
        return filteredImage
    }
    
}

class  CIPhotoEffectNoir : CIFilter {
    func applyCIPhotoEffectNoir (image: CIImage) -> UIImage {
        
        let noirFilter = image.applyingFilter("CIPhotoEffectNoir")
        
        let filteredImage = UIImage(ciImage: noirFilter)
        
        return filteredImage
    }
}

class CIPhotoEffectChrome : CIFilter {
    
    func applyCIPhotoEffectChrome (image : CIImage) -> UIImage {
        
        let effectChrome = image.applyingFilter("CIPhotoEffectChrome")
        
        let filteredImage = UIImage(ciImage: effectChrome)
        
        return filteredImage
    }
}

class CIPhotoEffectTonal : CIFilter {
    
    func applyCIPhotoEffectTonal (image : CIImage) -> UIImage {
        
        let effectTonal = image.applyingFilter("CIPhotoEffectTonal")
        
        let filteredImage = UIImage(ciImage: effectTonal)
        
        return filteredImage
    }
}

class CIPhotoEffectFade : CIFilter {
    
    func applyCIPhotoEffectFade (image : CIImage) -> UIImage {
        
        let effectFade = image.applyingFilter("CIPhotoEffectFade")
        
        let filteredImage = UIImage(ciImage: effectFade)
        
        return filteredImage
    }
}

class CIColorMonochrome :  CIFilter {
    
    func applyCIColorMonochrome (image : CIImage) -> UIImage {
        
        let colorMonochrome = image.applyingFilter("CIColorMonochrome", parameters: [kCIInputIntensityKey: 0.5])
        
        let filteredImage = UIImage(ciImage: colorMonochrome)
        
        return filteredImage
    }
}

class CIPhotoEffectInstant : CIFilter {
    
    func applyCIPhotoEffectInstant (image : CIImage) -> UIImage {
        
        let applyCIPhotoEffectInstant = image.applyingFilter("CIPhotoEffectInstant")
        
        let filteredImage = UIImage(ciImage: applyCIPhotoEffectInstant)
        
        return filteredImage
    }
}

//class CIVignetteEffect : CIFilter {
//
//    func applyCIVignetteEffect (image : CIImage) -> UIImage {
//
//        let vignetteEffect = image.applyingFilter("CIVignetteEffect", parameters: [kCIInputCenterKey: 150, 150],  [kCIInputIntensityKey: 0.5], [kCIInputRadiusKey: 0.00])
//
//        let filteredImage = UIImage(ciImage: vignetteEffect)
//
//        return filteredImage
//
//    }
//}

class CIPhotoEffectTransfer : CIFilter {
    
    func applyCIPhotoEffectTransfer (image : CIImage) -> UIImage {
        
        let effectTransfer = image.applyingFilter("CIPhotoEffectTransfer")
        
        let filteredImage = UIImage(ciImage: effectTransfer)
        
        return filteredImage
    }
}
