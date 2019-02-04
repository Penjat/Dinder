

import UIKit

class MyActiveEventView: UIView {
  
  
  @IBOutlet weak var eventImage: UIImageView!
  @IBOutlet weak var eventTitle: UILabel!
  @IBOutlet weak var eventDate: UILabel!
  
  @IBOutlet weak var interestedUsersCollectionView: UICollectionView!
  
  
  
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
    Bundle.main.loadNibNamed("MyActiveEvent", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
  }
  
  func setUp(event: Event) {
    //TODO check if images > 0
    
    event.images[0].getImage(imageView: eventImage)
    eventTitle.text = event.title
    let gbLocale = Locale(identifier: "en_GB")
    let customFormat = "dMMMMhh"
    let ukFormat = DateFormatter.dateFormat(fromTemplate: customFormat, options: 0, locale: gbLocale)
    let formatter = DateFormatter()
    formatter.dateFormat = ukFormat
    eventDate.text = formatter.string(from: event.startDateTime)
    
  }

}
