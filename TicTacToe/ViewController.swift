//
//  ViewController.swift
//  TicTacToe
//
//  Created by Gagan on 18/01/22.
//

import UIKit



class ViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet var lblStatus: UILabel!
    @IBOutlet weak var scoreXlbl: UILabel!
    @IBOutlet weak var scoreOLbl: UILabel!
    
    var ticModel = TicTacToeModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateGameState()
        self.resetGameWithUI()
        self.addSwipeGesture()
    }
    
    //MARK: add swipe gesture
    func addSwipeGesture(){
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipe.direction = .down
        self.view.addGestureRecognizer(swipe)

    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .down:
                self.resetGameWithUI()
            default:
                break
            }
        }
    }
    
    //MARK: Button actions
    @IBAction func buttonTapped(sender: UIButton) {
        
        if ticModel.checkStatus(needToAddScore: false) == .O_Win || ticModel.checkStatus(needToAddScore: false) == .X_Win || ticModel.checkStatus(needToAddScore: false) == .matchDraw{
            return
        }
        
        if sender.currentImage != GameImages.blank_image{
            return
        }
      
        let btnTag = sender.tag
        var btnImage = UIImage()
        var btnValue: Int
        
        switch ticModel.checkStatus(needToAddScore: true) {
        case .player_A_Turn:
            btnImage = GameImages.x_image!
            btnValue = 1
            
        case .player_B_Turn:
            btnImage = GameImages.o_image!
            btnValue = 2
            
        default:
            btnImage = GameImages.blank_image!
            btnValue = 0
        }
        ticModel.board[(btnTag-1)/3][(btnTag-1)%3] = btnValue
        sender.setImage(btnImage, for: .normal)
        self.lblStatus.text = ticModel.checkStatus(needToAddScore: true).rawValue
        self.scoreXlbl.text = "X-Score : \(ticModel.xScore)"
        self.scoreOLbl.text = "O-Score : \(ticModel.yScore)"

    }

    @IBAction func btnResetTapped(sender: UIButton) {
        self.resetGameWithUI()
    }

    
    //MARK: check current status
    func updateGameState() {
        self.lblStatus.text = ticModel.checkStatus(needToAddScore: false).rawValue
    }

    //MARK: reset game with UI/Logic
    func resetGameWithUI(){
        ticModel.resetGame()
        for i in 1...9 {
            let btn = self.view.viewWithTag(i) as! UIButton
            btn.setImage(GameImages.blank_image, for: .normal)
        }
        updateGameState()
    }
}

