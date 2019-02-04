

import UIKit

class MyActiveEventCell: UITableViewCell {
  @IBOutlet weak var activeEventController: MyActiveEventView!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
  
  func setUp(event:Event){
    activeEventController.setUp(event: event)
    
  }

}
