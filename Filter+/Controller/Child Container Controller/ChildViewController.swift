//
//  ChildViewController.swift
//  Filter+
//
//  Created by Achem Samuel on 3/2/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit
import CoreImage

class ChildViewController: UIViewController {

    
    //SliderValuesObjects
    var redSliderValue = 0
    var greenSliderValue = 0
    var blueSliderValue = 0
    
    //MainCOntroller COnnection
    var filterVC = FilterViewController()
    
    //Effects Controller Link
    let sepiaFilterClass = Sepia()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        
   /*
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sepiaFilterTapped(tapGestureRecognizer:)))
        filterEffectsControlCollectionViewCell.sepiaFilter.isUserInteractionEnabled = true
        filterEffectsControlCollectionViewCell.sepiaFilter.addGestureRecognizer(tapGestureRecognizer)
        
*/
 
    }
    
    
  /*
    @objc func sepiaFilterTapped (tapGestureRecognizer : UITapGestureRecognizer) {
        
        let tappedSepiaFilterLabel = tapGestureRecognizer.view as! UILabel
        print("Label tapped oooooooo")
    }
    */
    
    @IBAction func sepiaButtonPressed(_ sender: Any) {
        print("Sepia Button Pressed oo")
        
//         let image = CIImage(image: UIImage(named: "sammy")!)!
//
//
//        if let image = filterVC.imageView.image {
//            let sepiaFilteredImage =  sepiaFilterClass.applySepiaFIlter(image: CIImage(image: image)!)
//            print("Sepia Image: \(sepiaFilteredImage)")
//            self.filterVC.imageView.image = sepiaFilteredImage
//        }
//        else {
//            print("NO image found")
//        }
        //        let imageViewImage = self.filterVC.imageView.image
        //        let image = CIImage(image: imageViewImage!)

        let image = CIImage(image: UIImage(named: "sammy")!)
        
        let sepiaFilteredImage = image?.applyingFilter("CISepiaTone", parameters: [kCIInputIntensityKey: 0.5])
        
        let finalImage = UIImage(ciImage: sepiaFilteredImage!)
        self.filterVC.imageView.image = finalImage
        
//        let sepiaFilteredImage = sepiaFilterClass.appySepiaFIlter(image: image!)
//         print("Sepia Image: \(sepiaFilteredImage)")
//        self.filterVC.imageView.image = sepiaFilteredImage
//
    }
    
    
    

}


/*
 
 
 
*/

extension ChildViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "satCell", for: indexPath) as! FilterEffectsControlCollectionViewCell
            
            
            return cell
        }
        else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath) as! ColorEffecsControlCollectionViewCell
            
            return cell
        }
        else  {
            return UICollectionViewCell()
        }
      

    
    }
    
    
   
    
    
  
    
    
}
    
    

