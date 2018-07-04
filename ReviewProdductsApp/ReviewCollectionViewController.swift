//
//  ReviewCollectionViewController.swift
//  ReviewProdductsApp
//
//  Created by udom on 2/7/61.
//  Copyright © พ.ศ. 2561 ReviewProducts. All rights reserved.
//
import os.log
import UIKit

private let reuseIdentifier = "reviewCollection"

class ReviewCollectionViewController: UICollectionViewController {

    var reviewProduct = [ReviewProduct]()
    var productList = [Product]()
  var products: Product?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleReview()


    }
    private func loadSampleReview() {
        
        let review1 = ReviewProduct(productNameInTableView: "computer", detailProductInTableView: "red,back,green")!
        let review2 = ReviewProduct(productNameInTableView: "printer", detailProductInTableView: "blue,back")!
        
        reviewProduct += [review1, review2]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return reviewProduct.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ReviewCollectionViewCell
        let showReview = reviewProduct[indexPath.row]
        cell.detailReviewInCollection.text = showReview.detailProductInTableView
        cell.nameReviewInCollection.text = showReview.productNameInTableView
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
   
        return cell
    }
    @IBAction func unwindToAddReviewProductlList(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddReviewViewController, let addReview = sourceViewController.reviewProducts {
            
            // Add a new meal.
            let newIndexPath = IndexPath(row: reviewProduct.count, section: 0)
            reviewProduct.append(addReview)
            collectionView?.insertItems(at: [newIndexPath])
        }
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
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
        super.prepare(for: segue, sender: sender)
        
        let AddReviewViewController = segue.destination as? AddReviewViewController
        AddReviewViewController?.products = self.products
            
     
    }
    
}
