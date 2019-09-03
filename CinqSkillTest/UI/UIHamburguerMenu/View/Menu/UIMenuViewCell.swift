import UIKit

internal class UIMenuViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var textLabelCell: UILabel!
    
    // MARK: - Properties
    fileprivate let kExternalURLCheck = "http"
    
    var featureItem :UIMenuItem? {
        didSet {
            fillUIElementsWithModel()
        }
    }
    
    
    /**
     Initialize cell with model
     */
    fileprivate func fillUIElementsWithModel() {
        guard let item = featureItem else {return}
        
//        if item.image.contains(kExternalURLCheck) {
////            if let url = Foundation.URL(string: item.image) {
////                //imageViewCell.loadImageFromExternalPath(nil, externalURL: url, forceDownload: false)
////            }
//        } else {
//            //imageViewCell.image = UIImage(named: item.image)
//        }
        
        textLabelCell.text = item.title
        //textLabelCell.attributedText = item.attributedString
    }
}

