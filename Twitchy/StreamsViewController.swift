//
//  StreamsViewController.swift
//  Twitchy
//
//  Created by Max Peiros on 11/11/16.
//  Copyright © 2016 Max Peiros. All rights reserved.
//

import UIKit

class StreamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var streamsTableView: UITableView!
    
    var game: Game!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(game.gameName)"
        
        streamsTableView.delegate = self
        streamsTableView.dataSource = self
        
        StreamDataService.instance.downloadStreamsForGame(game) {
            for stream in StreamDataService.instance.streams {
                stream.downloadStreamImage {
                    self.streamsTableView.reloadData()
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        StreamDataService.instance.removeAllStreams()
    }
    
    // Table View Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StreamDataService.instance.streams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = streamsTableView.dequeueReusableCell(withIdentifier: "streamCell") as? StreamCell {
            
            let stream = StreamDataService.instance.streams[indexPath.row]
            cell.configureCell(stream: stream)
            
            return cell
        
        } else {
            return StreamCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (streamsTableView.bounds.width / 16) * 9
    }
    
}
