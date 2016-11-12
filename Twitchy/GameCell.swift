//
//  GameCell.swift
//  Twitchy
//
//  Created by Max Peiros on 11/11/16.
//  Copyright © 2016 Max Peiros. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell {
    
    @IBOutlet weak var gameImageView: UIImageView!
    
    func configureCell(game: Game) {
        if game.gameImage != nil {
            gameImageView.image = game.gameImage
        }
    }
    
}
