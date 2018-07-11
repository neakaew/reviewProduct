
import os.log
import UIKit

class ProductCollectionViewController: UICollectionViewController {

    @IBOutlet var collection: UICollectionView!

    var productList = [Product]()
    var products: Product?
    var indexPathProduct:IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.isNavigationBarHidden = true
        //self.navigationController?.navigationBar.setBackgroundImage(nil, for:.default)
    }
    
    func loadSampleProducts() {
        let photo2 = UIImage(named: "bitmap")
        let photo3 = UIImage(named: "bitmap1")
        let photo4 = UIImage(named: "bitmap2")
        
        let productList1 = Product(photo: photo2, productName: "กาแฟ Abonzo คั่วกลาง", detailProduct: "กาแฟอาราบิก้าคั่วกลาง แบบเมล็ด ขนาด 250 กรัม รสชาติกลมกล่อม กลิ่นหอม ยังคงความเป็นผลไม้และความสดชื่น", price: "180")
        let productList2 = Product(photo: photo3, productName: "กาแฟอาราบิก้าคั่วอ่อน", detailProduct: "กาแฟอาราบิก้าคั่วกลาง แบบเมล็ด ขนาด 250 กรัม รสชาติกลมกล่อม กลิ่นหอม ยังคงความเป็นผลไม้และความสดชื่น", price: "200")
        let productList3 = Product(photo: photo4, productName: "กาแฟอาราบิก้าคั่วเข้ม", detailProduct: "กาแฟอาราบิก้าคั่วกลาง แบบเมล็ด ขนาด 250 กรัม รสชาติกลมกล่อม กลิ่นหอม ยังคงความเป็นผลไม้และความสดชื่น", price: "200")
        
        productList = [productList1, productList2, productList3] as! [Product]
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

       switch(segue.identifier ?? "") {

        case "AddItem":
            os_log("Add Products.", log: OSLog.default, type: .debug)

        case "ShowDetail":
            guard let productDetailViewController = segue.destination as? DetailProductsViewController else {
                fatalError("Error destination)")
            }

            guard let selectedProductCell = sender as? ProductCollectionViewCell else {
                fatalError("Error sender")
            }

            
            guard let indexPath = collectionView?.indexPath(for: selectedProductCell) else {
                fatalError("Error indexPath")
            }
            
            indexPathProduct = indexPath
            let selectedProducts = productList[indexPath.row - 1]
            productDetailViewController.products = selectedProducts
        
        
        default:
            fatalError("Unexpected Segue Identifier")
        }

    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count + 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let buttonCell = collectionView.dequeueReusableCell(withReuseIdentifier: "buttoncell", for: indexPath) as! ProductCollectionViewCell
            buttonCell.layer.borderColor = UIColor.lightGray.cgColor
            buttonCell.layer.borderWidth = 0.5
            buttonCell.layer.shadowColor = UIColor.black.cgColor
            buttonCell.layer.shadowOpacity = 1
            buttonCell.layer.masksToBounds = false
            return buttonCell

        } else {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! ProductCollectionViewCell
            let showproduct = productList[indexPath.row - 1]
            myCell.imageCollectionViewCell.image = showproduct.photo
            myCell.nameProductCollection.text = showproduct.productName
            myCell.namePriceCollection.text = showproduct.price + ("฿")
            myCell.countReview.text = String((showproduct.sumAmountOfReview))
            myCell.imageOfReview.image = showproduct.imageOfReview
            myCell.maxOfReview.text = String((showproduct.maxOfReview))
            myCell.layer.borderColor = UIColor.lightGray.cgColor
            myCell.layer.borderWidth = 0.5
            myCell.layer.shadowColor = UIColor.black.cgColor
            myCell.layer.shadowOpacity = 1
            myCell.layer.masksToBounds = false
            return myCell
        }
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: "ProductCollectionViewCell",
                                                                         for: indexPath) as! ProductCollectionViewCell
        
        headerView.nameTitle.text = "ABONZO Coffee"
        headerView.logo.image = UIImage(named: "logo")
        return headerView
    }
   
    @IBAction func unwindToProductList(_ sender: UIStoryboardSegue) {

        if let sourceViewController = sender.source as? ViewController, let product = sourceViewController.products {
            
           if let selectIndewPath = indexPathProduct {
                productList[selectIndewPath.row - 1] = product
                collectionView?.reloadItems(at: [selectIndewPath])

            } else {
            
                let newIndexPath = IndexPath(row: productList.count + 1, section: 0)
                productList.append(product)
                collectionView?.insertItems(at: [newIndexPath])
            }
            indexPathProduct = nil
        }
        collection.reloadData()
    }
    
}
