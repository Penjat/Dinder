//
//  EventView.swift
//  Dinder
//
//  Created by Spencer Symington on 2019-01-31.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class EventView: UIView ,UITableViewDelegate,UITableViewDataSource{
    let eventTableView = UITableView()
    var mainImage :UIImage?
    
    
    
    override init(frame: CGRect) {
        
        super.init(frame:frame)
        
        eventTableView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        self.addSubview(eventTableView)
        eventTableView.register(EventMainCell.self, forCellReuseIdentifier: "eventMainCell")
        eventTableView.register(EventInfoCell.self, forCellReuseIdentifier: "eventInfoCell")
        
        eventTableView.delegate = self
        eventTableView.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 400
        }
        return 250
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell :EventMainCell = eventTableView.dequeueReusableCell(withIdentifier: "eventMainCell", for: indexPath) as! EventMainCell
//            cell.setUp(url: "https://www.flickr.com/photos/73154039@N00/15294645804/in/photolist-pix4kJ-21UvBjN-pnW1xb-2e7uhK4-P15wpv-4RhekR-pDN3d1-87MkD6-87MkMF-o1jnZ3-axhoRX-q42DXL-87Qxwf-9xyJzY-rjKvUs-k4uTVk-atioCb-7PKSnG-9hp2Ph-VreWGL-bHaNHH-FGbJrE-Qgq7Bx-iocUoU-cjG7Nb-qQP6pW-gZBEWQ-2iUmXW-5SQiP-W1NZC2-ddWrSg-6QJrA-9hWupn-nLGj2G-7ZyTbg-4xGAVM-eWLPdC-moXnH1-5Wxswg-cTmYAd-moX6Hf-9hSBCT-5AMJo4-9y67ft-aCHG1K-9fU5qD-9rJ4Vw-kadje9-hJghmy-oYJwCT")
            return cell
        }
        let cell :EventInfoCell = eventTableView.dequeueReusableCell(withIdentifier: "eventInfoCell", for: indexPath) as! EventInfoCell
        cell.backgroundColor = UIColor.gray
        cell.prepareForReuse()
        cell.setUp()
        
        return cell
    }
    func setUp(eventModel:Event){
//        mainImage = UIImage()
//        imageView
    }
    
}
