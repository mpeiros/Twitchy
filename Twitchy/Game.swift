//
//  Game.swift
//  Twitchy
//
//  Created by Max Peiros on 11/11/16.
//  Copyright © 2016 Max Peiros. All rights reserved.
//

import UIKit
import Alamofire

class Game: NSObject {
    
    fileprivate var _gameName: String!
    fileprivate var _gameImageUrl: String!
    fileprivate var _gameImage: UIImage?
    
    var gameName: String {
        return _gameName
    }
    
    var gameImageUrl: String {
        return _gameImageUrl
    }
    
    var gameImage: UIImage? {
        return _gameImage
    }
    
    init(name: String, imageUrl: String) {
        self._gameName = name
        self._gameImageUrl = imageUrl
    }
    
    func downloadGameImage(completed: @escaping DownloadComplete) {
        Alamofire.request(self._gameImageUrl).responseData { (response) in
            
            if let data = response.result.value {
                if let image = UIImage(data: data) {
                    self._gameImage = image
                }
            }
            
            completed()
        }
    }

}
