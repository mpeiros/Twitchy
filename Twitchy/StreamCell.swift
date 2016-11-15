//
//  StreamCell.swift
//  Twitchy
//
//  Created by Max Peiros on 11/13/16.
//  Copyright © 2016 Max Peiros. All rights reserved.
//

import UIKit

class StreamCell: UITableViewCell {
    
    @IBOutlet weak var streamImageView: UIImageView!
    @IBOutlet weak var broadcasterName: UILabel!
    @IBOutlet weak var streamTitle: UILabel!
    @IBOutlet weak var streamViewers: UILabel!
    
    func configureCell(stream: Stream) {
        broadcasterName.text = stream.broadcasterName
        streamTitle.text = stream.streamTitle
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        streamViewers.text = "\(formatter.string(from: NSNumber(value: stream.streamViewerCount))!) viewers"
        
        if stream.streamImage != nil {
            streamImageView.image = stream.streamImage
        }
    }

}
