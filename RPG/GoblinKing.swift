//
//  GoblinKing.swift
//  RPG
//
//  Created by Ozan Demirel on 8.02.2016.
//  Copyright © 2016 Ozan. All rights reserved.
//

import Foundation

class GoblinKing: Enemy {
    
    private var _type = "Goblin King"
    
    var type: String {
        get {
            return _type
        }
    }
    
    override var loot: [String] {
        get {
            return ["Iron Necklade", "Iron Belt", "Glass Belt"]
        }
    }
    
    override func attempAttack(attackPwr: Int, target: Character) -> Bool {
        
        let rand = Int(arc4random_uniform(UInt32(100)))
        
        if rand > 30 {
            return super.attempAttack(attackPwr, target: target)
        } else {
            return false
        }
        
    }
    
}