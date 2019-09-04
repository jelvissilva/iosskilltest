//
//  ViewController.swift
//  CinqSkillTest
//
//  Created by Elvis on 30/08/19.
//  Copyright © 2019 POCS. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialNavigationDrawer

fileprivate var hamburgerMenu = UIHamburgerMenuViewController.initializerMenu()


class HomeController: UIViewController, UIHamburgerMenuControlDelegate, HomeContentDelegate {
 

    
   // static let sharedInstance = BPFControlFlow()
    
    var menuItemsTransactional: [UIMenuItem] = []
    
    fileprivate enum BPFScreen: String {
        case Home = "Home"
        case Chat = "AtendimentoDigital"
        case AccountAccess = "AccountAccess"
        case SecurityKey = "SecurityKey"
        case UpdateRegister = "UpdateRegister"
        case DepositCheck = "DepositCheck"
        case EasyPhone = "EasyPhone"
        case ServiceNetwork = "ServiceNetwork"
        case UsefulPhones = "UtilsPhone"
        case FinancialIndices = "FinancialIndices"
        case DayEconomy = "DayEconomy"
        case Adjustments = "Adjustments"
        case VideoConference = "VideoConference"
        case Homologation = "Homologation"
        case Keyboard = "Keyboard"
        case Avalia = "AvaliaApp"
    }
    
    func initMenuItems() {
       
        DispatchQueue.main.async {
            
            var menuItems = [UIMenuItem]()
        
//
            let titleHome = "Home"
            let titleListaAlbum = "Lista de Albums"
            let titleSair = "Sair"
            
//            NSAttributedString.menuItem(titleInicio)
//            var attributedString = NSAttributedString(string: "")
//            var menuItemHome = UIMenuItem(itemId: "home", title: titleInicio, image: "", imagePressed: "", attributedString: attributedString , action: "inicioAction")
//
//            var menuItemTeste1 = UIMenuItem(itemId: "teste1", title: titleTeste1, image: "", imagePressed: "", attributedString: attributedString, action: "1")
//
//            var menuItemTeste2 = UIMenuItem(itemId: "teste2", title: titleTeste2, image: "", imagePressed: "", attributedString: attributedString, action: "2")
//
//            var menuItemTeste3 = UIMenuItem(itemId: "teste3", title: titleTeste3, image: "", imagePressed: "", attributedString: attributedString, action: "3")
            
            
            var attributedString = NSAttributedString(string: "")
            var menuItemHome = UIMenuItem(itemId: "inicio", title: titleHome, image: "", imagePressed: "",  action: "inicioAction")
            
            var menuItemListaAlbum = UIMenuItem(itemId: "listaAlbum", title: titleListaAlbum, image: "", imagePressed: "",  action: "1")
            
            var menuItemSair = UIMenuItem(itemId: "sair", title: titleSair, image: "", imagePressed: "",  action: "2")
            
            
            menuItems.append(menuItemHome)
            menuItems.append(menuItemListaAlbum)
            menuItems.append(menuItemSair)
        
            hamburgerMenu.populateMenu(menuItems: menuItems)

        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hamburgerMenu.delegate = self
        hamburgerMenu.newRootViewController(newViewController: self)
        

        DispatchQueue.main.async {
            
        }
    }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            setupMainView()
        }
    
    
        
        // Do any additional setup after loading the view.
        
//        let bottomDrawerViewController = MDCBottomDrawerViewController()
//        bottomDrawerViewController.contentViewController = self
//
//
//        present(bottomDrawerViewController,animated: true, completion: nil)
//
    
    fileprivate func setupMainView(){
        
        
        showMenuOnView(self.view)
        
        initMenuItems()
        
        
        //toogleMenuView()
        changeMenuAbleSlide(true)
        
        let storyName = "Home"
        let viewName = "HomeContentController"
        let storyboard = UIStoryboard(name: storyName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewName)
        
        
        let viewHomeContentController:HomeContentController = viewController as! HomeContentController
        viewHomeContentController.delegate = self
        
        rootViewController(viewHomeContentController)
        
        
    }
    
    func onMenuToggle() {
        hamburgerMenu.toogleMenu()
    }
    
    
    func rootViewController(_ viewController: UIViewController) {
       
        hamburgerMenu.newRootViewController(newViewController: viewController)
    }
    
   
    
    func didTouchMenuItem(menuItem: UIMenuItem) {
        
    }
    
    //MARK: - Menu Itens Control
    func showMenuOnView(_ view: UIView) {
        
        
        view.addSubview(hamburgerMenu.view)
    }
    
//    func menuItems(_ featureItems: [BRAFeatureItem]) {
//
//        let menuItems:[BUIMenuItem] = featureItems.map { (feature) -> BUIMenuItem in
//            BUIMenuItem(itemId:feature.featureId, title:feature.featureTitle, image:feature.featureImage, imagePressed:feature.featureImagePressed, attributedString: NSAttributedString.menuItem(feature.featureTitle), action: feature.featureAction)
//        }
//
//        hamburgerMenu.populateMenu(menuItems: menuItems)
//
//        menuItemsTransactional = menuItems
//
//        //MARK: DepositCheck
//        // Removed deposit check validation from menu and correctly added to BPFTransactionalViewController
//        //        if !NSUserDefaults.standardUserDefaults().boolForKey(kCheckDeposit_AcceptedTerms) {
//        //            for item in menuItems {
//        //                if item.itemId.uppercaseString.contains(NSLocalizedString("deposit_check_validation_itemid_verification", comment: "")) && item.title.uppercaseString.contains(NSLocalizedString("deposit_check_validation_title_verification", comment: "")) {
//        //                    NSUserDefaults.standardUserDefaults().setBool(true, forKey: kCheckDeposit_AcceptedTerms)
//        //                }
//        //            }
//        //        }
//    }
    
    
    //MARK: - Menu Navigation Controls
//    func pushViewController(_ viewController: BPFBaseViewController, animated: Bool) {
//        if viewController.classForCoder == hamburgerMenu.currentViewController()?.classForCoder { return }
//        hamburgerMenu.pushNewViewController(newViewController: viewController, animeted: animated)
//    }
//
//    func pushNormalViewController(_ viewController: UIViewController, animated: Bool) {
//        if viewController.classForCoder == hamburgerMenu.currentViewController()?.classForCoder { return }
//        hamburgerMenu.pushNewViewController(newViewController: viewController, animeted: animated)
//    }
//
//    func rootViewController(_ viewController: BPFBaseViewController) {
//        // SMIC UPDATE
//        if viewController.classForCoder == hamburgerMenu.currentViewController()?.classForCoder {
//            viewController.viewDidAppear(false)
//            return
//        }
//        hamburgerMenu.newRootViewController(newViewController: viewController)
//    }
    
//    func popViewController(animated: Bool) {
//        hamburgerMenu.popViewController(animated: animated)
//    }
//
//    func popToRootViewController(animated: Bool) {
//        hamburgerMenu.popToRootViewController(animated: animated)
//    }
//
//    func presentViewController(_ viewController: UIViewController, animated: Bool, completion: (()->Void)? = nil) {
//        hamburgerMenu.presentViewController(newViewController: viewController, animated: animated, completion: completion)
//    }
//
//    func removeViewControllersWithClass(_ controllersClass: [AnyClass]) {
//        hamburgerMenu.removeViewControllersWithClass(controllersClass)
//    }
    
    func dismissViewController(_ animated: Bool) {
        hamburgerMenu.dismissViewController(animated: animated)
    }
    
    func changeViewControllerToRoot() {
        hamburgerMenu.changeViewControllerToRoot()
    }
    
    //MARK: - Public Navigations
    
    /**
     Open or close Menu
     */
    func toogleMenuView() {
        hamburgerMenu.toogleMenu()
    }
    
    func closeMenuView() {
        hamburgerMenu.closeMenuHamburguer()
    }
    
    func changeMenuAbleSlide(_ enable: Bool) {
        hamburgerMenu.changeMenuAbleSlide(enable)
    }
    
    /**
     Get current view controller
     
     - returns: current view controller
     */
    func currentViewController() -> UIViewController? {
        return hamburgerMenu.currentViewController()
    }
    


}

