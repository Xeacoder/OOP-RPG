//
//  Person.swift
//  RPG
//
//  Created by Ozan Demirel on 8.02.2016.
//  Copyright © 2016 Ozan. All rights reserved.
//

import Foundation
import UIKit

class Character {
    
    private var _attackPwr: Int!
    private var _hp: Int!
    private var _defence: Int!
    private var _image = UIImage()
    private var _isAlive: Bool {
        if hp > 0 {
            return true
        } else {
            return false
        }
    }
    
    var image: UIImage? {
        get {
            return _image
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    var hp: Int {
        get {
            return _hp
        }
        set {
            _hp = newValue
        }
    }
    var defence: Int {
        get {
            return _defence
        }
    }
    var isAlive: Bool {
        get {
            return _isAlive
        }
    }
    
    
    init(hp: Int, defence: Int, attackPwr: Int) {
        _hp = hp
        _defence = defence
        _attackPwr = attackPwr
    }
    
    func attempAttack(attackPwr: Int, target: Character) -> Bool {
        target.hp -= min(attackPwr, (attackPwr-(100/defence)))
        return true
    }
    
}