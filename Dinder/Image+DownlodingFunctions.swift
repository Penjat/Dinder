//
//  Image+DownlodingFunctions.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-02-02.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

extension Image{
  
  func getImage(imageView:UIImageView){
    
    
    if let image = uiImage{
      //if the image is already downloaded, then simply set the imageView.image
      imageView.image = image
      
    }else{
      //if the image has not been downloaded, download it and update the image view when it is done
      downloadSelf(imageView: imageView)
    }
    
  }
  func downloadSelf(imageView:UIImageView?){
    //tells the image to use its url to download itself
    //if an image view is passed in it will update the imageView when the download is complete
    
    
    //TODO swap the place holder url for the real on
    var imageURL = URL(string: "https://news.nationalgeographic.com/content/dam/news/2018/05/17/you-can-train-your-cat/02-cat-training-NationalGeographic_1484324.ngsversion.1526587209178.adapt.1900.1.jpg")!
    if let url = URL(string: urlString){
      imageURL = url
    }
    
    
     //var imageURL = URL(string: "https://news.nationalgeographic.com/content/dam/news/2018/05/17/you-can-train-your-cat/02-cat-training-NationalGeographic_1484324.ngsversion.1526587209178.adapt.1900.1.jpg")!
    
    
    
    let session = URLSession(configuration: .default)
    
    
    let downloadPicTask = session.dataTask(with: imageURL) { (data, response, error) in
      // The download has finished.
      if let e = error {
        print(#function ,"Error downloading picture: \(e)")
      } else {
        // No errors found.
        if let res = response as? HTTPURLResponse {
         // print(#function ,"Downloaded the image with response code \(res.statusCode)")
          if let imageData = data {
            
            // convert that Data into an image
            let image = UIImage(data: imageData)
            
            
            
            // set the uiImage
            self.uiImage = image
            
            
            DispatchQueue.main.async{
              
              //if an imageView was passed in, update the image
              if let imageView = imageView{
                if image == nil{
                  print("----------------the image is nil -----------")
                  //defaults to hys if image is nil
                  imageView.image = UIImage(named: "hys")
                  self.uiImage = UIImage(named: "hys")
                }else{
                  imageView.image = image
                }
                
              }
            }
            
          } else {
            print(#function ,"Couldn't get image: Image is nil")
          }
        } else {
          print(#function ,"Couldn't get response code for some reason")
        }
      }
    }
    
    downloadPicTask.resume()
    
  }
  
}
