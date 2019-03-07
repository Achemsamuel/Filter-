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
    
    //BUtton Outlets
    @IBOutlet weak var sepiaButton: UIButton!
    @IBOutlet weak var bloomButton: UIButton!
    @IBOutlet weak var noirButton: UIButton!
    @IBOutlet weak var chromeButton: UIButton!
    @IBOutlet weak var tonalButton: UIButton!
    @IBOutlet weak var fadeButton: UIButton!
    @IBOutlet weak var monoButton: UIButton!
    @IBOutlet weak var effectsInstantButton: UIButton!
    @IBOutlet weak var effectsTransferButton: UIButton!
    @IBOutlet weak var originalImageButton: UIButton!
    
    
    
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
        
        scrollView.contentSize = CGSize(width: 632, height: 92)
        
       self.sepiaButtonImage(image: self.imageView.image!)
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
    //Original Image Button
    @IBAction func originalImage(_ sender: UIButton) {
        imageView.image = self.originalImageButton.currentBackgroundImage
    }
    
    
    //Sepia Filter Button
    @IBAction func sepiaFIlterButtonClicked(_ sender: UIButton) {
        imageView.image = self.sepiaButton.currentBackgroundImage
    }
    
    //Bloom Filter Button
    @IBAction func bloomFilterButtonClicked(_ sender: UIButton) {
        imageView.image = self.bloomButton.currentBackgroundImage
    }
    
    //Noir Filter Button
    @IBAction func noirFilterButtonClicked(_ sender: UIButton) {
        imageView.image =  self.noirButton.currentBackgroundImage
    }
    
    //Chrome Filter Button
    @IBAction func chromeFIlterButtonClicked(_ sender: UIButton) {
        imageView.image = self.chromeButton.currentBackgroundImage
    }
    
    //Tonal Filter Button Clicked
    @IBAction func tonalFilterButtonClicked(_ sender: UIButton) {
        imageView.image = self.tonalButton.currentBackgroundImage
    }
    
    //Fade Filter Button
    @IBAction func fadeButtonClicked(_ sender: UIButton) {
        imageView.image = self.fadeButton.currentBackgroundImage
    }
    
    //Monochrome Filter Button
    @IBAction func monoButtonClicked(_ sender: UIButton) {
        imageView.image = monoButton.currentBackgroundImage
    }
    
    //EffectsInstant Button
    @IBAction func effectsInstantButtonClicked(_ sender: UIButton) {
        imageView.image = self.effectsInstantButton.currentBackgroundImage
    }
    
    //Effects Transfer Button
    @IBAction func effectsTransferButtonClicked(_ sender: UIButton) {
        imageView.image = self.effectsTransferButton.currentBackgroundImage
    }
    
    
    
    
    
    
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
            
            //Set Images
            self.imageView.image = selectedImage
            self.backgroundImageView.image = selectedImage
            self.userSelctedImage = selectedImage
            self.originalImage(image: selectedImage)
            self.sepiaButtonImage(image: selectedImage)
            self.bloomButtonImage(image: selectedImage)
            self.noirButtomImage(image: selectedImage)
            self.chromeButonImage(image: selectedImage)
            self.tonalButtonImage(image: selectedImage)
            self.fadeButtonImage(image: selectedImage)
            //self.monochromeButtonImage(image: selectedImage)
            self.comicFilter(image: selectedImage)
            self.effectInstant(image: selectedImage)
            self.effectTransfer(image: selectedImage)
            
            
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


//MARK: Button IMages Setup
extension FilterViewController {
    
    func originalImage (image : UIImage) {
      
        originalImageButton.setBackgroundImage(image, for: .normal)
    }

    func sepiaButtonImage (image : UIImage) {
        
        let convertedImage = CIImage(image: image)
        let buttonImage = UIImage(ciImage: convertedImage!.applyingFilter("CISepiaTone", parameters: [kCIInputIntensityKey: 0.5]))
        sepiaButton.setBackgroundImage(buttonImage, for: .normal)
    }
    
    func bloomButtonImage (image : UIImage) {
        
        let convertedImage = CIImage(image: image)
        let buttonImage = UIImage(ciImage: (convertedImage?.applyingFilter("CIBloom", parameters: [kCIInputRadiusKey: 8, kCIInputIntensityKey: 1.25]))!)
        bloomButton.setBackgroundImage(buttonImage, for: .normal)
        
    }
    
    func noirButtomImage (image : UIImage) {
        
        let convertedImage = CIImage(image: image)
        let buttonImage = UIImage(ciImage: (convertedImage?.applyingFilter("CIPhotoEffectNoir"))!)
        noirButton.setBackgroundImage(buttonImage, for: .normal)
        
    }
    
    func chromeButonImage (image : UIImage) {
      
        let convertedImage = CIImage(image: image)
        let buttonImage = UIImage(ciImage: (convertedImage?.applyingFilter("CIPhotoEffectChrome"))!)
        chromeButton.setBackgroundImage(buttonImage, for: .normal)
    }
    
    func tonalButtonImage (image : UIImage) {
      
        let converetedImage = CIImage(image: image)
        let buttonImage = UIImage(ciImage: (converetedImage?.applyingFilter("CIPhotoEffectTonal"))!)
        tonalButton.setBackgroundImage(buttonImage, for: .normal)
    }
    
    func fadeButtonImage (image: UIImage) {
      
        let convertedImage = CIImage(image : image )
        let buttonImage = UIImage(ciImage: (convertedImage?.applyingFilter("CIPhotoEffectFade"))!)
        fadeButton.setBackgroundImage(buttonImage, for: .normal)
    }
    
    func monochromeButtonImage (image : UIImage) {
      
        let convertedImage = CIImage(image: image)
        let buttonImage = UIImage(ciImage: (convertedImage?.applyingFilter("CIColorMonochrome", parameters: [kCIInputIntensityKey: 0.5]))!)
        chromeButton.setBackgroundImage(buttonImage, for: .normal)
    }
    
    func effectInstant (image : UIImage) {
      
        let convertedImage = CIImage(image: image)
        let buttonImage = UIImage(ciImage: (convertedImage?.applyingFilter("CIPhotoEffectInstant"))!)
        effectsInstantButton.setBackgroundImage(buttonImage, for: .normal)
    }
    
    func effectTransfer (image: UIImage) {
      
        let convertedImage = CIImage(image: image)
        let buttonImage = UIImage(ciImage: (convertedImage?.applyingFilter("CIPhotoEffectTransfer"))!)
        effectsTransferButton.setBackgroundImage(buttonImage, for: .normal)
    }
    
    
    func comicFilter (image : UIImage) {
        
        let convertedImage = CIImage(image: image)
        let buttonImage = UIImage(ciImage: (convertedImage?.applyingFilter("CIComicEffect"))!)
        monoButton.setBackgroundImage(buttonImage, for: .normal)
        
    }
    
    
    
    
}

