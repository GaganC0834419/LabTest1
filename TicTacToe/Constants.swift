//
//  Constants.swift
//  TicTacToe
//
//  Created by Aman on 19/01/22.
//

import Foundation
import UIKit


public enum GameCurrentState : String {
    case player_A_Turn = "Now X turn"
    case player_B_Turn = "Now O turn"
    case X_Win = "X wins"
    case O_Win = "O wins"
    case matchDraw = "Game Draw"

}


struct GameImages {
    static let x_image = UIImage(named: "Cross")
    static let o_image = UIImage(named: "Circle")
    static let blank_image = UIImage(named: "blank")
}
