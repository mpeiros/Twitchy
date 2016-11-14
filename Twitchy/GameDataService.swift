//
//  GameDataService.swift
//  Twitchy
//
//  Created by Max Peiros on 11/11/16.
//  Copyright © 2016 Max Peiros. All rights reserved.
//

import Foundation
import Alamofire

class GameDataService {
    
    static let instance = GameDataService()
    
    fileprivate var _games = [Game]()
    
    var games: [Game] {
        return _games
    }
    
    func downloadTopGames(completed: @escaping DownloadComplete) {
        var nameForInit, imageUrlForInit: String!
        
        let url = TWITCH_URL_TOP_GAMES
        
        Alamofire.request(url).responseJSON { (response) in
            
            if let JSON = response.result.value as? Dictionary<String, AnyObject> {
                
                if let topGamesArray = JSON["top"] as? [Dictionary<String, AnyObject>], topGamesArray.count > 0 {
                    
                    for i in 0..<topGamesArray.count {
                        
                        if let gameDict = topGamesArray[i]["game"] as? Dictionary<String, AnyObject> {
                            
                            if let gameName = gameDict["name"] as? String {
                                nameForInit = gameName
                            }
                            
                            if let boxArt = gameDict["box"] as? Dictionary<String, AnyObject> {
                                
                                
                                if let imageUrl = boxArt["large"] as? String {
                                    imageUrlForInit = imageUrl
                                }
                            }
                        }
                        
                        let game = Game(name: nameForInit, imageUrl: imageUrlForInit)
                        self._games.append(game)
                    }
                }
            }
            
            completed()
        }
    }
    
}
