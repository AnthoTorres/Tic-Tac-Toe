//
//  Player1.swift
//  Tic-Tac-Toe
//
//  Created by Chris Anderson on 12/18/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

import UIKit

class Player {
    var wins: Int
    var locations: [Int]
    var name: String
    
    init(wins: Int = 0, locations: [Int] = [], name: String) {
        self.wins = wins
        self.locations = locations
        self.name = name
    }
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name
    }
}
