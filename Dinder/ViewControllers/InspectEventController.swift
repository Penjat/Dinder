

import UIKit

class InspectEventController: UIViewController {
  @IBOutlet weak var eventView: EventControllerView!
  var eventToLoad :Event?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  override func viewWillAppear(_ animated: Bool) {
    if let event = eventToLoad{
      eventView.populateEvent(event)
    }
  }
    

  

}
