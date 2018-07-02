//
//  ProductTableViewController.swift
//  ReviewProdductsApp
//
//  Created by udom on 2/7/61.
//  Copyright © พ.ศ. 2561 ReviewProducts. All rights reserved.
//

import UIKit

class ProductTableViewController: UITableViewController {

    var reviewProduct = [ReviewProduct]()
    
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewProduct.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tabelViewCell", for: indexPath) as! ProductTableViewCell

        let review = reviewProduct[indexPath.row]
        
        cell.productNameInTableView.text = review.productNameInTableView
        cell.detailProductInTableView.text = review.detailProductInTableView

        return cell
    }
  
 

   

}
