

import UIKit

class CreateEventViewController: UIViewController {
  @IBOutlet weak var createEventView: ControlView!
  
  


  
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
  
  @IBAction func pressedCreate(_ sender: Any) {
    print("pressedCreate")
    
  }
  
  @IBAction func pressedCancel(_ sender: Any) {
    print("pressedCancel")
    self.dismiss(animated: true, completion: {})
    
  }

  
  
  func processUserInput(){
    
    //TODO check all this input and make sure is clean
    let eventTitle = createEventView.eventTitleLabel.text
    let eventDescription = createEventView.eventDescription.text
    let startTime = createEventView.eventDatePicker
    let evenLocationString = createEventView.eventLocationField
    let totalCost = createEventView.totalCostField
    
    //TODO generate enum from toggleButtons
//    let lookingFor =
//    let estimatedCost = estimatedCostLabel.text
    //TODO generate enum from costButtons
//    let whoPays =
    
    //TODO put in gender
    
//    let event = Event(eventId: 0, title: eventTitle, eventRelationshipType: RelationshipType.Friendship, lookingFor: Gender.Male, estimatedCombinedTotalCostCAD: <#T##Int#>, estimatedCostForGuestCAD: <#T##Int#>, whoPays: <#T##Payer?#>, interestedUsers: <#T##[User]#>, owner: <#T##User#>, chosenPartner: <#T##User?#>, images: <#T##[Image]#>, location: <#T##CLLocation?#>, startDateTime: <#T##Date#>, endDateTime: <#T##Date#>, postedDateTime: <#T##Date#>, description: <#T##String#>)
    
  }
  
  
  

}
