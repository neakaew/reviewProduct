
import UIKit

class ReviewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var nameReviewInCollection: UILabel!
    @IBOutlet weak var detailReviewInCollection: UITextView!
    @IBOutlet weak var imageIcon: UIImageView!

    @IBOutlet weak var nameOfProduct: UILabel!
    @IBOutlet weak var dateOfProduct: UILabel!
    
    @IBOutlet weak var imageOfProduct: UIImageView!
    @IBOutlet weak var detailOfProduct: UITextView!
    
    @IBOutlet weak var countOfGood: UILabel!
    @IBOutlet weak var countOfFair: UILabel!
    @IBOutlet weak var countOfSad: UILabel!
    
}
