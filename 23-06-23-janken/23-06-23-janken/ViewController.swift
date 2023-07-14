//
//  ViewController.swift
//  23-06-23-janken
//
//  Created by 副山俊輔 on 2023/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var opponentImageView: UIImageView!
    @IBOutlet private weak var playerImageView: UIImageView!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = "じゃんけんスタート"
    }
    
    @IBAction func pressedRockButton(_ sender: UIButton) {
        playerImageView.image = UIImage(named: "rock")
        returnOpponentResult(Hand.rock)
    }
    @IBAction func pressedScissorsButton(_ sender: UIButton) {
        playerImageView.image = UIImage(named: "scissors")
        returnOpponentResult(Hand.scissors)
    }
    @IBAction func pressedPaperButton(_ sender: UIButton) {
        playerImageView.image = UIImage(named: "paper")
        returnOpponentResult(Hand.paper)
    }
    
    func returnOpponentResult(_ hand: Hand) {
        let opponentHand = Hand.random
        
        switch opponentHand {
        case Hand.rock:
            opponentImageView.image = UIImage(named: "\(Hand.rock)")
        case Hand.scissors:
            opponentImageView.image = UIImage(named: "\(Hand.scissors)")
        case Hand.paper:
            opponentImageView.image = UIImage(named: "\(Hand.paper)")
        }
        
        if opponentHand == hand {
            resultLabel.text = "あいこです"
        } else if (opponentHand == .rock && hand == .scissors) || (opponentHand == .scissors && hand == .paper) || (opponentHand == .paper && hand == .rock) {
            resultLabel.text = "あなたの負けです"
        } else {
            resultLabel.text = "あなたの勝ちです"
        }
    }
}

enum Hand: Int {
    case rock
    case scissors
    case paper
    
    static var random: Self {
        let randomValue = Int.random(in: 0..<3)
        return Hand(rawValue: randomValue)!
    }
}
