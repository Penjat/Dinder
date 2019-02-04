//
//  PagingControllerView.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-02-03.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class PagingControllerView: UIView {
  var delegate :NavigationDelegate?
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var image1: UIImageView!
  @IBOutlet weak var image2: UIImageView!
  @IBOutlet weak var image3: UIImageView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit(){
    Bundle.main.loadNibNamed("PagingProfile", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
  }
  func setUpImages(images:[Image?]){
    if images.count > 0{
      if let image = images[0]{
        image.getImage(imageView:image1)
      }
    }
    if images.count > 1{
      if let image = images[1]{
        image.getImage(imageView:image2)
      }
    }
    if images.count > 2{
      if let image = images[2]{
        image.getImage(imageView:image3)
      }
    }
  }

}
