//
//  StreamDataService.swift
//  Twitchy
//
//  Created by Max Peiros on 11/13/16.
//  Copyright © 2016 Max Peiros. All rights reserved.
//

import Foundation
import Alamofire

class StreamDataService {
    
    static let instance = StreamDataService()
    
    fileprivate var _streams = [Stream]()
    
    var streams: [Stream] {
        return _streams
    }
    
    func downloadStreamsForGame(_ game: Game, completed: @escaping DownloadComplete) {
        var nameForInit, titleForInit, imageUrlForInit: String!
        var viewerCountForInit: Double!
        
        let gameString = game.gameName.replacingOccurrences(of: " ", with: "+")
        let url = TWITCH_URL_STREAMS_BASE + gameString + TWITCH_URL_STREAMS_CLIENT_ID
        
        Alamofire.request(url).responseJSON { (response) in
            
            if let JSON = response.result.value as? Dictionary<String, AnyObject> {
                
                if let streamsArray = JSON["streams"] as? [Dictionary<String, AnyObject>], streamsArray.count > 0 {
                    
                    for i in 0..<streamsArray.count {
                        
                        if let viewerCount = streamsArray[i]["viewers"] as? Double {
                            viewerCountForInit = viewerCount
                        }
                        
                        if let imageDict = streamsArray[i]["preview"] as? Dictionary<String, AnyObject> {
                            
                            if let imageUrl = imageDict["large"] as? String {
                                imageUrlForInit = imageUrl
                            }
                        }
                        
                        if let channelDict = streamsArray[i]["channel"] as? Dictionary<String, AnyObject> {
                            
                            if let name = channelDict["display_name"] as? String {
                                nameForInit = name
                            }
                            
                            if let title = channelDict["status"] as? String {
                                titleForInit = title
                            }
                        }
                        
                        let stream = Stream(name: nameForInit, title: titleForInit, viewerCount: viewerCountForInit, imageUrl: imageUrlForInit)
                        self._streams.append(stream)
                    }
                }
            }
            
            completed()
        }
    }
    
    func removeAllStreams() {
        _streams.removeAll()
    }
    
}

