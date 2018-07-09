
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let detailProducts = products {
            detialShowPhoto.image = detailProducts.photo
            detialNameProduct.text = detailProducts.productName
            detailNamedetailTextView.text = detailProducts.detailProduct
            detailPrice.text = detailProducts.price
        
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
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return (productes?.comment.count)! + 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        if indexPath.item == 0 {
//            let buttonCell = collectionView.dequeueReusableCell(withReuseIdentifier: "addReviewCollection", for: indexPath) as! ReviewCollectionViewCell
//            return buttonCell
//
//        } else {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewOfDetail", for: indexPath) as! ReviewCollectionViewCell
//        cell.nameOfProduct.text = productes?.userName[indexPath.row]
//        cell.detailOfProduct.text = productes?.comment[indexPath.row]
//
//        let selepathIcon = productes?.rating[indexPath.row]
//        if selepathIcon == 1 {
//            let emoticonLike = UIImage(named: "emoticonLike")
//            cell.imageOfProduct.image = emoticonLike
//
//        } else if selepathIcon == 2 {
//            let emoticonFair = UIImage(named: "emoticonFair")
//            cell.imageOfProduct.image = emoticonFair
//
//        } else if selepathIcon == 3 {
//            let emoticonSad = UIImage(named: "emoticonSad")
//            cell.imageOfProduct.image = emoticonSad
//        }
//
//
//        return cell
//        }
//    }
    
}

        




