//
//  GoblinKing.swift
//  RPG
//
//  Created by Ozan Demirel on 8.02.2016.
//  Copyright © 2016 Ozan. All rights reserved.
//

import Foundation
import UIKit

class GoblinKing: Enemy {
    
    override var type: String {
        get {
            return "Goblin King"
        }
    }

    override var loot: [String] {
        get {
            return ["Iron Necklade", "Iron Belt", "Glass Belt"]
        }
    }
    
    override var image: UIImage? {
        get {
            if let goblinKingImage = UIImage(named: "enem2.png") {
                return goblinKingImage
            } else {
                return nil
            }
        }
    }
    
    override func attempAttack(attackPwr: Int) -> Int {
        
        let rand = Int(arc4random_uniform(UInt32(100)))
        
        if rand > 30 {
            return super.attempAttack(attackPwr)
        } else {
            return 0
        }
        
    }
    
}