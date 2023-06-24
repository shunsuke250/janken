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
        returnOpponentResult(hand: 0)
    }
    @IBAction func pressedScissorsButton(_ sender: UIButton) {
        playerImageView.image = UIImage(named: "scissors")
        returnOpponentResult(hand: 1)
    }
    @IBAction func pressedPaperButton(_ sender: UIButton) {
        playerImageView.image = UIImage(named: "paper")
        returnOpponentResult(hand: 2)
    }
    
    func returnOpponentResult(hand: Int) {
        let opponentHand = Int.random(in: 0...2)
        if opponentHand == 0 {
            opponentImageView.image = UIImage(named: "rock")
        } else if opponentHand == 1 {
            opponentImageView.image = UIImage(named: "scissors")
        } else if opponentHand == 2 {
            opponentImageView.image = UIImage(named: "paper")
        }
        if opponentHand == hand {
            resultLabel.text = "あいこです"
        } else if (opponentHand == 0 && hand == 1) || (opponentHand == 1 && hand == 2) || (opponentHand == 2 && hand == 0) {
            resultLabel.text = "あなたの負けです"
        } else {
            resultLabel.text = "あなたの勝ちです"
        }
    }
}
