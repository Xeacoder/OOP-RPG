//
//  Goblin.swift
//  RPG
//
//  Created by Ozan Demirel on 8.02.2016.
//  Copyright © 2016 Ozan. All rights reserved.
//

import Foundation
import UIKit

class Goblin: Enemy {
    
    override var type: String {
        get {
            return "Goblin"
        }
    }
    
    override var loot: [String] {
        get {
            return ["Ring of Life", "Ring of Courage", "Ring of Curse"]
        }
    }
    
    override var image: UIImage? {
        get {
            if let goblinImage = UIImage(named: "enem1.png") {
                return goblinImage
            } else {
                return nil
            }
        }
    }
 
}
