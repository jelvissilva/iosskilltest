import UIKit


internal class UIMenuTableViewController: UITableViewController {

    let kCellIdentifier = "UIMenuViewCell"
    let kCellHeight: CGFloat = 54
    let kFooterTag = 100
    let kExitKey = "Encerrar"
    
    fileprivate weak var delegate:UIHamburgerMenuInternalControlDelegate?
    fileprivate var menuItems: [UIMenuItem] = []
    fileprivate var exitFooterItem: UIMenuItem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    func setDelegate(delegate:UIHamburgerMenuInternalControlDelegate) {
        self.delegate = delegate
    }
    
    //MARK: - Initializers
    func initWith(items: [UIMenuItem]) {
        var exitItem: UIMenuItem? = nil
        self.menuItems = items
        
        var index = 0
        for item in self.menuItems {
            if item.itemId == kExitKey {
                exitItem = item
                self.menuItems.remove(at: index)
                
                break
            }
            index += 1
        }
        
        self.tableViewFooter(exitItem)
        self.tableView.reloadData()
    }
    
    func tableViewFooter(_ exitItem: UIMenuItem? = nil) {
        if let superView = self.tableView.superview {
            guard let footer = superView.viewWithTag(kFooterTag) else {
                if let item = exitItem {
                    if let footerView = Bundle.main.loadNibNamed("UIMenuFooterView", owner: self, options: nil)![0] as?
                        UIMenuFooterView {
                        footerView.frame = CGRect(x: 0, y: self.tableView.frame.size.height - kCellHeight, width: self.tableView.frame.size.width, height: kCellHeight)
                        footerView.tag = kFooterTag
                        footerView.featureItem = item
                        self.exitFooterItem = item
                    
                        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIMenuTableViewController.exitTouch(_:)))
                        footerView.addGestureRecognizer(singleTap)
                    
                        superView.addSubview(footerView)
                        self.tableView.frame.size.height -= kCellHeight
                    }
                }
                
                return
            }
            footer.removeFromSuperview()
            self.tableView.frame.size.height += kCellHeight
        }
    }
    
    @objc func exitTouch(_ sender : UITapGestureRecognizer) {
        if let exitItem = self.exitFooterItem {
            delegate?.didTouchMenuItem(menuItem: exitItem)
        }
    }
}

// MARK: - TableView DataSource
extension UIMenuTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kCellHeight

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UIMenuViewCell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath) as! UIMenuViewCell
        cell.featureItem = menuItems[indexPath.row]
        
        return cell
    }
}

// MARK: - TableView Delegate
extension UIMenuTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didTouchMenuItem(menuItem: menuItems[indexPath.row])
    }
}
