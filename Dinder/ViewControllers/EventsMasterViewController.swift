

import UIKit

class EventsMasterViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
  var mainUser: User?
  var myEvents = [Event]()
  var interestedEvents = [Event]()
  
  var eventsToShow = [Event]()
  var showingMyEvents = true //true is my events, false is events I am interested in
  
  @IBOutlet weak var noEventsMsg: UIView!
  @IBOutlet weak var noEventsMsgLabel: UILabel!
  
  @IBOutlet weak var eventTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    eventTableView.dataSource = self
    eventTableView.delegate = self
    
    //TODO check the events
    
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    
    showMyEvents()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0{
      let cell = eventTableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! MyActiveEventCell
      cell.prepareForReuse()
      cell.setUp(event: eventsToShow[indexPath.section])
      
      cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20);
      
      
      
      return cell
    }
    let cell = eventTableView.dequeueReusableCell(withIdentifier: "interestedUserCell", for: indexPath) as! InterestedUsersContainerCell
    cell.prepareForReuse()
    cell.setUp(event: eventsToShow[indexPath.section])
    cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20);
    return cell
  }
  
//  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//    let  headerCell = tableView.dequeueReusableCell(withIdentifier: "myEventsHeader")
//    return headerCell
//  }
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 0
  }
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 0
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // 1 row for the event, one for the interested users
    return 2
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    return eventsToShow.count
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0{
      return 400
    }
    return 250
    
  }
  @IBAction func switchToMyEvents(_ sender: Any) {
    showMyEvents()
  }
  @IBAction func switchToInterestedEvents(_ sender: Any) {
    showInterestedEvents()
  }
  func showMyEvents(){
    eventsToShow = myEvents
    
    showingMyEvents = true
    
    if eventsToShow.count == 0 {
      showNoEvents(message:"you have created no events")
    }else{
      noEventsMsg.isHidden = true
    }
    
  }
  func showInterestedEvents(){
    eventsToShow = interestedEvents
    showingMyEvents = false
    
    //if no events show with message
    if eventsToShow.count == 0 {
      showNoEvents(message:"you are not intereste in any events")
    }else{
      noEventsMsg.isHidden = true
    }
    
    
    
  }
  func showNoEvents(message:String){
    noEventsMsg.isHidden = false
    noEventsMsgLabel.alpha = 0.0
    noEventsMsgLabel.text = "you are not intereste in any events"
    UIView.animate(withDuration: 1.0, animations: {
      self.noEventsMsgLabel.alpha = 1.0
    })
  }
}
