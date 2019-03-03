//
//  ChildViewController.swift
//  Filter+
//
//  Created by Achem Samuel on 3/2/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {

    
    //SliderValuesObjects
    var redSliderValue = 0
    var greenSliderValue = 0
    var blueSliderValue = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Color Controls Slider IB OPutlets

    
    
    //Color Controls SliderAction

    


}

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
    
    

