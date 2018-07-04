
import os.log
import UIKit

class ViewController: UIViewController , UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var products: Product?
    
    @IBOutlet weak var showPhoto: UIImageView!
    @IBOutlet weak var nameProductTextField: UITextField!
    @IBOutlet weak var namePriceTextField: UITextField!
    @IBOutlet weak var nameDetailTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    

    var indexpathProduct:IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard(_:)))
        view.addGestureRecognizer(tapGesture)
        
        if let detailProducts = products {
            showPhoto.image = detailProducts.photo
            nameProductTextField.text = detailProducts.productName
            nameDetailTextView.text = detailProducts.detailProduct
            namePriceTextField.text = detailProducts.price
        }

    }
    
    @objc private func dismissKeyboard(_ sender: Any){
        view.endEditing(true)
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
        let isPresentingInAddProductMode = presentingViewController is UINavigationController
        if isPresentingInAddProductMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("Error Cancel")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem, button === saveButton  else {
            os_log("The save button was not pressed, cancelling", log:  OSLog.default, type: .debug)
            return
        }
                
                let photoes = showPhoto.image
                let productName = nameProductTextField.text ?? ""
                let detailProduct = nameDetailTextView.text ?? ""
                let price = namePriceTextField.text ?? ""
                
                products = Product(photo: photoes, productName: productName, detailProduct: detailProduct, price: price)
            
        }

    
    
}
