
import UIKit

class RatingControl: UIStackView {

    
    private var ratingButtons = [UIButton]()
    var rating = 0
    var products: Product?
    
    private func setupButtons() {
        
        let emoticonLike = UIImage(named: "emoticonLike")
        let emoticonFair = UIImage(named:"emoticonFair")
        let emoticonSad = UIImage(named:"emoticonSad")
        
        for _ in 0..<3 {
            rating += 1
        // Create the button
        let button = UIButton()
         print("////////\(rating)")
            if rating == 1 {
                button.setImage(emoticonLike, for: .normal)
            } else if rating == 2 {
                button.setImage(emoticonFair, for: .normal)
            } else if rating == 3 {
                button.setImage(emoticonSad, for: .normal)
            }
         
            
            
        // Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        // Add the button to the stack
        addArrangedSubview(button)
        ratingButtons.append(button)
    }
}
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }

    @objc func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.index(of: button)! + 1
        print("Button pressed \(rating)")
       
    }

}
    


