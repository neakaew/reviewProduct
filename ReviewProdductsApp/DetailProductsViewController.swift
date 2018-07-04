
import UIKit
import os.log

class DetailProductsViewController: UIViewController {

    var products: Product?
    
    @IBOutlet weak var detialShowPhoto: UIImageView!
    @IBOutlet weak var detialNameProduct: UITextField!
    @IBOutlet weak var detailNamedetailTextView: UITextView!
    @IBOutlet weak var detailPrice: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let detailProducts = products {
            detialShowPhoto.image = detailProducts.photo
            detialNameProduct.text = detailProducts.productName
            detailNamedetailTextView.text = detailProducts.detailProduct
            detailPrice.text = detailProducts.price
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        switch(segue.identifier ?? "") {
            
        case "EditProduct":
        let productDetailViewController = segue.destination as? ViewController //ต้องการส่งค่าไปยัง viewcontroller
            productDetailViewController?.products = self.products // เก้บค่าไว้ใน class products
        case "a":
            let ReviewCollectionViewController = segue.destination as? aViewController
            ReviewCollectionViewController?.products = self.products
        case "ReviewAll":
            let ReviewCollectionViewController = segue.destination as? ReviewCollectionViewController
            ReviewCollectionViewController?.products = self.products
        default:
            print("Error")
        }
    }
    
}

        




