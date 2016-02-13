//
//  ViewController.swift
//  RPG
//
//  Created by Ozan Demirel on 8.02.2016.
//  Copyright © 2016 Ozan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var enemyRemainingHP: UILabel!
    @IBOutlet var infoBar: UILabel!
    @IBOutlet var lootChest: UIImageView!
    @IBOutlet var enemyView: UIImageView!
    
    var enemy: Enemy!
    var player: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        enemyView.alpha = 0
        enemyRemainingHP.hidden = true
        player = Player(name: "Mithras", hp: 200, defence: 20, attackPwr: 30)
        generateRandomEnemy()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func attackButton(sender: AnyObject) {
    }
    
    func generateRandomEnemy() {
        
        let rand = Int(arc4random_uniform(UInt32(2)))
        if rand == 0 {
            enemy = Goblin(hp: 100, defence: 10, attackPwr: 20)
        } else if rand == 1 {
            enemy = GoblinKing(hp: 200, defence: 15, attackPwr: 30)
        }
        
        if enemy.image != nil {
            enemyView.image = enemy.image
            enemyView.alpha = 1
            enemyRemainingHP.hidden = false
            enemyRemainingHP.text = "Remaining HP: \(enemy.hp)"
        }

    }
    
}

