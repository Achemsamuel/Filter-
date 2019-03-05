//
//  CustomFiltersVendor.swift
//  Filter+
//
//  Created by Achem Samuel on 3/4/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import Foundation
import CoreImage

class CustomFiltersVendor : NSObject, CIFilterConstructor {
    
    public static let HazeRemoveFilterName = "HazeRemoveFilter"
    
    static func registerFilters() {
        
        let classAttributes = [kCIAttributeFilterCategories: ["CustomFilters"]]
        HazeRemoveFilter.registerName(HazeRemoveFilterName, constructor: CustomFiltersVendor(), classAttributes: classAttributes)
        
    }
    
    func filter(withName name: String) -> CIFilter? {
        
        switch name
        {
        case CustomFiltersVendor.HazeRemoveFilterName:
            return HazeRemoveFilter()
        default:
            return nil
        }
    }
    
    enum Filter {
        
        case none ()
        
        case gloom(intensity: Double, radius: Double)
        
        case sepia(intensity: Double)
        
        case blur(intensity: Double)
        
        case removeHaze
    }
    
    
    
}
