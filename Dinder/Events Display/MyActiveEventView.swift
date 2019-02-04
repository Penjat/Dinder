

import UIKit

class MyActiveEventView: UIView ,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout ,NavigationDelegate{
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
  
  @IBOutlet weak var interestedUserCollectionView: UICollectionView!
  
  @IBOutlet weak var noneInterestedmsg: UIView!
  
  var currentEvent :Event?
  var delegate :NavigationDelegate?
  
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
    let cell = interestedUserCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as!InterestedUserCell
    cell.backgroundColor = UIColor.blue
    if let event = currentEvent, let  interested = event.interestedUsers{
      cell.setUp(user: interested[indexPath.row] )
    }
    
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
    
    let cellSize = CGSize(width:120 , height:120)
    
    let layout = UICollectionViewFlowLayout()
    
    layout.itemSize = cellSize
    layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    layout.minimumLineSpacing = 1.0
    layout.minimumInteritemSpacing = 1.0
    layout.scrollDirection = .horizontal
    interestedUserCollectionView.setCollectionViewLayout(layout, animated: true)
    
    
  }
  
  func setUp(event: Event , delegate:NavigationDelegate) {
    //TODO check if images > 0
    currentEvent = event
    self.delegate = delegate
    event.images[0].getImage(imageView: eventImage)
    eventTitle.text = event.title
    let gbLocale = Locale(identifier: "en_GB")
    let customFormat = "dMMMMhh"
    let ukFormat = DateFormatter.dateFormat(fromTemplate: customFormat, options: 0, locale: gbLocale)
    let formatter = DateFormatter()
    formatter.dateFormat = ukFormat
    eventDate.text = formatter.string(from: event.startDateTime)
    
    if let interested = event.interestedUsers , interested.count > 0{
      noneInterestedmsg.isHidden = true
    }else{
      noneInterestedmsg.isHidden = false
    }
    
  }
  func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    print("clicked at indexPath: \(indexPath)")
    //clicked on a users picture
    if let event = currentEvent ,let users = event.interestedUsers  {
      delegate?.navigateTo(user: users[indexPath.row])
    }
    return false
  }
  
  

}
