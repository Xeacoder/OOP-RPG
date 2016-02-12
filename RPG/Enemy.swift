//
//  Enemy.swift
//  RPG
//
//  Created by Ozan Demirel on 8.02.2016.
//  Copyright © 2016 Ozan. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String] {
        get {
            return []
        }
    }
    
    func dropLoot() -> String? {
        
        if !isAlive && loot.count > 0 {
            
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
            
        } else {
            
            return nil
            
        }
        
    }
    
}