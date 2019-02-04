
import UIKit

class MyInterestedEventView: UIView{
  @IBOutlet weak var eventImage: UIImageView!
  @IBOutlet weak var posterImage: UIImageView!
  
  @IBOutlet weak var eventTime: UILabel!
  @IBOutlet weak var eventTitle: UILabel!
  
  func setUp(event: Event) {
    event.owner.images[0].getImage(imageView: posterImage)
    event.images[0].getImage(imageView: eventImage)
    eventTitle.text = event.title
    eventTime.text = event.getFormattedDate()
    
  }
  
  @IBOutlet var contentView: UIView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit(){
    Bundle.main.loadNibNamed("MyInterestedEvent", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
  }

}
