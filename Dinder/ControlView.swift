

import UIKit

class ControlView: UIView {
  
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var eventTitleLabel: UITextField!
  @IBOutlet weak var eventDescription: UITextView!
  @IBOutlet weak var eventDatePicker: UIDatePicker!
  @IBOutlet weak var eventLocationField: UITextField!
  @IBOutlet weak var guestGenderToggle: UISegmentedControl!
  @IBOutlet weak var relationshipTypeToggle: UISegmentedControl!
  @IBOutlet weak var totalCostField: UITextField!
  @IBOutlet weak var costToggle: UISegmentedControl!
  
  
  
    override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit(){
    Bundle.main.loadNibNamed("CreateEventLayout", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
  }
 
    
  
  
}
