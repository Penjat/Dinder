//
//  InterestedUsersContainerCell.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class InterestedUsersContainerCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
  
  
  //this cell appears in conjunction with a MyPendingEventCell
  //contains a collection view that holds all interested users
  @IBOutlet weak var interestedUserCollectionView: UICollectionView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        interestedUserCollectionView.dataSource = self
        interestedUserCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 100
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = interestedUserCollectionView.dequeueReusableCell(withReuseIdentifier: "interestedUserCell", for: indexPath)
    
    return cell
  }

}
