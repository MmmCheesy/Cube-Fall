//
//  GameScene.swift
//  Cube Fall
//
//  Created by Alexander Eckert on 10/6/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit
import CoreMotion
import AVFoundation

struct PhysicsCatagory {
    static var circle : UInt32 = 0x1 >> 1
    static var badGuy : UInt32 = 0x1 >> 0
    static var wall : UInt32 = 0x1 >> 0
}
class GameScene: SKScene, SKPhysicsContactDelegate {

    var bg = SKSpriteNode()
    var timer = Timer()
    var timer2 = Timer()
    var timer3 = Timer()
    let manager = CMMotionManager()
    var spawned = Int()
    var spawned2 = Int()
    var fullMovement : Bool = false
    var scenePaused: Bool = false
    var font = CGFloat()
    var part2Started: Bool = false
    var levelWon : Bool = false
    var deviceOrientation : Double = 0
    var endEndless : Int = 0
    var endRestart : Bool = false
    var left : Bool = false
    
    var pauseBtn = SKSpriteNode(imageNamed: "PauseBtn")
    var pauseArea = SKSpriteNode()
    var pauseCover = SKSpriteNode()
    var leave = SKLabelNode(fontNamed: "American Typewriter")
    var resume = SKLabelNode(fontNamed: "American Typewriter")
    
    var parentNode = SKSpriteNode()
    var badGuy = SKSpriteNode(imageNamed: "BadSkull2")
    var moneyGuy = SKSpriteNode(imageNamed: "MoneyCube")
    var circle = SKSpriteNode(imageNamed: "Player0")
    
    var wall1 = SKSpriteNode()
    var wall2 = SKSpriteNode()
    var wall3 = SKSpriteNode()
    var wall4 = SKSpriteNode()
    
    var delay = CGFloat()
    var mph = Int()
    var count = Int()
    var delay2 = Int()
    var mphVertical = Int()
    var mphHorizontal = Int()
    var count2 = Int()
    var skullSize = CGFloat()
    
    var pointCounter = SKLabelNode(fontNamed: "American Typewriter")
    var puntos : Int = 0
    
    var player : Int = 0
    var lives : Int = 0
    var usedAbility : Int = 0
    var speedBoost : Int = 1
    var invincible : Bool = false
    
    var audioPlayer : AVAudioPlayer = AVAudioPlayer()
    
    override func didMove(to view: SKView) {
        let defaults = UserDefaults.standard
        player = defaults.integer(forKey: "active")
        self.physicsWorld.contactDelegate = self
        bg = SKSpriteNode(imageNamed: "Color\(variables.lev + 1)")
        bg.size = CGSize(width: self.frame.width, height: self.frame.height)
        self.addChild(bg)
        self.addChild(parentNode)
        font = self.frame.height / 6
        
        let path = Bundle.main.path(forResource: "LevStart", ofType: "m4a")
        let soundUrl = URL(fileURLWithPath: path!)
        do {
            try self.audioPlayer = AVAudioPlayer(contentsOf: soundUrl)
            self.audioPlayer.volume = 1
            self.audioPlayer.numberOfLoops = 0
            self.audioPlayer.play()
        }catch {print(error)}
       
        if variables.lev == 0 {
            delay = 4
            mph = 4
            count = 4
            delay2 = 3
            mphVertical = 4
            mphHorizontal = 4 * Int(self.frame.width / self.frame.height)
            count2 = 6
            skullSize = 8
        }
        else if variables.lev == 1 {
            delay = 2
            mph = 4
            count = 12
            delay2 = 2
            mphVertical = 4
            mphHorizontal = 4 * Int(self.frame.width / self.frame.height)
            count2 = 0
            skullSize = 8
        }
        else if variables.lev == 2 {
            delay = 2.5
            mph = 4
            count = 0
            delay2 = 2
            mphVertical = 4
            mphHorizontal = 4 * Int(self.frame.width / self.frame.height)
            count2 = 16
            skullSize = 7
        }
        else if variables.lev == 3 {
            delay = 2
            mph = Int(3.5)
            count = 10
            delay2 = 2
            mphVertical = 3
            mphHorizontal = 3 * Int(self.frame.width / self.frame.height)
            count2 = 10
            skullSize = 8
        }
        else if variables.lev == 4 {
            delay = 1
            mph = 5
            count = 20
            delay2 = 1
            mphVertical = 4
            mphHorizontal = 4 * Int(self.frame.width / self.frame.height)
            count2 = 15
            skullSize = 10
        }
        else if variables.lev == 5 {
            delay = 4
            mph = 5
            count = 5
            delay2 = 4
            mphVertical = 6
            mphHorizontal = 6 * Int(self.frame.width / self.frame.height)
            count2 = 7
            skullSize = 2.5
        }
        else if variables.lev == 6 {
            delay = 1
            mph = 3
            count = 15
            delay2 = 2
            mphVertical = 4
            mphHorizontal = 4 * Int(self.frame.width / self.frame.height)
            count2 = 15
            skullSize = 6
        }
        else if variables.lev == 7 {
            delay = 3/2
            mph = 6
            count = 20
            delay2 = 3/2
            mphVertical = 6
            mphHorizontal = 6 * Int(self.frame.width / self.frame.height)
            count2 = 20
            skullSize = 8
        }
        else if variables.lev == 8 {
            delay = 1
            mph = 3
            count = 18
            delay2 = 1
            mphVertical = 3
            mphHorizontal = 3 * Int(self.frame.width / self.frame.height)
            count2 = 25
            skullSize = 8
        }
        else if variables.lev == 9 {
            delay = 0.5
            mph = 2
            count = 25
            delay2 = 1
            mphVertical = 2
            mphHorizontal = 2 * Int(self.frame.width / self.frame.height)
            count2 = 30
            skullSize = 12
        }
        else if variables.lev == 10 {
            delay = 4
            mph = 4
            count = 500
            delay2 = 3
            mphVertical = 4
            mphHorizontal = 4 * Int(self.frame.width / self.frame.height)
            count2 = 500
            endless()
            pointCounter.text = "0"
            pointCounter.fontSize = CGFloat(self.frame.height / 9)
            pointCounter.fontColor = UIColor.blue
            pointCounter.position = CGPoint(x: 0, y: (self.frame.height / 2) - (self.frame.height / 8))
            self.addChild(pointCounter)
            points()
            skullSize = 8
        }
        if defaults.string(forKey: "item3") == "activated" {
            mph = mph + 1
            mphVertical = mphVertical + 1
            mphHorizontal = mphHorizontal + 1
            defaults.set(nil, forKey: "item3")
        }
        if defaults.string(forKey: "item6") == "activated" {
            if defaults.string(forKey: "item6") == "activated" { defaults.set(nil, forKey: "item6") }
            fullMovement = true
        }
        
        start()
        
        if player == 1 || player == 10 || player == 15 || player == 16 || player == 21 || player == 23{
            speedBoost = 2
        } else if player == 11 || player == 22 || player == 17 || player == 19 || defaults.string(forKey: "item5") == "activated" {
            if defaults.string(forKey: "item5") == "activated" { defaults.set(nil, forKey: "item5") }
            speedBoost = 3
        } else {
            speedBoost = 1
        }
        if player == 12 || player == 13 || player == 15 || player == 16 || player == 18 || player == 20 || player == 22 || player == 21 {
            usedAbility = 1
        } else if player == 23 {
            usedAbility = 2
        }
        
        circle = SKSpriteNode(imageNamed: "Player\(player)")
        circle.position = CGPoint(x: 0, y: self.frame.height / -2.5)
        if player == 8 || player == 20 || player == 19 || defaults.string(forKey: "item4") == "activated" {
            if defaults.string(forKey: "item4") == "activated" { defaults.set(nil, forKey: "item4") }
            circle.size = CGSize(width: self.frame.height / 12, height: self.frame.height / 12)
            circle.physicsBody = SKPhysicsBody(circleOfRadius: self.frame.height / 24)
        }else{
            circle.size = CGSize(width: self.frame.height / 8, height: self.frame.height / 8)
            circle.physicsBody = SKPhysicsBody(circleOfRadius: self.frame.height / 16)
        }
        circle.physicsBody?.usesPreciseCollisionDetection = true
        circle.physicsBody?.categoryBitMask = PhysicsCatagory.circle
        circle.physicsBody?.collisionBitMask = PhysicsCatagory.badGuy
        circle.physicsBody?.contactTestBitMask = PhysicsCatagory.badGuy
        circle.physicsBody?.affectedByGravity = false
        circle.name = "circle"
        self.addChild(circle)
        
        if player == 9 || player == 20 || player == 17{
            badGuy.size = CGSize(width: self.frame.width / 12, height: self.frame.width / 12)
            moneyGuy.size = CGSize(width: self.frame.width / 12, height: self.frame.width / 12)
        }else{
            badGuy.size = CGSize(width: self.frame.width / skullSize, height: self.frame.width / skullSize)
            moneyGuy.size = CGSize(width: self.frame.width / skullSize, height: self.frame.width / skullSize)
        }
        
        wall1.size = CGSize(width: self.frame.width, height: self.frame.width / 10)
        wall1.position = CGPoint(x: 0, y: (self.frame.height / 2) + ((self.frame.width / 10) / 2))
        wall1.color = UIColor.clear
        wall1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width, height: self.frame.width / 10))
        wall1.physicsBody?.usesPreciseCollisionDetection = true
        wall1.physicsBody?.categoryBitMask = PhysicsCatagory.wall
        wall1.physicsBody?.collisionBitMask = PhysicsCatagory.circle
        wall1.physicsBody?.contactTestBitMask = PhysicsCatagory.circle
        wall1.physicsBody?.affectedByGravity = false
        wall1.physicsBody?.isDynamic = false
        self.addChild(wall1)
        
        wall2.size = CGSize(width: self.frame.width, height: self.frame.width / 10)
        wall2.position = CGPoint(x: 0, y: (self.frame.height / -2) - ((self.frame.width / 10) / 2))
        wall2.color = UIColor.clear
        wall2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width, height: self.frame.width / 10))
        wall2.physicsBody?.usesPreciseCollisionDetection = true
        wall2.physicsBody?.categoryBitMask = PhysicsCatagory.wall
        wall2.physicsBody?.collisionBitMask = PhysicsCatagory.circle
        wall2.physicsBody?.contactTestBitMask = PhysicsCatagory.circle
        wall2.physicsBody?.affectedByGravity = false
        wall2.physicsBody?.isDynamic = false
        self.addChild(wall2)
        
        wall3.size = CGSize(width: self.frame.width / 10, height: self.frame.height)
        wall3.position = CGPoint(x: (self.frame.width / 2) + ((self.frame.width / 10) / 2), y: 0)
        wall3.color = UIColor.clear
        wall3.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width / 10, height: self.frame.height))
        wall3.physicsBody?.usesPreciseCollisionDetection = true
        wall3.physicsBody?.categoryBitMask = PhysicsCatagory.wall
        wall3.physicsBody?.collisionBitMask = PhysicsCatagory.circle
        wall3.physicsBody?.contactTestBitMask = PhysicsCatagory.circle
        wall3.physicsBody?.affectedByGravity = false
        wall3.physicsBody?.isDynamic = false
        self.addChild(wall3)
        
        wall4.size = CGSize(width: self.frame.width / 10, height: self.frame.height)
        wall4.position = CGPoint(x: (self.frame.width / -2) - ((self.frame.width / 10) / 2), y: 0)
        wall4.color = UIColor.clear
        wall4.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width / 10, height: self.frame.height))
        wall4.physicsBody?.usesPreciseCollisionDetection = true
        wall4.physicsBody?.categoryBitMask = PhysicsCatagory.wall
        wall4.physicsBody?.collisionBitMask = PhysicsCatagory.circle
        wall4.physicsBody?.contactTestBitMask = PhysicsCatagory.circle
        wall4.physicsBody?.affectedByGravity = false
        wall4.physicsBody?.isDynamic = false
        self.addChild(wall4)
        
        pauseBtn.size = CGSize(width: self.frame.width, height: self.frame.height)
        pauseBtn.position = CGPoint(x: 0, y: 0)
        self.addChild(pauseBtn)
        
        pauseArea.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 10)
        pauseArea.position = CGPoint(x: (self.frame.width / 2) - ((self.frame.width / 10) / 2), y: (self.frame.height / 2) - ((self.frame.height / 10) / 2))
        self.addChild(pauseArea)
        
        if variables.lev == 0 {
            let tut1 = SKSpriteNode(imageNamed: "Tut1")
            tut1.size = CGSize(width: self.frame.width, height: self.frame.height)
            tut1.position = CGPoint(x: 0, y: 0)
            tut1.alpha = 0
            self.addChild(tut1)
            
            let wait1 = SKAction.wait(forDuration: 1)
            let fadeOn = SKAction.fadeAlpha(to: 1, duration: 0.5)
            let wait = SKAction.wait(forDuration: 2)
            let fadeOff = SKAction.fadeAlpha(to: 0, duration: 0.5)
            let remove = SKAction.removeFromParent()
            let sequence = SKAction.sequence([wait1, fadeOn, wait, fadeOff, remove])
            tut1.run(sequence)
        }
        
        if manager.isAccelerometerAvailable {
            self.manager.accelerometerUpdateInterval = 0.1
            self.manager.startAccelerometerUpdates(to: .main) {
                (data: CMAccelerometerData?, error: Error?) in
                if let acceleration = data?.acceleration {
                    if acceleration.y <= 0 {
                        self.circle.xScale = 1
                    }
                    else if acceleration.y >= 0 {
                        self.circle.xScale = -1
                    }
                    if self.scenePaused != true {
                        let movement = (acceleration.y)
                        let moveAction = SKAction.moveBy(x: CGFloat(movement) * -20 * CGFloat(self.speedBoost), y: 0, duration: 0.1)
                        self.circle.run(moveAction)
                        
                        if self.fullMovement == true || self.player == 10 {
                            if self.deviceOrientation == 0 {
                                self.deviceOrientation = (acceleration.x)
                                if self.deviceOrientation <= -0.5 {
                                    self.deviceOrientation = -0.5
                                }
                            }
                            let movement2 = (acceleration.x)
                            let moveAction2 = SKAction.moveBy(x: 0, y: CGFloat((movement2)-(self.deviceOrientation)) * 20 * CGFloat(self.speedBoost), duration: 0.1)
                            self.circle.run(moveAction2)
                        }
                    }
                }
            }
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        let firstBody = contact.bodyA.node as! SKSpriteNode
        let secondBody = contact.bodyB.node as! SKSpriteNode
        
        if (((firstBody.name == "circle") && (secondBody.name == "badGuy")) || ((firstBody.name == "badGuy") && (secondBody.name == "circle"))) && invincible != true {
            let defaults = UserDefaults.standard
            if ((player == 16 || player == 23) && (usedAbility == 1 || usedAbility == 2)) || defaults.string(forKey: "item2") == "activated" {
                if defaults.string(forKey: "item2") == "activated" { defaults.set(nil, forKey: "item2") } else { usedAbility -= 1 }
                if firstBody.name == "badGuy" {
                    firstBody.removeFromParent()
                } else {
                    secondBody.removeFromParent()
                }
            } else {
                loose()
                timer.invalidate()
                timer2.invalidate()
            }
        }
        else if ((firstBody.name == "circle") && (secondBody.name == "moneyGuy")) || ((firstBody.name == "moneyGuy") && (secondBody.name == "circle")) {
            let defaults = UserDefaults.standard
            var plusSkulls = SKSpriteNode()
            if self.player == 14 {
                plusSkulls = SKSpriteNode(imageNamed: "PlusSkulls2")
            } else {
                plusSkulls = SKSpriteNode(imageNamed: "PlusSkulls")
            }
            if firstBody.name == "moneyGuy"{
                firstBody.removeFromParent()
                plusSkulls.position = firstBody.position
            } else {
                secondBody.removeFromParent()
                plusSkulls.position = secondBody.position
            }
            let currency = defaults.integer(forKey: "money")
            if self.player == 14 {
                defaults.set(currency + 100, forKey: "money")
            } else {
                defaults.set(currency + 50, forKey: "money")
            }
            
            plusSkulls.size = CGSize(width: self.frame.width / 12, height: self.frame.width / 12)
            plusSkulls.alpha = 1
            self.addChild(plusSkulls)
            
            let action = SKAction.scale(to: CGSize(width: self.frame.width / 10, height: self.frame.width / 10), duration: 1)
            let action2 = SKAction.fadeAlpha(by: -1, duration: 1)
            let action3 = SKAction.removeFromParent()
            let sequence1 = SKAction.sequence([action2, action3])
            
            plusSkulls.run(action)
            plusSkulls.run(sequence1)
        }
    }
    func start(){
        self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(delay), target: self, selector: #selector(GameScene.badGuySpawn), userInfo: nil, repeats: true)
    }
    @objc func badGuySpawn() {
        if spawned >= count {
            timer.invalidate()
            startPt2()
        }
        else if spawned < count && left == false {
            spawned += 1
            
            let path = Bundle.main.path(forResource: "SkullSpawn", ofType: "m4a")
            let soundUrl = URL(fileURLWithPath: path!)
            do {
                try self.audioPlayer = AVAudioPlayer(contentsOf: soundUrl)
                self.audioPlayer.volume = 1
                self.audioPlayer.numberOfLoops = 0
                self.audioPlayer.play()
            }catch {print(error)}
            
            var green = CGFloat.random(in: 1...30)
            green.round(FloatingPointRoundingRule.toNearestOrAwayFromZero)
            if variables.lev != 10 {
                green = 12
            }
            var him = SKNode()
            if green == 2 {
                him = moneyGuy.copy() as! SKSpriteNode
                him.name = "moneyGuy"
            }else{
                him = badGuy.copy() as! SKSpriteNode
                him.name = "badGuy"
            }
            him.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: badGuy.size.width, height: badGuy.size.height))
            him.physicsBody?.usesPreciseCollisionDetection = true
            him.physicsBody?.categoryBitMask = PhysicsCatagory.badGuy
            him.physicsBody?.collisionBitMask = PhysicsCatagory.circle
            him.physicsBody?.contactTestBitMask = PhysicsCatagory.circle
            him.physicsBody?.affectedByGravity = false
            self.parentNode.addChild(him)
            
            let randomPosition = CGFloat.random(in: (self.frame.width / -2)...(self.frame.width / 2))
            let random2 = CGFloat.random(in: -8...8)
            let action = SKAction.move(to: CGPoint(x: 0 + randomPosition, y: self.frame.height / 1.8), duration: 0)
            him.run(action)
            
            let fall = SKAction.moveTo(y: self.frame.height / -1.8, duration: TimeInterval(mph))
            him.run(fall)
            
            let sub1 = SKAction.scale(by: 0.1, duration: 0)
            let add1 = SKAction.scale(by: 10, duration: 0.5)
            let sequence = SKAction.sequence([sub1, add1])
            him.run(sequence)
            
            if green != 2 {
                let rotate = SKAction.rotate(byAngle: random2, duration: TimeInterval(mph))
                him.run(rotate)
            }
            
            let wait = SKAction.wait(forDuration: TimeInterval(mph))
            let sub2 = SKAction.scale(by: 0.1, duration: 0.5)
            let remove = SKAction.removeFromParent()
            let block = SKAction.sequence([wait, sub2, remove])
            him.run(block)
        }
    }
    func startPt2(){
        fullMovement = true
        
        if part2Started == false {
            part2Started = true
            
            let portal = SKSpriteNode()
            portal.size = CGSize(width: self.frame.width, height: self.frame.width / 10)
            portal.position = CGPoint(x: 0, y: self.frame.height / 1.7)
            portal.color = UIColor.black
            portal.alpha = 0.8
            self.addChild(portal)
            
            let blur = SKSpriteNode()
            blur.size = CGSize(width: self.frame.width, height: self.frame.height)
            blur.position = CGPoint(x: 0, y: 0)
            blur.color = UIColor.white
            blur.alpha = 0
            self.addChild(blur)
            
            let fall = SKAction.move(to: CGPoint(x: 0, y: self.frame.height / -1.7), duration: TimeInterval(mph))
            let remove = SKAction.removeFromParent()
            let action = SKAction.sequence([fall, remove])
            portal.run(action)
            
            let wait = SKAction.wait(forDuration: TimeInterval(mph))
            let blurr = SKAction.fadeAlpha(to: 1, duration: 1)
            let disapear = SKAction.fadeAlpha(to: 0, duration: 1)
            let action2 = SKAction.sequence([wait, blurr, disapear, remove])
            blur.run(action2)
            
            let wait2 = SKAction.wait(forDuration: TimeInterval(mph + 1))
            let setCircle = SKAction.move(to: CGPoint(x: 0, y: 0), duration: 0)
            let action3 = SKAction.sequence([wait2, setCircle])
            circle.run(action3)
            
            let path = Bundle.main.path(forResource: "LevTrans", ofType: "m4a")
            let soundUrl = URL(fileURLWithPath: path!)
            do {
                try self.audioPlayer = AVAudioPlayer(contentsOf: soundUrl)
                self.audioPlayer.volume = 1
                self.audioPlayer.numberOfLoops = 0
                self.audioPlayer.play()
            }catch {print(error)}
            
            if variables.lev == 0 {
                let tut2 = SKSpriteNode(imageNamed: "Tut2")
                tut2.size = CGSize(width: self.frame.width, height: self.frame.height)
                tut2.position = CGPoint(x: 0, y: 0)
                tut2.alpha = 0
                self.addChild(tut2)
                
                let wait1 = SKAction.wait(forDuration: TimeInterval(mph) + 0.5)
                let fadeOn = SKAction.fadeAlpha(to: 1, duration: 0.5)
                let wait = SKAction.wait(forDuration: 2)
                let fadeOff = SKAction.fadeAlpha(to: 0, duration: 0.5)
                let remove = SKAction.removeFromParent()
                let sequence = SKAction.sequence([wait1, fadeOn, wait, fadeOff, remove])
                tut2.run(sequence)
            }
            if scenePaused != true {
                DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(mph), execute: {
                    self.timer2 = Timer.scheduledTimer(timeInterval: TimeInterval(self.delay2), target: self, selector: #selector(GameScene.BadGuySpawnPart2), userInfo: nil, repeats: true)
                })
            }
        }
        else {
            self.timer2 = Timer.scheduledTimer(timeInterval: TimeInterval(self.delay2), target: self, selector: #selector(GameScene.BadGuySpawnPart2), userInfo: nil, repeats: true)
        }
        
    }
    @objc func BadGuySpawnPart2(){
        if spawned2 >= count2 {
            timer2.invalidate()
            DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(mphHorizontal - delay2), execute: {
                self.win()
            })
        }
        else if spawned2 < count2 && left == false {
            spawned2 += 1
            
            let path = Bundle.main.path(forResource: "SkullSpawn", ofType: "m4a")
            let soundUrl = URL(fileURLWithPath: path!)
            do {
                try self.audioPlayer = AVAudioPlayer(contentsOf: soundUrl)
                self.audioPlayer.volume = 1
                self.audioPlayer.numberOfLoops = 0
                self.audioPlayer.play()
            }catch {print(error)}
            
            var green = CGFloat.random(in: 1...30)
            green.round(FloatingPointRoundingRule.toNearestOrAwayFromZero)
            if variables.lev != 10 {
                green = 12
            }
            
            var him = SKNode()
            if green == 2 {
                him = moneyGuy.copy() as! SKSpriteNode
                him.name = "moneyGuy"
            }else{
                him = badGuy.copy() as! SKSpriteNode
                him.name = "badGuy"
            }
            him.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: badGuy.size.width, height: badGuy.size.height))
            him.physicsBody?.usesPreciseCollisionDetection = true
            him.physicsBody?.categoryBitMask = PhysicsCatagory.badGuy
            him.physicsBody?.collisionBitMask = PhysicsCatagory.circle
            him.physicsBody?.contactTestBitMask = PhysicsCatagory.circle
            him.physicsBody?.affectedByGravity = false
            
            let side = CGFloat.random(in: 0...4)
            let rotate = CGFloat.random(in: -8...8)
            var place = CGFloat()
            if side >= 0 && side < 1 {
                place = CGFloat.random(in: (self.frame.width / -2)...(self.frame.width / 2))
                him.position = CGPoint(x: place, y: self.frame.height / 1.8)
                self.parentNode.addChild(him)
                
                let move = SKAction.moveBy(x: 0, y: -self.frame.height, duration: TimeInterval(mphVertical))
                let remove = SKAction.removeFromParent()
                let sequence = SKAction.sequence([move, remove])
                him.run(sequence)
                
                if green != 2 {
                    let rotateHim = SKAction.rotate(byAngle: rotate, duration: TimeInterval(mphVertical))
                    him.run(rotateHim)
                }
            }
            else if side >= 1 && side < 2{
                place = CGFloat.random(in: -(self.frame.height / 2)...(self.frame.height / 2))
                him.position = CGPoint(x: self.frame.width / 1.8, y: place)
                self.parentNode.addChild(him)
                
                let move = SKAction.moveBy(x: -self.frame.width, y: 0, duration: TimeInterval(mphHorizontal))
                let remove = SKAction.removeFromParent()
                let sequence = SKAction.sequence([move, remove])
                him.run(sequence)
                
                let rotateHim = SKAction.rotate(byAngle: rotate, duration: TimeInterval(mphHorizontal))
                him.run(rotateHim)
            }
            else if side >= 2 && side < 3 {
                place = CGFloat.random(in: self.frame.width / -2...(self.frame.width / 2))
                him.position = CGPoint(x: place, y: self.frame.height / -1.8)
                self.parentNode.addChild(him)
                
                let move = SKAction.moveBy(x: 0, y: self.frame.height, duration: TimeInterval(mphVertical))
                let remove = SKAction.removeFromParent()
                let sequence = SKAction.sequence([move, remove])
                him.run(sequence)
                
                let rotateHim = SKAction.rotate(byAngle: rotate, duration: TimeInterval(mphVertical))
                him.run(rotateHim)
            }
            else if side >= 3 && side <= 4 {
                place = CGFloat.random(in: -(self.frame.height / 2)...(self.frame.height / 2))
                him.position = CGPoint(x: self.frame.width / -1.8, y: place)
                self.parentNode.addChild(him)
                
                let move = SKAction.moveBy(x: self.frame.width, y: 0, duration: TimeInterval(mphHorizontal))
                let remove = SKAction.removeFromParent()
                let sequence = SKAction.sequence([move, remove])
                him.run(sequence)
                
                let rotateHim = SKAction.rotate(byAngle: rotate, duration: TimeInterval(mphHorizontal))
                him.run(rotateHim)
            }
            
            let sub1 = SKAction.scale(by: 0.1, duration: 0)
            let add1 = SKAction.scale(by: 10, duration: 0.5)
            let sequence = SKAction.sequence([sub1, add1])
            him.run(sequence)
            
            var wait = SKAction.wait(forDuration: TimeInterval(mphVertical))
            if (side >= 1 && side < 2) || (side >= 3 && side < 4) {
                wait = SKAction.wait(forDuration: TimeInterval(mphHorizontal))
            }
            let sub2 = SKAction.scale(by: 0.1, duration: 0.5)
            let remove = SKAction.removeFromParent()
            let block = SKAction.sequence([wait, sub2, remove])
            him.run(block)
        }
    }
    func points(){
        self.timer3 = Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(GameScene.addPoints), userInfo: nil, repeats: true)
    }
    @objc func addPoints(){
        if scenePaused == false {
            let defaults = UserDefaults.standard
            puntos += 1
            pointCounter.removeFromParent()
            let score = defaults.integer(forKey: "high")
            pointCounter.text = "\(puntos)               Best: \(score)"
            if score == 0 {
                pointCounter.text = "\(puntos)                      "
            }
            self.addChild(pointCounter)
        }
    }
    func win() {
        levelWon = true
        
        let defaults = UserDefaults.standard
        let money = defaults.integer(forKey: "money")
        let lev = defaults.integer(forKey: "lev")
        let tutBeaten = defaults.string(forKey: "tutBeaten")
        if variables.lev == lev {
            defaults.set(lev + 1, forKey: "lev")
            defaults.set(money + 100, forKey: "money")
            
            let congrats = SKSpriteNode(imageNamed: "Congrats")
            congrats.size = CGSize(width: self.frame.width / 2, height: self.frame.width / 4)
            congrats.position = CGPoint(x: self.frame.width / 4, y: self.frame.height / 3)
            congrats.zPosition = 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                self.addChild(congrats)
            })
        }
        if tutBeaten != "beaten" && variables.lev == 0 {
            defaults.set("beaten", forKey: "tutBeaten")
            defaults.set(money + 100, forKey: "money")
            
            let congrats = SKSpriteNode(imageNamed: "Congrats")
            congrats.size = CGSize(width: self.frame.width / 2, height: self.frame.width / 4)
            congrats.position = CGPoint(x: self.frame.width / 4, y: self.frame.height / 3)
            congrats.zPosition = 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                self.addChild(congrats)
            })
        }
        
        let winScreen = SKSpriteNode(imageNamed: "WinScene")
        let camera = SKCameraNode()
        let contin = SKLabelNode(fontNamed: "American Typewriter")
        let cover = SKSpriteNode()
        
        winScreen.size = CGSize(width: self.frame.width, height: self.frame.height)
        winScreen.position = CGPoint(x: 0, y: 0)
        winScreen.alpha = 0
        self.addChild(winScreen)
        
        contin.text = "Continue!"
        contin.fontSize = font
        contin.position = CGPoint(x: 0, y: self.frame.height / -3)
        contin.fontColor = UIColor.green
        
        cover.size = CGSize(width: self.frame.width, height: self.frame.height)
        cover.position = CGPoint(x: 0, y: 0)
        cover.color = UIColor.white
        cover.alpha = 0
        self.addChild(cover)
        
        self.addChild(camera)
        camera.position = CGPoint(x: 0, y: 0)
        self.camera = camera
        
        let sceneGrow = SKAction.scale(to: 0.5, duration: 1)
        let sceneReset = SKAction.scale(to: 1, duration: 0)
        let sequence1 = SKAction.sequence([sceneGrow, sceneReset])
        camera.run(sequence1)
        
        let coverAppear = SKAction.fadeAlpha(to: 1, duration: 1)
        let coverDisapear = SKAction.fadeAlpha(to: 0, duration: 1)
        let remove = SKAction.removeFromParent()
        let sequence2 = SKAction.sequence([coverAppear, coverDisapear, remove])
        cover.run(sequence2)
        
        let appear = SKAction.fadeAlpha(to: 1, duration: 0)
        let wait = SKAction.wait(forDuration: 1)
        let sequence = SKAction.sequence([wait, appear])
        winScreen.run(sequence)
        
        let path = Bundle.main.path(forResource: "LevBeat", ofType: "m4a")
        let soundUrl = URL(fileURLWithPath: path!)
        do {
            try self.audioPlayer = AVAudioPlayer(contentsOf: soundUrl)
            self.audioPlayer.volume = 1
            self.audioPlayer.numberOfLoops = 0
            self.audioPlayer.play()
        }catch {print(error)}
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.addChild(contin)
            
            let initialRotate = SKAction.rotate(byAngle: -0.2, duration: 0.3)
            let rotateLeft = SKAction.rotate(byAngle: -0.4, duration: 0.3)
            let rotateRight = SKAction.rotate(byAngle: 0.4, duration: 0.3)
            let rotation = SKAction.sequence([initialRotate, rotateRight, rotateLeft, rotateRight, rotateLeft, rotateRight, rotateLeft, rotateRight, rotateLeft, rotateRight, rotateLeft, rotateRight, initialRotate])
            contin.run(rotation)
        })
    }
    func loose(){
        let looseScreen = SKSpriteNode(imageNamed: "LooseScene")
        let whiteScreen = SKSpriteNode()
        
        looseScreen.size = CGSize(width: self.frame.width, height: self.frame.height)
        looseScreen.position = CGPoint(x: 0, y: 0)
        looseScreen.alpha = 0
        self.addChild(looseScreen)
        
        whiteScreen.size = CGSize(width: self.frame.width, height: self.frame.height)
        whiteScreen.position = CGPoint(x: 0, y: 0)
        whiteScreen.color = UIColor.white
        whiteScreen.alpha = 0
        self.addChild(whiteScreen)
        
        let wait = SKAction.wait(forDuration: 0.5)
        let wait2 = SKAction.wait(forDuration: 1.5)
        let fadeOn = SKAction.fadeAlpha(to: 1, duration: 0.5)
        let fadeOff = SKAction.fadeAlpha(to: 0, duration: 0.5)
        let remove = SKAction.removeFromParent()
        let sequence1 = SKAction.sequence([wait, fadeOn, wait2, remove])
        let sequence2 = SKAction.sequence([wait, wait2, fadeOn, fadeOff, remove])
        looseScreen.run(sequence1)
        whiteScreen.run(sequence2)
        
        parentNode.isPaused = true
        fullMovement = false
        scenePaused = false
        spawned = 0
        spawned2 = 0
        part2Started = false
        circle.removeAllActions()
        let circReset = SKAction.move(to: CGPoint(x: 0, y: self.frame.height / -2.5), duration: 0)
        circle.run(circReset)
        
        if player == 12 || player == 13 || player == 15 || player == 16 || player == 18 || player == 20 || player == 22 || player == 21 {
            usedAbility = 1
        } else if player == 23 {
            usedAbility = 2
        }
        
        if variables.lev == 10 {
            let defaults = UserDefaults.standard
            let high = defaults.integer(forKey: "high")
            if high < self.puntos {
                defaults.set(self.puntos, forKey: "high")
            }
        }
        
        let path = Bundle.main.path(forResource: "UponDeath", ofType: "m4a")
        let soundUrl = URL(fileURLWithPath: path!)
        do {
            try self.audioPlayer = AVAudioPlayer(contentsOf: soundUrl)
            self.audioPlayer.volume = 1
            self.audioPlayer.numberOfLoops = 0
            self.audioPlayer.play()
        }catch {print(error)}
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.parentNode.removeAllChildren()
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.parentNode.removeFromParent()
            self.addChild(self.parentNode)
            self.parentNode.isPaused = false
            self.timer.invalidate()
            self.timer2.invalidate()
            self.start()
            let circReset = SKAction.move(to: CGPoint(x: 0, y: self.frame.height / -2.5), duration: 0)
            self.circle.run(circReset)
            
            if variables.lev == 0 {
                let tut3 = SKSpriteNode(imageNamed: "Tut3")
                tut3.size = CGSize(width: self.frame.width, height: self.frame.height)
                tut3.position = CGPoint(x: 0, y: 0)
                tut3.alpha = 0
                self.addChild(tut3)
                
                let wait1 = SKAction.wait(forDuration: 1)
                let fadeOn = SKAction.fadeAlpha(to: 1, duration: 0.5)
                let wait = SKAction.wait(forDuration: 2)
                let fadeOff = SKAction.fadeAlpha(to: 0, duration: 0.5)
                let remove = SKAction.removeFromParent()
                let sequence = SKAction.sequence([wait1, fadeOn, wait, fadeOff, remove])
                tut3.run(sequence)
            }
            else if variables.lev == 10 {
                self.puntos = -1
                self.endEndless = 0
                self.endRestart = false
                self.endless()
                self.delay = 3
                self.mph = 4
                self.timer2.invalidate()
                self.timer.invalidate()
                self.start()
            }
        })
    }
    func pause(){
        self.parentNode.isPaused = true
        timer.invalidate()
        timer2.invalidate()
        timer3.invalidate()
        scenePaused = true
        self.audioPlayer.pause()
        
        pauseCover.removeFromParent()
        leave.removeFromParent()
        resume.removeFromParent()
        
        pauseCover.color = UIColor.black
        pauseCover.alpha = 0.8
        pauseCover.size = CGSize(width: self.frame.width - 20, height: self.frame.height - 20)
        pauseCover.position = CGPoint(x: 0, y: 0)
        self.addChild(pauseCover)
        
        resume.text = "resume"
        resume.fontSize = font
        resume.fontColor = UIColor.green
        resume.position = CGPoint(x: self.frame.width / 4, y: 0)
        self.addChild(resume)
        
        leave.text = "leave"
        leave.fontColor = UIColor.red
        leave.fontSize = font
        leave.position = CGPoint(x: self.frame.width / -4, y: 0)
        self.addChild(leave)
        
        let initialRotate = SKAction.rotate(byAngle: -0.2, duration: 0.3)
        let rotateLeft = SKAction.rotate(byAngle: -0.4, duration: 0.3)
        let rotateRight = SKAction.rotate(byAngle: 0.4, duration: 0.3)
        let rotation = SKAction.sequence([initialRotate, rotateRight, rotateLeft, rotateRight, rotateLeft, rotateRight, rotateLeft, rotateRight, rotateLeft, rotateRight, rotateLeft, rotateRight, initialRotate])
        resume.run(rotation)
        leave.run(rotation)
    }
    func endless() {
        if endRestart == false {
            endRestart = true
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(10), execute: {
            if self.endEndless == 0 { self.endEndless = 1;
                self.delay = 3
                self.mph = 4
                self.count = 500
                self.timer.invalidate()
                self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(self.delay), target: self, selector: #selector(GameScene.badGuySpawn), userInfo: nil, repeats: true)
                
                let action = SKAction.scale(by: 2, duration: 2)
                let action2 = SKAction.scale(by: 0.5, duration: 1)
                let action3 = SKAction.scale(by: 2, duration: 0.5)
                let action4 = SKAction.scale(by: 0.5, duration: 0.5)
                let action5 = SKAction.scale(by: 0.5, duration: 2)
                let sequence = SKAction.sequence([action, action2, action3, action4, action, action2, action, action5, action, action5])
                self.bg.run(sequence)
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(20), execute: {
            if self.endEndless == 1 { self.endEndless = 2;
                self.delay = 2.5
                self.mph = Int(3.5)
                self.timer.invalidate()
                self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(self.delay), target: self, selector: #selector(GameScene.badGuySpawn), userInfo: nil, repeats: true)
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(30), execute: {
            if self.endEndless == 2 { self.endEndless = 3;
                self.delay = 1
                self.mph = Int(2.5)
                self.timer.invalidate()
                self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(self.delay), target: self, selector: #selector(GameScene.badGuySpawn), userInfo: nil, repeats: true)
                
                let bg2 = SKSpriteNode(imageNamed: "Color0")
                bg2.position = CGPoint(x: 0, y: self.frame.height)
                bg2.yScale = -1
                bg2.zPosition = -2
                bg2.size = CGSize(width: self.frame.width, height: self.frame.height)
                self.addChild(bg2)
                let action = SKAction.moveBy(x: 0, y: -self.frame.height, duration: TimeInterval(self.mph))
                let action2 = SKAction.move(to: CGPoint(x: 0, y: self.frame.height), duration: 0)
                let remove = SKAction.removeFromParent()
                let sequence = SKAction.sequence([action, action2, action, action, action2, action, action, action2, action])
                let sequence2 = SKAction.sequence([action, action, action2, action, action, action2, action, action, remove])
                self.bg.run(sequence)
                bg2.run(sequence2)
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(50), execute: {
            if self.endEndless == 3 { self.endEndless = 4;
                self.delay = 1
                self.mph = 6
                self.timer.invalidate()
                self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(self.delay), target: self, selector: #selector(GameScene.badGuySpawn), userInfo: nil, repeats: true)
            }
            
            let bg2 = SKSpriteNode(imageNamed: "Color0")
            bg2.size = CGSize(width: self.frame.width, height: self.frame.height)
            bg2.zPosition = -2
            bg2.position = CGPoint(x: 0, y: 0)
            self.addChild(bg2)
            let action = SKAction.rotate(byAngle: 2 * 3.14159, duration: 6)
            let action2 = SKAction.rotate(byAngle: -2 * 3.14159, duration: 6)
            let action3 = SKAction.rotate(byAngle: 2 * 3.14159, duration: 3)
            let action4 = SKAction.rotate(byAngle: -2 * 3.14159, duration: 3)
            let sequence = SKAction.sequence([action, action2, action, action, action2, action3, action4, action3, action4])
            self.bg.run(sequence)
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(70), execute: {
            if self.endEndless == 4 { self.endEndless = 5;
                self.delay = 1
                self.mph = 2
                self.timer.invalidate()
                self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(self.delay), target: self, selector: #selector(GameScene.badGuySpawn), userInfo: nil, repeats: true)
            }
            self.endlessPt2()
        })
        }
    }
    func endlessPt2() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(30), execute: {
            if self.endEndless == 5 { self.endEndless = 6;
                self.delay2 = 3
                self.mphVertical = 4
                self.mphHorizontal = 4 * Int(self.frame.width / self.frame.height)
                self.count2 = 5000
                self.timer.invalidate()
                self.timer2.invalidate()
                self.startPt2()
                self.spawned = 0
                
                let action = SKAction.scale(by: 2, duration: 2)
                let action2 = SKAction.scale(by: 0.5, duration: 1)
                let action3 = SKAction.scale(by: 2, duration: 0.5)
                let action4 = SKAction.scale(by: 0.5, duration: 0.5)
                let action5 = SKAction.scale(by: 0.5, duration: 2)
                let sequence = SKAction.sequence([action, action2, action3, action4, action, action2, action, action5, action, action5])
                self.bg.run(sequence)
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(40), execute: {
            if self.endEndless == 6 { self.endEndless = 7;
                self.delay2 = 3
                self.mphVertical = 3
                self.mphHorizontal = 3 * Int(self.frame.width / self.frame.height)
                self.timer2.invalidate()
                self.timer2 = Timer.scheduledTimer(timeInterval: TimeInterval(self.delay2), target: self, selector: #selector(GameScene.BadGuySpawnPart2), userInfo: nil, repeats: true)
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(50), execute: {
            if self.endEndless == 7 { self.endEndless = 8;
                self.delay2 = 2
                self.mphVertical = 3
                self.mphHorizontal = 3 * Int(self.frame.width / self.frame.height)
                self.timer2.invalidate()
                self.timer2 = Timer.scheduledTimer(timeInterval: TimeInterval(self.delay2), target: self, selector: #selector(GameScene.BadGuySpawnPart2), userInfo: nil, repeats: true)
                
                let bg2 = SKSpriteNode(imageNamed: "Color0")
                bg2.position = CGPoint(x: 0, y: self.frame.height)
                bg2.yScale = -1
                bg2.zPosition = -2
                bg2.size = CGSize(width: self.frame.width, height: self.frame.height)
                self.addChild(bg2)
                let action = SKAction.moveBy(x: 0, y: -self.frame.height, duration: TimeInterval(self.mphVertical))
                let action2 = SKAction.move(to: CGPoint(x: 0, y: self.frame.height), duration: 0)
                let remove = SKAction.removeFromParent()
                let sequence = SKAction.sequence([action, action2, action, action, action2, action, action, action2, action])
                let sequence2 = SKAction.sequence([action, action, action2, action, action, action2, action, action, remove])
                self.bg.run(sequence)
                bg2.run(sequence2)
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(60), execute: {
            if self.endEndless == 8 { self.endEndless = 9;
                self.delay2 = 1
                self.mphVertical = 5
                self.mphHorizontal = 4 * Int(self.frame.width / self.frame.height)
                self.timer2.invalidate()
                self.timer2 = Timer.scheduledTimer(timeInterval: TimeInterval(self.delay2), target: self, selector: #selector(GameScene.BadGuySpawnPart2), userInfo: nil, repeats: true)
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(80), execute: {
            if self.endEndless == 9 { self.endEndless = 10;
                self.delay2 = 2
                self.mphVertical = 3
                self.mphHorizontal = 3 * Int(self.frame.width / self.frame.height)
                self.timer2.invalidate()
                self.timer2 = Timer.scheduledTimer(timeInterval: TimeInterval(self.delay2), target: self, selector: #selector(GameScene.BadGuySpawnPart2), userInfo: nil, repeats: true)
                
                let bg2 = SKSpriteNode(imageNamed: "Color0")
                bg2.size = CGSize(width: self.frame.width, height: self.frame.height)
                bg2.zPosition = -2
                bg2.position = CGPoint(x: 0, y: 0)
                self.addChild(bg2)
                let action = SKAction.rotate(byAngle: 2 * 3.14159, duration: 6)
                let action2 = SKAction.rotate(byAngle: -2 * 3.14159, duration: 6)
                let action3 = SKAction.rotate(byAngle: 2 * 3.14159, duration: 3)
                let action4 = SKAction.rotate(byAngle: -2 * 3.14159, duration: 3)
                let sequence = SKAction.sequence([action, action2, action, action, action2, action3, action4, action3, action4])
                self.bg.run(sequence)
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(100), execute: {
            if self.endEndless == 10 { self.endEndless = 11;
                self.delay2 = 2
                self.mphVertical = 2
                self.mphHorizontal = 2 * Int(self.frame.width / self.frame.height)
                self.timer2.invalidate()
                self.timer2 = Timer.scheduledTimer(timeInterval: TimeInterval(self.delay2), target: self, selector: #selector(GameScene.BadGuySpawnPart2), userInfo: nil, repeats: true)
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(130), execute: {
            if self.endEndless == 11 {
                self.delay2 = 1
                self.mphVertical = Int(2.5)
                self.mphHorizontal = Int(2.5) * Int(self.frame.width / self.frame.height)
                self.timer2.invalidate()
                self.timer2 = Timer.scheduledTimer(timeInterval: TimeInterval(self.delay2), target: self, selector: #selector(GameScene.BadGuySpawnPart2), userInfo: nil, repeats: true)
            }
        })
    }
    func touchUp(atPoint pos : CGPoint) {
        if levelWon == true {
            variables.donePlaying = true
            self.manager.stopAccelerometerUpdates()
        }
        if pauseArea.contains(pos){
            pause()
        }
        if resume.contains(pos) && scenePaused == true {
            scenePaused = false
            parentNode.isPaused = false
            timer = Timer()
            timer2 = Timer()
            if variables.lev == 10 {
                points()
            }
            
            pauseCover.removeFromParent()
            resume.removeFromParent()
            leave.removeFromParent()
            resume.removeAllActions()
            leave.removeAllActions()
            
            start()
        }
        if leave.contains(pos) && scenePaused == true {
            left = true
            self.manager.stopAccelerometerUpdates()
            timer.invalidate()
            timer2.invalidate()
            timer3.invalidate()
            puntos = 0
            endEndless = -1
            variables.donePlaying = true
            if variables.lev == 10 {
                let defaults = UserDefaults.standard
                let high = defaults.integer(forKey: "high")
                if high < self.puntos {
                    defaults.set(self.puntos, forKey: "high")
                }
            }
        }
    }
    func touchDown(atPoint pos : CGPoint) {
        if !pauseArea.contains(pos) && scenePaused != true {
            if player == 12 && usedAbility == 1 {
                usedAbility = 0
                invincible = true
                let rotate = SKAction.rotate(byAngle: 2 * 3.14, duration: 3)
                circle.run(rotate)
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                    self.invincible = false
                })
            }
            else if player == 13 && usedAbility == 1 {
                usedAbility = 0
                speedBoost = 3
                let rotate = SKAction.rotate(byAngle: 2 * 3.14, duration: 3)
                circle.run(rotate)
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                    self.speedBoost = 1
                })
            }
            else if player == 15 && usedAbility == 1 {
                usedAbility = 0
                parentNode.isPaused = true
                let rotate = SKAction.rotate(byAngle: 2 * 3.14, duration: 3)
                circle.run(rotate)
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                    self.parentNode.isPaused = false
                })
            }
            else if player == 18 && usedAbility == 1 {
                usedAbility = 0
                parentNode.removeAllChildren()
            }
            else if player == 20 && usedAbility == 1 {
                usedAbility = 0
                speedBoost = 3
                let rotate = SKAction.rotate(byAngle: 2 * 3.14, duration: 10)
                circle.run(rotate)
                DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
                    self.speedBoost = 1
                })
            }
            else if player == 22 && usedAbility == 1 {
                usedAbility = 0
                invincible = true
                let rotate = SKAction.rotate(byAngle: 2 * 3.14, duration: 8)
                circle.run(rotate)
                DispatchQueue.main.asyncAfter(deadline: .now() + 8, execute: {
                    self.invincible = false
                })
            }
            else if player == 21 && usedAbility == 1 {
                usedAbility = 0
                circle.removeFromParent()
                circle.size = CGSize(width: self.frame.height / 15, height: self.frame.height / 15)
                circle.physicsBody = SKPhysicsBody(circleOfRadius: self.frame.height / 30)
                circle.physicsBody?.usesPreciseCollisionDetection = true
                circle.physicsBody?.categoryBitMask = PhysicsCatagory.circle
                circle.physicsBody?.collisionBitMask = PhysicsCatagory.badGuy
                circle.physicsBody?.contactTestBitMask = PhysicsCatagory.badGuy
                circle.physicsBody?.affectedByGravity = false
                circle.name = "circle"
                self.addChild(circle)
                let rotate = SKAction.rotate(byAngle: 2 * 3.14, duration: 10)
                circle.run(rotate)
                DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
                    self.circle.removeFromParent()
                    self.circle.size = CGSize(width: self.frame.height / 8, height: self.frame.height / 8)
                    self.circle.physicsBody = SKPhysicsBody(circleOfRadius: self.frame.height / 16)
                    self.circle.physicsBody?.usesPreciseCollisionDetection = true
                    self.circle.physicsBody?.categoryBitMask = PhysicsCatagory.circle
                    self.circle.physicsBody?.collisionBitMask = PhysicsCatagory.badGuy
                    self.circle.physicsBody?.contactTestBitMask = PhysicsCatagory.badGuy
                    self.circle.physicsBody?.affectedByGravity = false
                    self.circle.name = "circle"
                    self.addChild(self.circle)
                })
            }
        }
        let path = Bundle.main.path(forResource: "ScreenTap", ofType: "m4a")
        let soundUrl = URL(fileURLWithPath: path!)
        do {
            try self.audioPlayer = AVAudioPlayer(contentsOf: soundUrl)
            self.audioPlayer.volume = 1
            self.audioPlayer.numberOfLoops = 0
            self.audioPlayer.play()
        }catch {print(error)}
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
}
