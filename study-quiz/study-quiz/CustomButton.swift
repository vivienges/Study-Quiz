import UIKit

class CustomButton: UIButton {

    // for programmatically created buttons
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    // init for use in storyboards
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    // Style the button
    func setupButton() {
        layer.cornerRadius = 8
        
        let buttonColor = UIColor(named: "Primary")
        self.backgroundColor = buttonColor
        
        let labelColor = UIColor(named: "White")
        self.setTitleColor(labelColor, for: .normal)
    }

}
