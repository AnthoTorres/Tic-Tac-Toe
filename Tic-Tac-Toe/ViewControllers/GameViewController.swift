//
//  GameViewController.swift
//  Tic-Tac-Toe
//
//  Created by Anthony Torres on 12/18/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var p1WinCountLabel: UILabel!
    @IBOutlet weak var p2WinCountLabel: UILabel!
    @IBOutlet weak var playersTurnLabel: UILabel!
    
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player2NameLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    var buttons: [UIButton] {
        return [button1, button2, button3, button4, button5, button6, button7, button8, button9]
    }
    var currentPlayer: Player?
    let player1 = Player(name: "Player1")
    let player2 = Player(name: "Player2")
    var player1WinCount: Int = 0
    var player2WinCount: Int = 0
    var turnCount: Int = 0
    var winningSet: [[Int]] = [[1, 2, 3], [1, 4, 7], [2, 5, 8], [3, 6, 9], [4, 5, 6], [7, 8, 9], [3, 5, 7], [1, 5, 9]]
    //let winningSet
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPlayer = player1
        updatePlayerTurnLabel()
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if currentPlayer == player1 {
            sender.setImage(#imageLiteral(resourceName: "xGreen"), for: .normal)
            sender.isEnabled = false
        } else {
            sender.setImage(#imageLiteral(resourceName: "oRed"), for: .normal)
            sender.isEnabled = false
        }
        currentPlayer?.locations.append(sender.tag)
        didGameEnd()
        turnCount += 1
        if turnCount == 9 {
            presentGameTied()
        }
        toggleCurrentPlayer()
    }
    
    func updateWinCount() {
        guard let currentPlayer = currentPlayer else { return }
        if currentPlayer == player1 {
            player2WinCount += 1
        } else {
            player1WinCount += 1
        }
    }
    
    func updateWinCountLabel() {
        p1WinCountLabel.text = "\(player1WinCount)"
        p2WinCountLabel.text = "\(player2WinCount)"
    }
    
    func updatePlayerTurnLabel() {
        guard let currentPlayer = currentPlayer else { return }
        playersTurnLabel.text = "It's \(currentPlayer.name)'s Turn!"
    }
    
    func toggleCurrentPlayer() {
        if currentPlayer == player2 {
            currentPlayer = player1
        } else {
            currentPlayer = player2
        }
    }
    
    func didGameEnd() {
        for set in winningSet {
            guard let currentPlayer = currentPlayer else { return }
            if currentPlayer == player1 {
                if currentPlayer.locations.contains(set[0]) {
                    if currentPlayer.locations.contains(set[1]) {
                        if currentPlayer.locations.contains(set[2]) {
                            presentGameWon()
                        }
                    }
                }
            } else if currentPlayer == player2 {
                if currentPlayer.locations.contains(set[0]) {
                    if currentPlayer.locations.contains(set[1]) {
                        if currentPlayer.locations.contains(set[2]) {
                            presentGameWon()
                        }
                    }
                }
            }
        }
    }
    
    func clear() {
        player1.locations = []
        player2.locations = []
        for button in buttons {
            button.setImage(nil, for: .normal)
            button.isEnabled = true
        }
        turnCount = 0
    }
    
    func presentGameTied() {
        let alert = UIAlertController(title: "Game Over", message: "Tie Game", preferredStyle: .alert)
        let playAgainAction = UIAlertAction(title: "Play Again", style: .default) { (action) in
            self.clear()
            self.updatePlayerTurnLabel()
        }
        alert.addAction(playAgainAction)
        present(alert, animated: true)
    }
    func presentGameWon() {
        guard let currentPlayer = currentPlayer else { return }
        let alert2 = UIAlertController(title: "Game Over", message: "\(currentPlayer.name) Won!", preferredStyle: .alert)
        let winAction = UIAlertAction(title: "Okay", style: .default) { (action) in
            self.clear()
            self.updateWinCount()
            self.updateWinCountLabel()
            self.updatePlayerTurnLabel()
        }
        alert2.addAction(winAction)
        present(alert2, animated: true)
    }
}
