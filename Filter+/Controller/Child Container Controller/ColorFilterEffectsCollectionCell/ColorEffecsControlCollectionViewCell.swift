//
//  ColorEffecsControlCollectionViewCell.swift
//  Filter+
//
//  Created by Achem Samuel on 3/3/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit

class ColorEffecsControlCollectionViewCell: UICollectionViewCell {
    
    //Color Channels Slider Global Variables
    var redSliderValue = 0
    var greenSliderValue = 0
    var blueSliderValue = 0
    
    
    
    //ColorChannelOutlets
    @IBOutlet var resSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    //C0lor Channel Slider Value Changed Actions
    
    @IBAction func colorChannelsSliderValueChanged(_ sender: UISlider) {
        redSliderValue = Int(self.resSlider.value)
        greenSliderValue = Int(self.greenSlider.value)
        blueSliderValue = Int(self.blueSlider.value)
        
//        print("Red Slider Value: \(redSliderValue), Green Slider Value: \(greenSliderValue), Blue Slider Value: \(blueSliderValue)")
        
    }
    
    
}
