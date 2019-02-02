

import UIKit

class CreateEventViewController: UIViewController {
  
  
  @IBOutlet weak var titleField: UITextField!
  @IBOutlet weak var descriptionField: UITextView!
  
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet weak var whereField: UITextField!
  
  //looking for
  @IBOutlet weak var anythingButton: UIButton!
  @IBOutlet weak var friendshipButton: UIButton!
  @IBOutlet weak var posibleRomanceButton: UIButton!
  @IBOutlet weak var romanceButton: UIButton!
  @IBOutlet weak var lookingForLabel: UILabel!
  var lookingForButtons = [UIButton]()
  
  //cost break down
  @IBOutlet weak var estimatedCostLabel: UITextField!
  @IBOutlet weak var posterPaysButton: UIButton!
  @IBOutlet weak var dutchButton: UIButton!
  @IBOutlet weak var youPayButton: UIButton!
  @IBOutlet weak var freeButton: UIButton!
  var costButtons = [UIButton]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      lookingForButtons.append(anythingButton)
      lookingForButtons.append(friendshipButton)
      lookingForButtons.append(posibleRomanceButton)
      lookingForButtons.append(romanceButton)
      
      costButtons.append(posterPaysButton)
      costButtons.append(dutchButton)
      costButtons.append(youPayButton)
      costButtons.append(freeButton)
      
    }
  
  @IBAction func pressedCreate(_ sender: Any) {
    print("pressedCreate")
    
  }
  
  @IBAction func pressedCancel(_ sender: Any) {
    print("pressedCancel")
    self.dismiss(animated: true, completion: {})
    
  }
  @IBAction func toggleWhy(_ sender: UIButton) {
    
    
    for button in lookingForButtons {
      if button == sender{
        button.alpha = 1.0
      }else{
        button.alpha = 0.4
      }
    }
    
  }
  
  @IBAction func toggleWhoPays(_ sender: UIButton) {
    
    for button in costButtons {
      if button == sender{
        button.backgroundColor = UIColor.blue
      }else{
        button.backgroundColor = UIColor.clear
      }
    }
  }
  
  func processUserInput(){
    
    //TODO check all this input and make sure is clean
    let eventTitle = titleField.text
    let eventDescription = descriptionField.text
    let startTime = datePicker.date
    let evenLocationString = whereField.text
    
    //TODO generate enum from toggleButtons
//    let lookingFor =
    let estimatedCost = estimatedCostLabel.text
    //TODO generate enum from costButtons
//    let whoPays =
    
    //TODO put in gender
    
//    let event = Event(eventId: 0, title: eventTitle, eventRelationshipType: RelationshipType.Friendship, lookingFor: Gender.Male, estimatedCombinedTotalCostCAD: <#T##Int#>, estimatedCostForGuestCAD: <#T##Int#>, whoPays: <#T##Payer?#>, interestedUsers: <#T##[User]#>, owner: <#T##User#>, chosenPartner: <#T##User?#>, images: <#T##[Image]#>, location: <#T##CLLocation?#>, startDateTime: <#T##Date#>, endDateTime: <#T##Date#>, postedDateTime: <#T##Date#>, description: <#T##String#>)
    
  }
  
  
  

}
