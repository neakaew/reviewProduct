
import UIKit
import os.log

class DetailProductsViewController: UIViewController {

   
    var products: Product?
    
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
    
    
    @IBAction func unwindToDetiail(_ sender: UIStoryboardSegue) {
        
        coutOfGood.text = String((products?.countRatingGood)!)
        countOfFair.text = String((products?.countRatingFair)!)
        countOfSad.text = String((products?.countRatingSad)!)
    
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (products?.comment.count)! + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewCollection", for: indexPath) as! ReviewCollectionViewCell
        cell.detailOfProduct.text = products?.comment[indexPath.row - 1]
        //            cell.nameReviewInCollection.text = products?.userName[indexPath.row - 1]
        //            cell.date.text = products?.dateTime[indexPath.row - 1]
        //
        //            let selepathIcon = products?.rating[indexPath.row - 1]
        //            if selepathIcon == 1 {
        //                let emoticonLike = UIImage(named: "emoticonLike")
        //                cell.imageIcon.image = emoticonLike
        //
        //            } else if selepathIcon == 2 {
        //                let emoticonFair = UIImage(named: "emoticonFair")
        //                cell.imageIcon.image = emoticonFair
        
        //
        //            } else if selepathIcon == 3 {
        //                let emoticonSad = UIImage(named: "emoticonSad")
        //                cell.imageIcon.image = emoticonSad
        //            }
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        collectionView.reloadData()
        
        return cell
    }
    
}

        




