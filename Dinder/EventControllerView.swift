

import UIKit

class EventControllerView: UIView {
  @IBOutlet var contentView: UIView!
  
  @IBOutlet weak var mainImage: UIImageView!
  @IBOutlet weak var posterImage: UIImageView!
  @IBOutlet weak var posterName: UILabel!
  
  
  @IBOutlet weak var eventTitleLabel: UILabel!
  @IBOutlet weak var eventDescriptionLabel: UILabel!
  @IBOutlet weak var startTimeLabel: UILabel!
  @IBOutlet weak var userGenderLabel: UILabel!
  @IBOutlet weak var guestGenderLabel: UILabel!
  @IBOutlet weak var relationshipTypeLabel: UILabel!
  @IBOutlet weak var costLabel: UILabel!
  @IBOutlet weak var whoPaysLabel: UILabel!
  
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit(){
    Bundle.main.loadNibNamed("EventView", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
  }
  
  func populateEvent(_ event:Event){
    
    //title and description
    eventTitleLabel.text = event.title
    eventDescriptionLabel.text = event.description
    
    //-------------start time
    //TODO day of the week
    let gbLocale = Locale(identifier: "en_GB")
    let customFormat = "dMMMMhh"
    let ukFormat = DateFormatter.dateFormat(fromTemplate: customFormat, options: 0, locale: gbLocale)
    let formatter = DateFormatter()
    formatter.dateFormat = ukFormat
    startTimeLabel.text = formatter.string(from: event.startDateTime)
    
    //------------genders and relationship type
    userGenderLabel.text = "I am \(event.owner.gender.getString())"
    //default to anyone if not specified
    if let guestGender = event.lookingFor{
      guestGenderLabel.text = "Looking for \(guestGender.getString())"
    }else{
      guestGenderLabel.text = "Looking for \(Gender.NotApplicable.getString())"
    }
    if let relationshipType = event.eventRelationshipType{
      relationshipTypeLabel.text = "for \(relationshipType.getString())"
    }else{
       relationshipTypeLabel.text = "for \(RelationshipType.Anything.getString())"
    }
    
    //--------------cost and who pays
    costLabel.text = "$\(event.estimatedCostForGuestCAD)"
    whoPaysLabel.text = event.whoPays?.getString()
    
    //--------------Main Image
    event.images[0].getImage(imageView: mainImage)
    
    //--------------Poster Image and Name
    event.owner.images[0].getImage(imageView: posterImage)
    posterName.text = event.owner.firstName
    
  }

}
