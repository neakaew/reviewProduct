
import  UIKit

class Product {
    
    var photo: UIImage?
    var productName: String
    var detailProduct: String
    var price: String
    var comment = [String]()
    var userName = [String]()
    var rating = [Int]()
    var dateTime = [String]()
    var countRatingGood = Int()
    var countRatingFair = Int()
    var countRatingSad = Int()
    var sumAmountOfReview = Int()
    var maxOfReview = Int()
    var imageOfReview = UIImage()
    
    struct PropertyKey {
        static let photoKey = "photo"
        static let productNameKey = "productName"
        static let detailProductKey = "detailProduct"
        static let priceKey = "price"
        static let comment = "comment"
        static let userName = "userName"
}
    
    init?(photo: UIImage?, productName: String, detailProduct: String, price: String) {
        self.photo = photo
        self.productName = productName
        self.detailProduct = detailProduct
        self.price = price
        
    }
}
