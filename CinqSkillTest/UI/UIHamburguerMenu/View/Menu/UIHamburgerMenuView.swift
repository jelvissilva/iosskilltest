import UIKit

internal class UIHamburgerMenuView: UIView {

    

    @IBOutlet weak var menuContainer: UIView!
    @IBOutlet weak var detailContainer: UIView!
    @IBOutlet weak var overlayView: UIControl!
    
    fileprivate let kAnimationDuration: TimeInterval = 0.3
    fileprivate let kTopOverlayMargin: CGFloat = 60
    fileprivate static let kHamburgerMenuStoryboardIdentifier = "UIHamburgerMenu"
    fileprivate static let kHamburgerMenuViewControllerIdentifier = "UIHamburgerMenuViewController"
    
    fileprivate var direction:CGFloat = 0
    fileprivate var dragContentStartX: CGFloat = 0
    weak var menuDelegate:UIHamburgerMenuInternalControlDelegate?
    
    static var isMenuOpen: Bool = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        menuContainer.accessibilityElementsHidden = true
        detailContainer.layer.shadowOpacity = 0.3
        detailContainer.layer.shadowRadius = 3.0
        detailContainer.layer.shadowColor = UIColor.black.cgColor
        detailContainer.layer.shadowPath = UIBezierPath(rect: detailContainer.bounds).cgPath
    }
    
    //MARK: - Gesture Recognizer
    @IBAction func handleGesture(_ sender: UIPanGestureRecognizer) {
        
        /* Return if has more than one ViewController pushed on NavigationController
        */
        let isMenuAbleToSlide = isAbleToSlide()
        if isMenuAbleToSlide == false {
            return
        }
        
        let view = sender.view;
        let translation = sender.translation(in: self);
    
        switch sender.state {
        case .began:
            direction = 0
            dragContentStartX = detailContainer.frame.origin.x;
            break
            
        case .changed:
            direction = translation.x
            
            // Correct position
            var newStartX  = dragContentStartX;
            newStartX += translation.x;
            
            if (newStartX >= 0 && newStartX <= self.menuContainer.frame.size.width) {
                detailContainer.frame.origin = CGPoint(x: newStartX, y: view!.frame.origin.y)
                overlayView.frame.origin = CGPoint(x: newStartX, y: kTopOverlayMargin)
            }
            
            break

        default:
            if direction < 0 {
                closeMenu()
            } else {
                openMenu()
            }
            
            break
        }
    }
    
    //MARK: - Actions
    @IBAction func touchOverlay(_ sender: AnyObject) {
        closeMenu()
    }
    
    //MARK: - Private Methods
    fileprivate func closeMenu(_ animated:Bool = true) {
        UIView.animate(withDuration: kAnimationDuration, animations: { [unowned self] () -> Void in
            UIHamburgerMenuView.isMenuOpen = false
            self.detailContainer.frame.origin.x = 0
            self.overlayView.frame.origin.x = 0
            self.overlayView.isHidden = true
            self.menuContainer.accessibilityElementsHidden = true
        }) 
    }
    
    fileprivate func openMenu() {
        UIView.animate(withDuration: kAnimationDuration, animations: { [unowned self] () -> Void in
            UIHamburgerMenuView.isMenuOpen = true
            self.detailContainer.frame.origin.x = self.menuContainer.frame.size.width
            self.overlayView.frame.origin.x = self.menuContainer.frame.size.width
            self.overlayView.isHidden = false
            self.menuContainer.accessibilityElementsHidden = false
            UIAccessibility.post(notification: UIAccessibility.Notification.screenChanged, argument: self.menuContainer)
        }) 
    }
    
    //MARK: - Menu controls   
    static func controllerFromStoryboard() -> UIHamburgerMenuViewController {
        let storyboard = UIStoryboard(name: kHamburgerMenuStoryboardIdentifier, bundle: nil)
        let hamburgerMenuViewController: UIHamburgerMenuViewController = storyboard.instantiateViewController(withIdentifier: kHamburgerMenuViewControllerIdentifier) as! UIHamburgerMenuViewController
        
        return hamburgerMenuViewController
    }
    
    func toggleMenu() {
        detailContainer.frame.origin.x == 0  ? openMenu() : closeMenu()
    }
    
    func closeMenuHamburguer() {
         closeMenu()
    }
    
    func isAbleToSlide() -> Bool {
        guard let isAble = menuDelegate?.isMenuAbleToSlide() else {
            return false
        }

        return isAble
    }
}
