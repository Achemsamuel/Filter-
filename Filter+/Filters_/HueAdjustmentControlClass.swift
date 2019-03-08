//
//  HueAdjustmentControlClass.swift
//  Filter+
//
//  Created by Achem Samuel on 3/7/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit


class HueAdjustmentControlClass {
    
    /*Convert RGB to HSV for Processing
     r = red
     g = green
     b = blue
     h = hue
     s = saturation
     v = brightness
 */
    func RGBToHSV (r: Float, g: Float, b: Float) -> (h: Float, s: Float, v: Float) {
        
        var h : CGFloat = 0
        var s : CGFloat = 0
        var v : CGFloat = 0
        let colorToHandle = UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1.0)
        colorToHandle.getHue(&h, saturation: &s, brightness: &v, alpha: nil)
        
        return (Float(h), Float(s), Float(v))
        
    }
    
    
    /*
     Convert HueSaturationBrightness(HSV) Value back to RGB
     r = red
     g = green
     b = blue
     h = hue
     s = saturation
     v = brightness
 */
    func HSVToRGB(h: Float, s: Float, v: Float) -> (r : Float, g: Float, b: Float ) {
        
        var r : Float = 0
        var g : Float = 0
        var b : Float = 0
        
        let satBrightness = s * v
        let hueSaturation = h * 6.0
        let multiplier = satBrightness * (1.0 - fabsf(fmodf(hueSaturation, 2.0) - 1.0))
        
        if (hueSaturation >= 0 && hueSaturation < 1) {
            r = satBrightness
            g = multiplier
            b = 0
        }
        else if (hueSaturation >= 1 && hueSaturation < 2) {
            r = multiplier
            g = satBrightness
            b = 0
        }
        
        else if (hueSaturation >= 2 && hueSaturation < 3) {
            r = 0
            g = satBrightness
            b = multiplier
        }
        
        else if (hueSaturation >= 3 && hueSaturation < 4) {
            r = 0
            g = multiplier
            b = satBrightness
        }
        
        else if (hueSaturation >= 4 && hueSaturation < 5) {
            r = multiplier
            g = 0
            b = satBrightness
        }
        
        else if (hueSaturation >= 5 && hueSaturation < 6) {
            r = satBrightness
            g = 0
            b = multiplier
        }
        
        //bMS = brightness minus satBrightness
        let bMS = v - satBrightness
        r += bMS
        g += bMS
        b += bMS
        
        return (r, g, b)
    }
    
}
