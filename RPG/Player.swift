//
//  Player.swift
//  RPG
//
//  Created by Ozan Demirel on 8.02.2016.
//  Copyright © 2016 Ozan. All rights reserved.
//

import Foundation

class Player: Character {
    
    private var _name = "Player"
    private var _inventory = [String]()
    
    var name: String {
        get {
            return _name
        }
    }
    var inventory: [String] {
        get {
            return _inventory
        }
    }
    
    func addingItemToInventory(item: String) {
        _inventory.append(item)
    }
    
    convenience init(name: String, hp: Int, defence: Int, attackPwr: Int) {
        self.init(hp: hp, defence: defence, attackPwr: attackPwr)
        _name = name
    }
    
}