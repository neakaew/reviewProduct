
//
//  ProductCollectionViewController.swift
//  ReviewProdductsApp
//
//  Created by udom on 1/7/61.
//  Copyright © พ.ศ. 2561 ReviewProducts. All rights reserved.
//
import os.log
import UIKit

class ProductCollectionViewController: UICollectionViewController {
    
    @IBOutlet var collection: UICollectionView!
    
    var productList = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        
        let layout = self.collection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSize(width: (self.collection.frame.size.width - 20)/2, height: self.collection.frame.size.height/3)
        
        loadSampleProducts()
    }
   
    func loadSampleProducts() {
        let photo1 = UIImage(named: "image1")!
        let meal1 = Product(photo: photo1, productName: "Mouse", detailProduct: "Black", price: "150")!
        
        let photo2 = UIImage(named: "image1")!
        let meal2 = Product(photo: photo2, productName: "Mouse", detailProduct: "Black", price: "100")!
        
        let photo3 = UIImage(named: "image3")!
        let meal3 = Product(photo: photo3, productName: "Computer", detailProduct: "Red", price: "150")!
        
        productList += [meal1, meal2, meal3]
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "AddItem":
            os_log("Add Products.", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
            guard let productDetailViewController = segue.destination as? ViewController else {
                fatalError("Error destination)")
            }
            
            guard let selectedProductCell = sender as? ProductCollectionViewCell else {
                fatalError("Error sender")
            }
            
            guard let indexPath = collectionView?.indexPath(for: selectedProductCell) else {
                fatalError("Error selected cell ")
            }
            
            let selectedProducts = productList[indexPath.row]
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
        return productList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let buttonCell = collectionView.dequeueReusableCell(withReuseIdentifier: "buttoncell", for: indexPath) as! ProductCollectionViewCell
            buttonCell.layer.borderColor = UIColor.lightGray.cgColor
            buttonCell.layer.borderWidth = 0.5
            return buttonCell

        } else {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! ProductCollectionViewCell
            let showproduct = productList[indexPath.row]
            myCell.imageCollectionViewCell.image = showproduct.photo
            myCell.nameProductCollection.text = showproduct.productName
            myCell.namePriceCollection.text = showproduct.price
            myCell.layer.borderColor = UIColor.lightGray.cgColor
            myCell.layer.borderWidth = 0.5
        
            return myCell
        }
    }

    @IBAction func unwindToProductList(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ViewController, let product = sourceViewController.products {
            
                // Add new Product
                let newIndexPath = IndexPath(row: productList.count, section: 0)
                productList.append(product)
                collectionView?.insertItems(at: [newIndexPath])
        }
    }
    
}
