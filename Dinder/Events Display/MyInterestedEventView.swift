
import UIKit

class MyInterestedEventView: UIView{
  func setUp(event: Event) {
    
  }
  
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
    Bundle.main.loadNibNamed("MyInterestedEvent", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
  }

}
