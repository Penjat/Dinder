

import UIKit

class CreateEventViewController: UIViewController {
  var dataManager :DataManager?
  var poster :User?
  @IBOutlet weak var createEventView: ControlView!
  
  


  
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
  
  @IBAction func pressedCreate(_ sender: Any) {
    print("pressedCreate")
    let eventTitle = createEventView.eventTitleLabel.text
    let eventDescription = createEventView.eventDescription.text
    let startTime = createEventView.eventDatePicker.date
    let evenLocationString = createEventView.eventLocationField
    let totalCost = createEventView.totalCostField
    
    let image = Image(keyword: "steak", urlString: "https://resizer.otstatic.com/v2/photos/large/25659757.jpg")
    var event = Event(eventId: 500,
                      title: eventTitle!,
                      eventRelationshipType: RelationshipType.Friendship,
                      lookingFor: Gender.NotApplicable,
                      estimatedCombinedTotalCostCAD: 0,
                      estimatedCostForGuestCAD: 0,
                      whoPays: Payer.PosterPays,
                      interestedUsers: [User](),
                      owner: poster!,
                      chosenPartner: nil,
                      images: [image],
                      location: nil,
                      startDateTime: startTime,
                      endDateTime: startTime,
                      postedDateTime: startTime,
                      description: eventDescription!,
                      imageKeywords: [String]())
    
    
    dataManager?.createMyEvent(event: event)
    self.dismiss(animated: true, completion: {})
    
  }
  
  @IBAction func pressedCancel(_ sender: Any) {
    print("pressedCancel")
    self.dismiss(animated: true, completion: {})
    
  }

  
  
  func processUserInput(){
    
    //TODO check all this input and make sure is clean
    
    
    //TODO generate enum from toggleButtons
//    let lookingFor =
//    let estimatedCost = estimatedCostLabel.text
    //TODO generate enum from costButtons
//    let whoPays =
    
    //TODO put in gender
    
//    let event = Event(eventId: 0, title: eventTitle, eventRelationshipType: RelationshipType.Friendship, lookingFor: Gender.Male, estimatedCombinedTotalCostCAD: <#T##Int#>, estimatedCostForGuestCAD: <#T##Int#>, whoPays: <#T##Payer?#>, interestedUsers: <#T##[User]#>, owner: <#T##User#>, chosenPartner: <#T##User?#>, images: <#T##[Image]#>, location: <#T##CLLocation?#>, startDateTime: <#T##Date#>, endDateTime: <#T##Date#>, postedDateTime: <#T##Date#>, description: <#T##String#>)
    
  }
  
  
  

}
