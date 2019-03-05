//
//  FilterViewController.swift
//  Filter+
//
//  Created by Achem Samuel on 2/28/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit
import MaterialComponents

class FilterViewController: UIViewController, UINavigationControllerDelegate {
    
    //MARK: Variables Setup
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MDC FLoating Button Configuration
    let floatButton = MDCFloatingButton()
    let buttonScheme = MDCButtonScheme()
    var userSelctedImage = UIImage()
    
    //Class Connections
    let sepiaFilterClass = Sepia()
    let convertImage = ImageConverter()
    
    //Images Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    //Life Cycle
    
    override func viewDidLoad() {
        viewDidLayoutSubviews()
        
        scrollView.contentSize.width = 500
        backgroundImageView.image = imageView.image
        
        imagePlaceHolder.isHidden = true
        // Do any additional setup after loading the view.
        buttonSetup()
        ImageBackgroundHandler()
        
        setupView()
    }
    
    //View Methods
    private func setupView () {
        
    }
    
    //Text Placeholder Outlet
    @IBOutlet weak var imagePlaceHolder: UILabel!
    
    
    //MARK: MDC FLoating Button Action
    @IBAction func optionsButton(_ sender: MDCFloatingButton) {
        imagePlaceHolder.isHidden = true
        
        let alert = UIAlertController(title: "Choose", message: "", preferredStyle: .alert)
        
        //Camera Selected Action
        let takePhotoAction = UIAlertAction(title: "Take a photo", style: .default) { (action) in
            print("Something hapened")
            self.cameraPressed()
        }
        
        //Library Selected Action
        let selectImageAction = UIAlertAction(title: "Select From Album", style: .default) { (action) in
            
            print("Another Thing Happened")
            
            self.selectImageFromLibrary()
        }
        present(alert, animated: true, completion: nil)
        alert.addAction(takePhotoAction)
        alert.addAction(selectImageAction)
    }
    
    //MARK: FIlter Button Actions
    //Sepia Button
    @IBAction func sepiaFIlterButtonClicked(_ sender: UIButton) {
        let image = CIImage(image: imageView.image!)
        let filteredImage = sepiaFilterClass.applySepiaFIlter(image: image!)
        let finalImage = convertImage.convertCIImageToUIImage(image: filteredImage)
        self.imageView.image = finalImage
    }
    
    //Another Button
    
    
    
    
    //Share Button Method
    @IBAction func shareButtonPressed(_ sender: UIBarButtonItem) {
        
        if imageView.image != nil {
            
            
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
    
    
    
}

//MARK: IMage Picker Delegate Methods
extension FilterViewController : UIImagePickerControllerDelegate {
    
    //MDC FLoating Button Setup
    func buttonSetup () {
        
        MDCFloatingActionButtonThemer.applyScheme(buttonScheme, to: floatButton)
        floatButton.setElevation(ShadowElevation(rawValue: 6), for: .normal)
        floatButton.setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
        floatButton.accessibilityLabel = "Add a photo"
        
    }
    
    //MARK: Select Image
    
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
    
    //Select Image From Library
    func selectImageFromLibrary () {
        let imageSelector = UIImagePickerController()
        imageSelector.delegate = self
        imageSelector.sourceType = .photoLibrary
        imageSelector.allowsEditing = true
        present(imageSelector, animated: true)
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.editedImage]as? UIImage {
            //TODO: needs to go to super class
            self.imageView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleBottomMargin.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue | UIView.AutoresizingMask.flexibleRightMargin.rawValue | UIView.AutoresizingMask.flexibleLeftMargin.rawValue | UIView.AutoresizingMask.flexibleTopMargin.rawValue | UIView.AutoresizingMask.flexibleWidth.rawValue)
            self.imageView.contentMode = UIView.ContentMode.scaleAspectFit
            self.imageView.image = selectedImage
            self.backgroundImageView.image = selectedImage
            self.userSelctedImage = selectedImage
        }
            
        else{
            print("Image not resized propoerly \(NSLocalizedDescriptionKey)")
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

//Custom Haze Remove Filter
/*
extension FilterViewController {
    
   
    
    guard let filter = CIFilter(name: NSUserName, withInputParameters: parameters),
    let output = filter.outputImage else {
    throw ImageProcessor.Error.filterConfiguration(name: filterName, params: parameters)
    }
    
    // Crop back to the extent if necessary
    if shouldCrop {
    let croppedImage = output.cropped(to: extent)
    return croppedImage
    } else {
    return output
    }
}

*/


extension FilterViewController {

}



