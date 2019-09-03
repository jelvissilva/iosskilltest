import UIKit

internal class UIMenuNavigationController: UINavigationController {
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var preferredInterfaceOrientationForPresentation : UIInterfaceOrientation {
        return .portrait
    }
    
    override var shouldAutorotate : Bool {
        return false
    }
}
