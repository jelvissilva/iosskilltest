import UIKit


open class UIHamburgerMenuViewController: UIViewController {

    fileprivate let kMenuTableViewSegue = "MenuContainerSegue"
    fileprivate let kMenuNavigationSegue = "NavigationContainerSegue"
    
    weak var delegate:UIHamburgerMenuControlDelegate? = nil
    fileprivate var menuItems: [UIMenuItem] = []
    fileprivate var menuNavigationViewController:UIMenuNavigationController? = nil
    fileprivate var menuTableViewController: UIMenuTableViewController? = nil
    fileprivate var menuAbleToSlide = true
    fileprivate var isOpen = false
    fileprivate var mainView: UIHamburgerMenuView {
        return view as! UIHamburgerMenuView
    }
    fileprivate var lastClickedMenuItem: UIMenuItem?
    var throttle: UIThrottleHandler?
    var _fire: (() -> Void)? = nil
    
    //MARK: - Overrides
    open override func viewDidLoad() {
        super.viewDidLoad()
        mainView.overlayView.isHidden = true
        mainView.menuDelegate = self
        _fire = {
            self.mainView.toggleMenu()
            
            if let _delegate = self.delegate, let _menuItem = self.lastClickedMenuItem {
                _delegate.didTouchMenuItem(menuItem: _menuItem)
            }
        }
        
        throttle = UIThrottleHandler(interval: 1, delegate: self)
    }
    
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier! {
        case kMenuTableViewSegue:
            menuTableViewController = segue.destination as? UIMenuTableViewController
            menuTableViewController?.setDelegate(delegate: self)
        case kMenuNavigationSegue:
            menuNavigationViewController = segue.destination as? UIMenuNavigationController
        default:
            break
        }
    }
    
    override open var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return .portrait
    }
    
    override open var preferredInterfaceOrientationForPresentation : UIInterfaceOrientation {
        return .portrait
    }
    
    override open var shouldAutorotate : Bool {
        return false
    }
    
    //MARK: - Public Menu Methods
    public static func initializerMenu() -> UIHamburgerMenuViewController {
        
        let hamburgerMenuViewController = UIHamburgerMenuView.controllerFromStoryboard()
        
        return hamburgerMenuViewController
    }
    
    open func populateMenu(menuItems: [UIMenuItem]) {
        menuTableViewController?.initWith(items: menuItems)
    }
    
    open func toogleMenu() {
        mainView.toggleMenu()
        
    }
    
    open func closeMenuHamburguer() {
        mainView.closeMenuHamburguer()
    }
    
    open func changeMenuAbleSlide(_ enable: Bool) {
        self.menuAbleToSlide = enable
    }
    
    open func newRootViewController(newViewController: UIViewController, animated: Bool = false) {
        menuNavigationViewController?.setViewControllers([newViewController], animated: animated)
    }
    
    open func changeViewControllerToRoot() {
        guard let visibleViewControllerFromMenuNavigation:UIViewController = menuNavigationViewController?.visibleViewController else {
            return
        }
        if let _ = visibleViewControllerFromMenuNavigation as? UIAlertController{
            guard var viewControllers:[Any] = menuNavigationViewController?.viewControllers else{
                return
            }
            while !viewControllers.isEmpty{
                if let viewController = viewControllers.popLast() as? UIViewController{
                    menuNavigationViewController?.setViewControllers([viewController],  animated: false)
                    break
                }
            }
        } else{
            //TODO - Remove this snippet from this core class, BPFTransactionalBIAViewController must be pushed to the control flow don`t presented
//            if #available(iOS 10.0, *) {
//                if let _ = visibleViewControllerFromMenuNavigation as? BPFTransactionalBIAViewController{
//                    return
//                }
//            }
            menuNavigationViewController?.setViewControllers([visibleViewControllerFromMenuNavigation],  animated: false)
        }
    }
    
    open func pushNewViewController(newViewController: UIViewController, animeted: Bool = true) {
        menuNavigationViewController?.pushViewController(newViewController, animated: animeted)
    }
    
    open func popViewController(animated: Bool = true) {
        menuNavigationViewController?.popViewController(animated: animated)
    }
    
    open func popToRootViewController(animated: Bool = true) {
        menuNavigationViewController?.popToRootViewController(animated: animated)
    }
    
    open func presentViewController(newViewController: UIViewController, animated: Bool = true, completion: (()->Void)? = nil) {
        menuNavigationViewController?.present(newViewController, animated: animated, completion: completion)
    }
    
    open func dismissViewController(animated: Bool = true) {
        menuNavigationViewController?.dismiss(animated: animated, completion: nil)
    }
    
    open func removeViewControllersWithClass(_ controllersClass: [AnyClass]) {
        guard let controllers = menuNavigationViewController?.viewControllers else {return}
        
        let filteredControllers = controllers.filter { (controller) -> Bool in
            return !controllersClass.contains(where: { (classToDelete) -> Bool in
                return controller.classForCoder == classToDelete
            })
        }
        
        menuNavigationViewController?.viewControllers = filteredControllers
    }
    
    open func currentViewController() -> UIViewController? {
        return menuNavigationViewController?.visibleViewController
    }
}

extension UIHamburgerMenuViewController: UIHamburgerMenuInternalControlDelegate {
    func toogleMenuButton() {
        mainView.toggleMenu()
    }
    
    func didTouchMenuItem(menuItem: UIMenuItem) {
        self.lastClickedMenuItem = menuItem
        
        throttle?.fire()
    }
    
    func isMenuAbleToSlide() -> Bool {
        guard let menuNavigation = menuNavigationViewController, menuAbleToSlide else {
            return false
        }
        
        return menuNavigation.viewControllers.count > 1 ? false : true
    }
}

extension UIHamburgerMenuViewController : UIThrottleHandlerProtocol {
    var fire: (() -> Void)? {
        return _fire
    }
}
