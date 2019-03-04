//
//  FilterViewController.swift
//  Filter+
//
//  Created by Achem Samuel on 2/28/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit
import MaterialComponents

class FilterViewController: HandlerViewController, UINavigationControllerDelegate {

    //MARK: VAriables Setup
    
    //Button
    let floatButton = MDCFloatingButton()
    let buttonScheme = MDCButtonScheme()
    var userSelctedImage = UIImage()
    
    //Effects File Link
    let sepiaFilterClass = Sepia()
    
    //Images Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        backgroundImageView.image = imageView.image
        if imageView.image != nil {
            print("ImageView\(String(describing: imageView.image!))")
        } else {
            print("Empty image")
        }
        
        imagePlaceHolder.isHidden = true
        // Do any additional setup after loading the view.
        buttonSetup()
        ImageBackgroundHandler()
        
        //TODO: Should have its own function
//        let alert = UIAlertController(title: "Choose", message: "", preferredStyle: .alert)
//        let takePhotoAction = UIAlertAction(title: "Take a photo", style: .default) { (action) in
//            print("Something hapened")
//            self.cameraPressed()
//        }
//
//        let selectImageAction = UIAlertAction(title: "Select From Album", style: .default) { (action) in
//            
//            print("Another Thing Happened")
//            
//            self.selectImageFromLibrary()
//        }
//        present(alert, animated: true, completion: nil)
//        alert.addAction(takePhotoAction)
//        alert.addAction(selectImageAction)
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//    }
    
//Text Placeholder Outlet
    @IBOutlet weak var imagePlaceHolder: UILabel!
    
    
    @IBAction func optionsButton(_ sender: MDCFloatingButton) {
        imagePlaceHolder.isHidden = true
        
        let alert = UIAlertController(title: "Choose", message: "", preferredStyle: .alert)
        let takePhotoAction = UIAlertAction(title: "Take a photo", style: .default) { (action) in
            print("Something hapened")
            self.cameraPressed()
        }
        
        let selectImageAction = UIAlertAction(title: "Select From Album", style: .default) { (action) in
            
            print("Another Thing Happened")
            
            self.selectImageFromLibrary()
        }
        present(alert, animated: true, completion: nil)
        alert.addAction(takePhotoAction)
        alert.addAction(selectImageAction)
    }
    
    //Share Button Method
    @IBAction func shareButtonPressed(_ sender: UIBarButtonItem) {
    
        if imageView.image != nil {
               // convertImage()
               //Sharing Options
//            UIGraphicsBeginImageContext(imageView.frame.size)
//            imageView.layer.render(in: UIGraphicsGetCurrentContext()!)
//            let renderedImage = UIGraphicsGetImageFromCurrentImageContext()
           
         
//            if let image = editted.im {
//                let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
//                present(vc, animated: true)
            
//            }
            
            let sepiaFIlteredImage = sepiaFilterClass.applySepiaFIlter(image: CIImage(image: imageView.image!)!)
           
            /////////
            let ciContext = CIContext(options: nil)
            self.imageView.contentMode = UIView.ContentMode.scaleAspectFit
             imageView.image = sepiaFIlteredImage
             print("Image Shared")
        }
            
        else {
            let alert = UIAlertController(title: "😪", message: "Oops! you haven't added a photo yet", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            present(alert, animated: true)
            alert.addAction(action)
        }
      
        
    }
    
    
    override func convertImage () {

        if imageView.image != nil {

            if  let gradientImage = CIImage(image: self.imageView.image!) {

                 _ = gradientImage.applyingFilter("CIBloom", parameters: [kCIInputRadiusKey: 8, kCIInputIntensityKey: 1.25])

            //    let images = UIImage(ciImage: finalImage.outputImage)
                
              
                
            }
        } else {
            print("Sorry nil found")
        }



    }
    
    //COntroller Connections
    
    
    
}

//MARK: IMage Picker Delegate Methods
extension FilterViewController : UIImagePickerControllerDelegate {
    
    //MARK: Pick Images
    
    //Take a selfie
    
    
    func cameraPressed () {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            return
        }
        
        //Set up camera picker
        let cameraSelector = UIImagePickerController()
        cameraSelector.delegate = self
        cameraSelector.sourceType = .camera
        cameraSelector.allowsEditing = true
        
        present(cameraSelector, animated: true, completion: nil)
    }
    
    //Select From Album
    func selectImageFromLibrary () {
                let imageSelector = UIImagePickerController()
                imageSelector.delegate = self
                imageSelector.sourceType = .photoLibrary
                imageSelector.allowsEditing = true
                present(imageSelector, animated: true)
    }
    
    func buttonSetup () {
        
                MDCFloatingActionButtonThemer.applyScheme(buttonScheme, to: floatButton)
                floatButton.setElevation(ShadowElevation(rawValue: 6), for: .normal)
                floatButton.setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
                floatButton.accessibilityLabel = "Add a photo"
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.editedImage]as? UIImage {
            //TODO: needs to go to super class
            self.imageView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleBottomMargin.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue | UIView.AutoresizingMask.flexibleRightMargin.rawValue | UIView.AutoresizingMask.flexibleLeftMargin.rawValue | UIView.AutoresizingMask.flexibleTopMargin.rawValue | UIView.AutoresizingMask.flexibleWidth.rawValue)
                self.imageView.contentMode = UIView.ContentMode.scaleAspectFit
                self.imageView.image = selectedImage
                self.backgroundImageView.image = selectedImage
                self.userSelctedImage = selectedImage
        }
        
        else{
            print("What the hell \(NSLocalizedDescriptionKey)")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //For Super Class too
    
    func ImageBackgroundHandler () {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular )
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = backgroundImageView.bounds
        backgroundImageView.addSubview(blurView)
    }
    

}


    


