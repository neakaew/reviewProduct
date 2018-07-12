import JVFloatLabeledTextField
import os.log
import UIKit

class ViewController: UIViewController , UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var products: Product?
    var indexpathProduct:IndexPath?
    
    @IBOutlet weak var showPhoto: UIImageView!
    @IBOutlet weak var nameProductTextField: JVFloatLabeledTextView!
    @IBOutlet weak var nameDetailTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var namePriceTextField: JVFloatLabeledTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      

        if let detailProducts = products {
            showPhoto.image = detailProducts.photo
            nameProductTextField.text = detailProducts.productName
            nameDetailTextView.text = detailProducts.detailProduct
            namePriceTextField.text = detailProducts.price
            //nameDetailTextView.font = UIFont(name: "Times New Roman", size: 28)
            
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.isNavigationBarHidden = false
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


    @IBAction func cancelAddProduct(_ sender: UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("Error")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIButton, button === saveButton  else {
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
