
import UIKit
import os.log

class DetailProductsViewController: UIViewController {

    var products: Product?
    var productes: Product?
    var productCount: Product?
    
    
    @IBOutlet weak var detialShowPhoto: UIImageView!
    @IBOutlet weak var detialNameProduct: UILabel!
    @IBOutlet weak var detailNamedetailTextView: UITextView!
    @IBOutlet weak var detailPrice: UILabel!
    @IBOutlet weak var coutOfGood: UILabel!
    @IBOutlet weak var countOfFair: UILabel!
    @IBOutlet weak var countOfSad: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let detailProducts = products {
            detialShowPhoto.image = detailProducts.photo
            detialNameProduct.text = detailProducts.productName
            detailNamedetailTextView.text = detailProducts.detailProduct
            detailPrice.text = detailProducts.price
            coutOfGood.text = String((detailProducts.countRatingGood))
            countOfFair.text = String((detailProducts.countRatingFair))
            countOfSad.text = String((detailProducts.countRatingSad))
        
        }
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.isNavigationBarHidden = false
        let number = productes?.countRatingGood
        print("count number is \(String(describing: number))")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        switch(segue.identifier ?? "") {
            
        case "EditProduct":
        let viewController = segue.destination as? ViewController //ต้องการส่งค่าไปยัง viewcontroller
            viewController?.products = self.products // เก้บค่าไว้ใน class products
        case "ReviewAll":
            let reviewCollectionViewController = segue.destination as? ReviewCollectionViewController
            reviewCollectionViewController?.productes
                = self.products
        default:
            print("Error")
        }
    }
    
    @IBAction func cancelDetailProduct(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func unwindToDetiail(_ sender: UIStoryboardSegue) {
        

        coutOfGood.text = String((products?.countRatingGood)!)
        countOfFair.text = String((products?.countRatingFair)!)
        countOfSad.text = String((products?.countRatingSad)!)
    }
    
}

        




