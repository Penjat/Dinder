

import UIKit

class MyActiveEventCell: UITableViewCell , NavigationDelegate {
  func navigateTo(user: User) {
    if let delegate = delegate{
      delegate.navigateTo(user: user)
    }
  }
  
  func navigateTo(event: Event) {
    if let delegate = delegate{
      delegate.navigateTo(event: event)
    }
  }
  
  @IBOutlet weak var activeEventController: MyActiveEventView!
  var delegate :NavigationDelegate?
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
  
  func setUp(event:Event, delegate:NavigationDelegate){
    activeEventController.setUp(event: event , delegate:self)
    self.delegate = delegate
  }

}
