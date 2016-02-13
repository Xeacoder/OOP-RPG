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
    @IBOutlet var attackButtonView: UIButton!
    
    var enemy: Enemy!
    var player: Player!
    var enemyHP: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        enemyView.alpha = 0
        enemyRemainingHP.hidden = true
        player = Player(name: "Mithras", hp: 200, defence: 20, attackPwr: 100)
        generateRandomEnemy()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func attackButton(sender: UIButton!) {
        
        sender.enabled = false
        
        let damage = enemy.attempAttack(player.attackPwr)
        if enemy.isAlive {
            NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "AttackButtonEnabled", userInfo: nil, repeats: false)
            if damage > 0 {
                if enemy.wasCritical {
                    infoBar.text = "\(player.name) Attacked \(enemy.type) for \(damage) Damage with Critical Hit!!"
                    setRemainingHP()
                } else {
                    infoBar.text = "\(player.name) Attacked \(enemy.type) for \(damage) Damage."
                    setRemainingHP()
                }
            } else {
                infoBar.text = "Dodge!!!"
            }
        } else {
            infoBar.text = "\(enemy.type) has been killed by \(player.name)!"
            enemyRemainingHP.hidden = true
            NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "EnemyDeathAnimation:", userInfo: nil, repeats: true)
        }
        
    }
    
    func generateRandomEnemy() {
        
        let rand = Int(arc4random_uniform(UInt32(2)))
        if rand == 0 {
            enemy = Goblin(hp: 100, defence: 10, attackPwr: 20)
            enemyHP = 100
        } else if rand == 1 {
            enemy = GoblinKing(hp: 200, defence: 15, attackPwr: 30)
            enemyHP = 200
        }
        
        if enemy.image != nil {
            enemyView.image = enemy.image
            enemyView.alpha = 1
            enemyRemainingHP.hidden = false
            enemyRemainingHP.textColor = UIColor.greenColor()
            setRemainingHP()
            attackButtonView.enabled = true
            lootChest.hidden = true
            lootChest.alpha = 0
        }

    }
    
    func AttackButtonEnabled() {
        attackButtonView.enabled = true
    }
    
    func setRemainingHP() {
        enemyRemainingHP.text = "Remaining HP: \(enemy.hp)"
        if enemy.hp < Int(enemyHP*0.66) && enemy.hp > Int(enemyHP*0.33) {
            enemyRemainingHP.textColor = UIColor.yellowColor()
        } else if enemy.hp < Int(enemyHP*0.33) {
            enemyRemainingHP.textColor = UIColor.redColor()
        }
    }
    
    func EnemyDeathAnimation(timer: NSTimer) {
        enemyView.alpha -= 0.02
        if enemyView.alpha <= 0 {
            timer.invalidate()
            lootChest.hidden = false
            NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "ChestShowAnimation:", userInfo: nil, repeats: true)
        }
    }
    
    func ChestShowAnimation(timer: NSTimer) {
        lootChest.alpha += 0.05
        if lootChest.alpha >= 1 {
            timer.invalidate()
            lootChest.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "ChestTapped"))
        }
    }
    
    func ChestTapped() {
        if let drop = enemy.dropLoot() {
            player.addingItemToInventory(drop)
            infoBar.text = "\(player.name) has found \(drop)."
        }
        NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "ChestHideAnimation:", userInfo: nil, repeats: true)
    }
    
    func ChestHideAnimation(timer: NSTimer) {
        lootChest.alpha -= 0.05
        if lootChest.alpha <= 0 {
            timer.invalidate()
            lootChest.hidden = true
            generateRandomEnemy()
            enemyView.alpha = 0
            attackButtonView.enabled = false
            NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "GenerateEnemyAnimation:", userInfo: nil, repeats: true)
        }
    }
    
    func GenerateEnemyAnimation(timer: NSTimer) {
        enemyView.alpha += 0.02
        if enemyView.alpha >= 1 {
            timer.invalidate()
            attackButtonView.enabled = true
        }
    }
    
}

