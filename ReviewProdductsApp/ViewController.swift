//
//  ViewController.swift
//  ReviewProdductsApp
//
//  Created by udom on 1/7/61.
//  Copyright © พ.ศ. 2561 ReviewProducts. All rights reserved.
//
import os.log
import UIKit

class ViewController: UIViewController , UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var products: Product?
    
    
    @IBOutlet weak var showPhoto: UIImageView!
    @IBOutlet weak var nameProductTextField: UITextField!
    @IBOutlet weak var namePriceTextField: UITextField!
    @IBOutlet weak var nameDetailTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       // nameProductTextField?.delegate = self

       if let productes = products {
            showPhoto.image = productes.photo
            nameProductTextField.text = productes.productName
            nameDetailTextView.text = productes.detailProduct
            namePriceTextField.text = productes.price
        }
    }
    
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
         let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        // Set photoImageView to display
        showPhoto.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
         dismiss(animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let s = sender as? UIButton {
            if saveButton === s {
                
                let photoes = showPhoto.image
                let productName = nameProductTextField.text ?? ""
                let detailProduct = nameDetailTextView.text ?? ""
                let price = namePriceTextField.text ?? ""
                
                products = Product(photo: photoes, productName: productName, detailProduct: detailProduct, price: price)
            }
        }
    }

}
