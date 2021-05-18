//
//  ViewController.swift
//  猜拳遊戲
//
//  Created by 蔡佳穎 on 2021/5/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var npcImageView: UIImageView!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var btnView: UIView!
    
    @IBOutlet weak var npcScoreLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!

    
    let npcImages = ["剪刀朝下", "石頭朝下", "布朝下"]
    let playerImages = ["剪刀朝上", "石頭朝上", "布朝上"]
    var npcScore = 0
    var playerScore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        npcImageView.isHidden = true
        playerImageView.isHidden = true
    }

    @IBAction func play(_ sender: UIButton) {
        npcImageView.isHidden = false
        playerImageView.isHidden = false
        
        let number = Int.random(in: 0...2)
        playerImageView.image = UIImage(named: playerImages[sender.tag])
        npcImageView.image = UIImage(named: npcImages[number])

        if playerScore <= 5 && npcScore <= 5 {
            if (sender.tag == 0 && number == 0) || (sender.tag == 1 && number == 1) || (sender.tag == 2 && number == 2) {
                resultLabel.text = "平手"
            } else if (sender.tag == 1 && number == 0) || (sender.tag == 2 && number == 1) || (sender.tag == 0 && number == 2) {
                resultLabel.text = "你贏了"
                playerScore += 1
                playerScoreLabel.text = "\(playerScore)"
            } else {
                resultLabel.text = "你輸了"
                npcScore += 1
                npcScoreLabel.text = "\(npcScore)"
            }
        }
        
        if playerScore == 5 && playerScore > npcScore {
            resultLabel.text = "WIN!!!"
            btnView.isHidden = true
        } else if npcScore == 5 && npcScore > playerScore {
            resultLabel.text = "LOSE!!!"
            btnView.isHidden = true
        }
    }
    @IBAction func playAgain(_ sender: UIButton) {
        btnView.isHidden = false
        playerScore = 0
        npcScore = 0
        playerScoreLabel.text = "\(playerScore)"
        npcScoreLabel.text = "\(npcScore)"
        resultLabel.text = "GO!"
    }
}

