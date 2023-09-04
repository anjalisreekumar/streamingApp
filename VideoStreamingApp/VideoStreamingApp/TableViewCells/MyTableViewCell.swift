
import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var txtTitle: UILabel!
    
    @IBOutlet weak var txtChannel: UILabel!
    
    @IBOutlet weak var txtViews: UILabel!
    
        @IBOutlet weak var txtDate: UILabel!
    
    @IBOutlet weak var videoImageView: UIImageView!
    
    @IBOutlet weak var txtTags: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
