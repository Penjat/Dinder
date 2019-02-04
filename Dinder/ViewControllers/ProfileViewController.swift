//
//  ProfileViewController.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-01-30.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController{
  var userToDisplay :User?
  var isMyProfile = false
  
  @IBOutlet weak var userImageScrollView: UIScrollView!
  @IBOutlet weak var profileImageController: PagingControllerView!
  
  @IBOutlet weak var userRatting: UILabel!
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var userNoShows: UILabel!
  @IBOutlet weak var userAboutMe: UILabel!
  
  override func viewDidLoad() {
      super.viewDidLoad()
      print("loaded profile view controller")
    
    
      
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("setting up the profile display")
    if let user = userToDisplay{
      userName.text = user.firstName
      userRatting.text = user.stringOfRating()
      //TODO put in about me section
      //userAboutMe.text = user.aboutMe
      profileImageController.setUpImages(images: user.images)
    }
    
  }
  

}
