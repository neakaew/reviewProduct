//
//  bViewController.swift
//  ReviewProdductsApp
//
//  Created by udom on 4/7/61.
//  Copyright © พ.ศ. 2561 ReviewProducts. All rights reserved.
//

import UIKit

class bViewController: UIViewController {
var products: Product?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let test = products {
            bb.text = test.productName
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var bb: UILabel!
    
}
