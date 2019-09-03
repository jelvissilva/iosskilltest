import UIKit

internal class UIMenuFooterView: UIView {
    
    
    @IBOutlet fileprivate weak var textLabelFooter: UILabel!
    @IBOutlet fileprivate weak var imageViewFooter: UIImageView!
    
    fileprivate let kExternalURLCheck = "http"
    
    var featureItem :UIMenuItem?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        fillUIElementsWithModel()
    }
    
    // MARK: - Funcs
    
    /**
     Initialize cell with model
     */
    fileprivate func fillUIElementsWithModel() {
        guard let item = featureItem else {return}
        
        if item.image.contains(kExternalURLCheck) {
//            if let url = Foundation.URL(string: item.image) {
//                //imageViewFooter.loadImageFromExternalPath(nil, externalURL: url, forceDownload: false, useRenderingMode: true)
//            }
        } else {
            //imageViewFooter.image = UIImage(named: item.image)
        }
        
       // textLabelFooter.attributedText = item.attributedString
        textLabelFooter.textColor = UIColor.white
    }
}
