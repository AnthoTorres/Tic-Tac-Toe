//
//  Player1.swift
//  Tic-Tac-Toe
//
//  Created by Chris Anderson on 12/18/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

import UIKit

class Player {
    var x: UIImage
    var o: UIImage
    var wins: Int
    var turn: Bool
    
    init(x: UIImage, o: UIImage, wins: Int, turn: Bool) {
        self.x = x
        self.o = o
        self.wins = wins
        self.turn = turn
    }
}
