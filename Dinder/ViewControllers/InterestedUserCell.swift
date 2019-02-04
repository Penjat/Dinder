

import UIKit

class InterestedUserCell: UICollectionViewCell {
  @IBOutlet weak var userImage: UIImageView!
  
  func setUp(user:User){
    user.images[0].getImage(imageView: userImage)  
  }
}
