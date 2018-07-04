//
//  aViewController.swift
//  ReviewProdductsApp
//
//  Created by udom on 4/7/61.
//  Copyright © พ.ศ. 2561 ReviewProducts. All rights reserved.
//

import UIKit

class aViewController: UIViewController {
var products: Product?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let aa = products {
            labelname.text = aa.productName
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var labelname: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "b":
            let ReviewCollectionViewController = segue.destination as? bViewController
            ReviewCollectionViewController?.products = self.products
            
        
        default:
            print("Error")
        }
    }
    

}
