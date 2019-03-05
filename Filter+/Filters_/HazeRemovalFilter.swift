//
//  HazeRemovalFilter.swift
//  Filter+
//
//  Created by Achem Samuel on 3/4/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import Foundation
import CoreImage

class HazeRemoveFilter  : CIFilter {
    
    @objc dynamic var inputImage : CIImage?
    @objc dynamic var inputColor : CIColor = CIColor.white
    @objc dynamic var inputDistance : NSNumber = 0.2
    @objc dynamic var inputSlope : NSNumber = 0
    
    
    override var attributes: [String : Any] {
        return [
            kCIAttributeFilterDisplayName : "Remove Haze",
            "inputImage": [kCIAttributeIdentity: 0, kCIAttributeClass: "CIImage", kCIAttributeDisplayName: "Image",
                           kCIAttributeType: kCIAttributeTypeImage],
            "inputDistance" : [kCIAttributeIdentity: 0, kCIAttributeClass: "NSNumber", kCIAttributeDisplayName: "Distance Factor", kCIAttributeDefault: 0.2, kCIAttributeMin: 0, kCIAttributeMax: 1, kCIAttributeSliderMin: 0, kCIAttributeSliderMax: 0.7, kCIAttributeType: kCIAttributeTypeScalar],
            "inputSlope": [kCIAttributeIdentity: 0, kCIAttributeClass: "NSNUmber", kCIAttributeDisplayName: "Slope Factor", kCIAttributeDefault: 0.2, kCIAttributeSliderMin: -0.01, kCIAttributeSliderMax: 0.01, kCIAttributeType: kCIAttributeTypeScalar],
            kCIInputColorKey:  [ kCIAttributeDefault: CIColor.white
            ]
        ]
    }
    
    private lazy var hazeRemovalKernel : CIColorKernel? =  {
        
        guard let path = Bundle.main.path(forResource: "HazeRemove", ofType: "cikernel"),
            let code = try? String(contentsOfFile: path) else {
                fatalError("Failed to load HazeRemove.cikernel from bundle")
        }
        let kernel = CIColorKernel(source : code)

        return kernel
    }()
    
    
    override var outputImage : CIImage? {
        
        get {
            if let inputImage = self.inputImage {
                return hazeRemovalKernel?.apply(extent: inputImage.extent, arguments: [inputImage as Any,
                                  inputColor,
                                  inputDistance,
                                  inputSlope
                    ])
            } else {
                return nil
            }
        }
    }
    
    
    //SetUP
    
    /*
    enum Filter {
        
        case none ()
        
        case gloom(intensity: Double, radius: Double)
        
        case sepia(intensity: Double)
        
        case blur(intensity: Double)
        
        case removeHaze
    }
    
    func filtered (_ filter : Filter) throws -> CIImage {
        
        let parameters: [String: AnyObject]
        let filterName: String
        let shouldCrop: Bool
        // Configure the CIFilter() inputs based on the chosen filter
        switch filter {
        case .none:
            return self
        case .removeHaze:
            parameters = [
                kCIInputImageKey: self
            ]
            filterName = CustomFiltersVendor.HazeRemoveFilterName
            shouldCrop = false
            
        case .gloom(let intensity, let radius):
            <#code#>
        case .sepia(let intensity):
            <#code#>
        case .blur(let intensity):
            <#code#>
        }
        
    }
 
 */
    
}
