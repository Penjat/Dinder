

import UIKit

class MyActiveEventCell: UITableViewCell {
  @IBOutlet weak var eventImage: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
  
  func setUp(event:Event){
    if event.images.count > 0{
      event.images[0].getImage(imageView: eventImage)
    }
    
  }

}
