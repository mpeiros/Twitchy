//
//  GamesViewController.swift
//  Twitchy
//
//  Created by Max Peiros on 11/9/16.
//  Copyright © 2016 Max Peiros. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var gamesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gamesCollectionView.delegate = self
        gamesCollectionView.dataSource = self
        
        title = "Games"
        
        GameDataService.instance.downloadTopGames {
            for game in GameDataService.instance.games {
                game.downloadGameImage {
                    self.gamesCollectionView.reloadData()
                }
            }
        }
    }
    
    // Collection View Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GameDataService.instance.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameCell", for: indexPath) as? GameCell {
            
            let game = GameDataService.instance.games[indexPath.row]
            cell.configureCell(game: game)
            
            return cell
        
        } else {
            return GameCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let game = GameDataService.instance.games[indexPath.row]
        
        performSegue(withIdentifier: "showStreamsVC", sender: game)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (gamesCollectionView.bounds.width / 2) - 15
        let height = width * (4 / 3)
        return CGSize(width: width, height: height)
    }
    
    // Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showStreamsVC" {
            if let streamsVC = segue.destination as? StreamsViewController {
                if let game = sender as? Game {
                    streamsVC.game = game
                }
            }
        }
    }

}

