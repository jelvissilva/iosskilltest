import Foundation

internal protocol UIHamburgerMenuInternalControlDelegate: class {
    func toogleMenuButton()
    func didTouchMenuItem(menuItem: UIMenuItem)
    func isMenuAbleToSlide() -> Bool
}
