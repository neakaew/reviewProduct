
import os.log
import UIKit

class ReviewCollectionViewController: UICollectionViewController {

    private let reuseIdentifier = "reviewCollection"
    var productList = [Product]()
    var productes: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.isNavigationBarHidden = false

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (productes?.comment.count)! + 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let addReviews = collectionView.dequeueReusableCell(withReuseIdentifier: "addReview", for: indexPath) as! ReviewCollectionViewCell
            addReviews.layer.borderColor = UIColor.lightGray.cgColor
            addReviews.layer.borderWidth = 0.5
        return addReviews
        } else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewCollection", for: indexPath) as! ReviewCollectionViewCell
        cell.detailReviewInCollection.text = productes?.comment[indexPath.row - 1]
        cell.nameReviewInCollection.text = productes?.userName[indexPath.row - 1]
        cell.date.text = productes?.dateTime[indexPath.row - 1]
        
        let selepathIcon = productes?.rating[indexPath.row - 1]
        if selepathIcon == 1 {
            let emoticonLike = UIImage(named: "emoticonLike")
            cell.imageIcon.image = emoticonLike
            
        } else if selepathIcon == 2 {
           let emoticonFair = UIImage(named: "emoticonFair")
            cell.imageIcon.image = emoticonFair
            
        } else if selepathIcon == 3 {
            let emoticonSad = UIImage(named: "emoticonSad")
            cell.imageIcon.image = emoticonSad
        }
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: "ReviewCollectionViewCell",
                                                                         for: indexPath) as! ReviewCollectionViewCell
        
        let number = productes?.countRatingGood
        print("countRatingGood is \(String(describing: number!))")
        headerView.countOfGood.text = String(describing: number!)
        //self.productes?.countRatingGood = number!
        
        let numberes1 = productes?.countRatingFair
        print("countRatingFair is \(String(describing: numberes1!))")
        headerView.countOfFair.text = String(describing: numberes1!)
        
        let numberes2 = productes?.countRatingSad
        print("countRatingSad is \(String(describing: numberes2!))")
        headerView.countOfSad.text = String(describing: numberes2!)
        
        return headerView
    }
    
    @IBAction func unwindToAddReviewProductlList(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddReviewViewController, let addReview = sourceViewController.products {
            
            let newIndexPath = IndexPath(row: productList.count, section: 0)
            productList.append(addReview)
            collectionView?.insertItems(at: [newIndexPath])
            collectionView?.reloadSections(IndexSet([0]))
            //collectionView?.reloadData()
           
        }
    }

    
    @IBAction func cancelReviewAll(_ sender: UIBarButtonItem) {
        if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        collectionView?.reloadData()
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
            let AddReviewViewController = segue.destination as? AddReviewViewController
            AddReviewViewController?.products = self.productes
 
    }
}
