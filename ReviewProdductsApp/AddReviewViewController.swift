
import os.log
import UIKit

class AddReviewViewController: UIViewController {

    var reviewProducts: ReviewProduct?
    var products: Product?
    
    @IBOutlet weak var detailTextViewInAddReview: UITextView!
    @IBOutlet weak var ShowImageAddReview: UIImageView!
    @IBOutlet weak var nameProductAddReview: UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var buttonAddReview: UIButton!
    @IBOutlet weak var buttonGreen: UIButton!
    @IBOutlet weak var buttonYellow: UIButton!
    @IBOutlet weak var buttonRed: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let product = products {
            ShowImageAddReview.image = product.photo
            nameProductAddReview.text = product.productName
            detailTextViewInAddReview.text = product.detailProduct
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let s = sender as? UIButton{
        if buttonAddReview === s {
            let commentReview = commentTextView.text ?? ""
            let nameReview = nameTextField.text ?? ""
            
            reviewProducts = ReviewProduct(productNameInTableView: commentReview, detailProductInTableView: nameReview)
            
        }
      }
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
}
