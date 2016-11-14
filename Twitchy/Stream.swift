//
//  Stream.swift
//  Twitchy
//
//  Created by Max Peiros on 11/13/16.
//  Copyright © 2016 Max Peiros. All rights reserved.
//

import UIKit
import Alamofire

class Stream: NSObject {
    
    fileprivate var _broadcasterName: String!
    fileprivate var _streamTitle: String!
    fileprivate var _streamViewerCount: Double!
    fileprivate var _streamImageUrl: String!
    fileprivate var _streamImage: UIImage?

    var broadcasterName: String {
        return _broadcasterName
    }
    
    var streamTitle: String {
        return _streamTitle
    }
    
    var streamViewerCount: Double {
        return _streamViewerCount
    }
    
    var streamImageUrl: String {
        return _streamImageUrl
    }
    
    var streamImage: UIImage? {
        return _streamImage
    }
    
    init(name: String, title: String, viewerCount: Double, imageUrl: String) {
        self._broadcasterName = name
        self._streamTitle = title
        self._streamViewerCount = viewerCount
        self._streamImageUrl = imageUrl
    }
    
    func downloadStreamImage(completed: @escaping DownloadComplete) {
        Alamofire.request(self._streamImageUrl).responseData { (response) in
            
            if let data = response.result.value {
                if let image = UIImage(data: data) {
                    self._streamImage = image
                }
            }
            
            completed()
        }
    }
    
}
