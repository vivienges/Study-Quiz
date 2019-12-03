
import UIKit

extension UINavigationController {
    func setTransparentNavBar() {
        //navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
    }
}
