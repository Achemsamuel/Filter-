//
//  HandlerViewController.swift
//  Filter+
//
//  Created by Achem Samuel on 2/28/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit
import CoreImage

class HandlerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
      return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        
        
//        if let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCell", for: indexPath) {
//            return filterCell
//        }
//        return UICollectionViewCell()
        
     
    }
    

   // let stuff = FilterViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imageBackground.image = UIImage(named: "new background")
//        CIFilter.filterNames(inCategory: nil)

   //     let image = UIImage(named: "new background")?.withRenderingMode(.alwaysTemplate)
//        imageBackground.tintColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
//     //   imageBackground.image = image
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSliderValue: UILabel!
    @IBOutlet weak var redSliderValue: UILabel!
    @IBOutlet weak var greenSliderValue: UILabel!
    @IBAction func convert(_ sender: UIBarButtonItem) {
        
        convertImage()
    }
    
    @IBAction func cist(_ sender: UIBarButtonItem) {
        //stuff.selectImageFromLibrary()
        
        myNewConversion()
    }
    
    let cifilter = CIFilter()
    
    @IBAction func sliderAction(_ sender: UISlider) {
        blueSliderValue.text = String(blueSlider.value)
        redSliderValue.text = String(redSlider.value)
        greenSliderValue.text = String(greenSlider.value)
        
//        let templateImage = imageBackground.image?.withRenderingMode(.alwaysTemplate)
//        imageBackground.image = templateImage
//        self.imageBackground.tintColor = UIColor(red: CGFloat(redSlider.value)/255, green:        CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
        
    }
    
    func convertImage () {
        
        let gradientImage = CIImage(image: UIImage(named: "new background")!)!
        let finalImage = gradientImage.applyingFilter("CIBloom", parameters: [kCIInputRadiusKey: 8, kCIInputIntensityKey: 1.25])
        
        let image = UIImage(ciImage: finalImage)
        imageBackground.image = image
        
    }
//    func convertImage (image : UIImage) -> UIImage {
//
//        let ciImage = CIImage(image: image)
//        let renderedImage = ciImage?.applyingFilter("CIColorClamp", parameters: [kCIInputColorKey])
//
//        CIVector(x: <#T##CGFloat#>, y: <#T##CGFloat#>, z: <#T##CGFloat#>, w: <#T##CGFloat#>)
//        return
//    }
    

    
    func myNewConversion () {
        
        let churchImage = CIImage(image: UIImage(named: "new background")!)!
        
        let redImage = churchImage.applyingFilter("CIColorControls", parameters: [kCIInputBrightnessKey: 1])
        let greenIMage = churchImage.applyingFilter("CIColorControls", parameters: [kCIInputBrightnessKey: 0.5])
        let blueImage = churchImage.applyingFilter("CIColorControls", parameters: [kCIInputContrastKey: 5, kCIInputBrightnessKey: 1] )
        
          let rgbCompositing = CIFilter(name: "RGBChannelCompositing", parameters: ["inputRedImage": redImage, "inputGreenImage": greenIMage, "inputBlueImage": blueImage])
        let finalImage = rgbCompositing!.outputImage
            
            imageBackground.image = UIImage(ciImage: finalImage!)
//        } else {
//            print("E no dey work oo")
//        }
        
        
    
        
        
    }
    
    
}
