
import os.log
import UIKit

class AddReviewViewController: UIViewController {

    var
    products: Product?
    
    @IBOutlet weak var detailTextViewInAddReview: UITextView!
    @IBOutlet weak var ShowImageAddReview: UIImageView!
    @IBOutlet weak var nameProductAddReview: UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var buttonAddReview: UIButton!
    @IBOutlet weak var RatingControl: RatingControl!
    @IBOutlet weak var priceOfProduct: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddReviewViewController.dismissKeyboard(_:)))
        view.addGestureRecognizer(tapGesture)
        
        if let product = products {
            ShowImageAddReview.image = product.photo
            nameProductAddReview.text = product.productName
            detailTextViewInAddReview.text = product.detailProduct
            priceOfProduct.text = products?.price
        }
    }
    
    @IBAction func unwindToAddReviewProductlList(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ReviewCollectionViewController, let addReview = sourceViewController.productes {
            
            self.products = addReview
          
        }
    }

    @objc private func dismissKeyboard(_ sender: Any){
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIButton, button === buttonAddReview  else {
            os_log("The save button was not pressed, cancelling", log:  OSLog.default, type: .debug)
            return
        }
        
        let numberRating = RatingControl.rating
        if numberRating == 1 {
                self.products?.countRatingGood = (products?.countRatingGood)! + 1
    
        } else if numberRating == 2 {
            self.products?.countRatingFair = (products?.countRatingFair)! + 1
            
        } else if numberRating == 3 {
            self.products?.countRatingSad = (products?.countRatingSad)! + 1
        }
        
        let sumAmountReview = (products?.countRatingGood)! + (products?.countRatingFair)! + (products?.countRatingSad)!
        self.products?.sumAmountOfReview = sumAmountReview
        
        
        if (self.products?.countRatingGood)! > (self.products?.countRatingFair)! && (self.products?.countRatingGood)! > (self.products?.countRatingSad)! {
            self.products?.maxOfReview = (products?.countRatingGood)!
            self.products?.imageOfReview = UIImage(named: "emoticonLike")!
            
        } else if (self.products?.countRatingFair)! > (self.products?.countRatingGood)! && (self.products?.countRatingFair)! > (self.products?.countRatingSad)! {
            self.products?.maxOfReview = (products?.countRatingFair)!
            self.products?.imageOfReview = UIImage(named: "emoticonFair")!
            
        } else if (self.products?.countRatingSad)! > (self.products?.countRatingGood)! && (self.products?.countRatingSad)! > (self.products?.countRatingFair)! {
            self.products?.maxOfReview = (products?.countRatingSad)!
            self.products?.imageOfReview = UIImage(named: "emoticonSad")!
            
        } else {
            self.products?.maxOfReview = (self.products?.countRatingGood)!
            self.products?.imageOfReview = UIImage(named: "emoticonLike")!
        }
        

        print(products?.countRatingGood ?? "") 
        self.products?.comment.append(commentTextView.text!)
        self.products?.userName.append(nameTextField.text!)
        self.products?.rating.append(RatingControl.rating)
        
        let dateNow = NSDate()
        let formatDate = DateFormatter()
        formatDate.dateFormat = "dd/MM/yyyy"
        formatDate.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone?
        self.products?.dateTime.append(formatDate.string(from: dateNow as Date))
        
        let AddReviewViewController = segue.destination as? DetailProductsViewController
        AddReviewViewController?.products = self.products
        
    }
    

    @IBAction func cancel(_ sender: UIBarButtonItem) {
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
    
}
