

import UIKit

class MyActiveEventView: UIView ,UICollectionViewDelegate, UICollectionViewDataSource {
  @IBOutlet weak var interestedUserCollectionView: UICollectionView!
  
  
  var currentEvent :Event?
  
  @IBOutlet weak var eventImage: UIImageView!
  @IBOutlet weak var eventTitle: UILabel!
  @IBOutlet weak var eventDate: UILabel!
  

  
  
  
  @IBOutlet var contentView: UIView!
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    if let event = currentEvent, let  interested = event.interestedUsers{
      return interested.count
    }
    return 0
    
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = interestedUserCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
    
    return cell
  }
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
    
    interestedUserCollectionView.register(InterestedUserCell.self, forCellWithReuseIdentifier: "MyCell")
    
    interestedUserCollectionView.dataSource = self
    interestedUserCollectionView.delegate = self
    
  }
  
  func setUp(event: Event) {
    //TODO check if images > 0
    currentEvent = event
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
