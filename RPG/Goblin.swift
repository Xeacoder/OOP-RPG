//
//  Goblin.swift
//  RPG
//
//  Created by Ozan Demirel on 8.02.2016.
//  Copyright © 2016 Ozan. All rights reserved.
//

import Foundation

class Goblin: Enemy {
    
    private var _type = "Goblin"
    
    override var loot: [String] {
        get {
            return ["Ring of Life", "Ring of Courage", "Ring of Curse"]
        }
    }
    
    var type: String {
        get {
            return _type
        }
    }
 
}
