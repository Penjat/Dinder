

import UIKit

class CreateEventViewController: UIViewController {

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
  
  

}
