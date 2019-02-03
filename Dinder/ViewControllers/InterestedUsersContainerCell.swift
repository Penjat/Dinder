

import UIKit

class InterestedUsersContainerCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  
  var myEvent :Event?
  
  //this cell appears in conjunction with a MyPendingEventCell
  //contains a collection view that holds all interested users
  @IBOutlet weak var interestedUserCollectionView: UICollectionView!
  let layout = UICollectionViewFlowLayout()
    override func awakeFromNib() {
      super.awakeFromNib()
      interestedUserCollectionView.dataSource = self
      interestedUserCollectionView.delegate = self
      interestedUserCollectionView.collectionViewLayout = layout
      
      
      layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
      layout.minimumLineSpacing = 0
      layout.minimumInteritemSpacing = 32
      layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if let event = myEvent , let intereseted = event.interestedUsers{
      return intereseted.count
    }
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = interestedUserCollectionView.dequeueReusableCell(withReuseIdentifier: "interestedUserCell", for: indexPath) as! InterestedUserCell
    if let event = myEvent , let intereseted = event.interestedUsers{
      cell.setUp(user: intereseted[indexPath.row])
    }
    
    return cell
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 200, height: 200)
  }
  
  func setUp(event:Event){
    myEvent = event
  }

}
