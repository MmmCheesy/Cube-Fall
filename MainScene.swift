//
//  MainScene.swift
//  Cube Fall
//
//  Created by Alexander Eckert on 10/7/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

class MainScene: SKScene {
    
    var left = SKShapeNode()
    var right = SKShapeNode()
    var scroll = SKSpriteNode()
    var lev = Int()
    var CubeFall = SKSpriteNode(imageNamed: "CUBEFALL")
    var color = SKSpriteNode(imageNamed: "Color1")
    var cover = SKSpriteNode()
    var lock = SKSpriteNode(imageNamed: "Lock")
    
    var sc1: Bool = true
    var sc2: Bool = false
    var back = SKSpriteNode(imageNamed: "Back")
    
    var audioPlayer : AVAudioPlayer = AVAudioPlayer()
    
    var tutorial = SKLabelNode(fontNamed: "American Typewriter")
    var tutCube = SKShapeNode()
    
    var lev1 = SKLabelNode(fontNamed: "American Typewriter")
    var cube1 = SKShapeNode()
    
    var lev2 = SKLabelNode(fontNamed: "American Typewriter")
    var cube2 = SKShapeNode()
    
    var lev3 = SKLabelNode(fontNamed: "American Typewriter")
    var cube3 = SKShapeNode()
    
    var lev4 = SKLabelNode(fontNamed: "American Typewriter")
    var cube4 = SKShapeNode()
    
    var lev5 = SKLabelNode(fontNamed: "American Typewriter")
    var cube5 = SKShapeNode()
    
    var lev6 = SKLabelNode(fontNamed: "American Typewriter")
    var cube6 = SKShapeNode()
    
    var lev7 = SKLabelNode(fontNamed: "American Typewriter")
    var cube7 = SKShapeNode()
    
    var lev8 = SKLabelNode(fontNamed: "American Typewriter")
    var cube8 = SKShapeNode()
    
    var lev9 = SKLabelNode(fontNamed: "American Typewriter")
    var cube9 = SKShapeNode()
    
    var lev10 = SKLabelNode(fontNamed: "American Typewriter")
    var cube10 = SKShapeNode()
    
    var shop = SKLabelNode(fontNamed: "American Typewriter")
    var shopCube = SKShapeNode()
    
    var moneyCube = SKSpriteNode(imageNamed: "MoneyCube")
    var amount = SKLabelNode(fontNamed: "American Typewriter")
    
    override func didMove(to view: SKView) {
        let defaults = UserDefaults.standard
        let font = self.frame.height / 8
        let dist = self.frame.width / 2
        let area = self.frame.width / -16
        self.addChild(scroll)
        CubeFall.position = CGPoint(x: 0, y: 0)
        CubeFall.size = CGSize(width: self.frame.width, height: self.frame.height)
        CubeFall.zPosition = 1
        self.addChild(CubeFall)
        color.position = CGPoint(x: 0, y: 0)
        color.size = CGSize(width: self.frame.width, height: self.frame.height)
        color.zPosition = -1
        self.addChild(color)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width / 2, y: self.frame.height / 2))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width / 2, y: self.frame.height / -2))
        path.addLine(to: CGPoint(x: self.frame.width / 2, y: self.frame.height / 2))
        path.close()
        
        let path2 = Bundle.main.path(forResource: "GotIt3", ofType: "m4a")
        let soundUrl = URL(fileURLWithPath: path2!)
        
        do {
            try self.audioPlayer = AVAudioPlayer(contentsOf: soundUrl)
            self.audioPlayer.volume = 1
            self.audioPlayer.numberOfLoops = 20
            self.audioPlayer.play()
        }catch {print(error)}

        left = SKShapeNode(path: path.cgPath)
        left.strokeColor = UIColor.green
        left.fillColor = UIColor.green
        left.lineJoin = .miter
        left.xScale = 0.1
        left.yScale = 0.2
        left.zPosition = 4
        left.position = CGPoint(x: self.frame.width / -4.5, y: 0)
        
        right = SKShapeNode(path: path.cgPath)
        right.strokeColor = UIColor.green
        right.fillColor = UIColor.green
        right.lineJoin = .miter
        right.xScale = -0.1
        right.yScale = 0.2
        right.zPosition = 4
        right.position = CGPoint(x: self.frame.width / 4.5, y: 0)
        
        let action = SKAction.scale(by: 1.33, duration: 0.5)
        let action2 = SKAction.scale(by: 0.75, duration: 0.5)
        let wait = SKAction.wait(forDuration: 0.5)
        let sequence1 = SKAction.sequence([action, action2])
        let repeatAction = SKAction.repeat(sequence1, count: 10)
        let sequence2 = SKAction.sequence([wait, repeatAction])
        left.run(repeatAction)
        right.run(sequence2)
        
        shop.text = "Upgrades"
        shop.fontColor = UIColor.white
        shop.fontSize = font
        shop.zPosition = 3
        shop.zRotation = -0.25
        shop.position = CGPoint(x: Int(self.frame.width / -2), y: Int(font) / -2)
        
        shopCube = SKShapeNode.init(rect: CGRect(x: area + (self.frame.width / -2), y: area, width: self.frame.width / 8, height: self.frame.width / 8))
        shopCube.lineWidth = 5
        shopCube.strokeColor = UIColor.white
        shopCube.zPosition = 2
        shopCube.fillColor = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 0)
        shopCube.lineJoin = .miter
        
        tutorial.text = "Tutorial"
        tutorial.fontColor = UIColor.yellow
        tutorial.fontSize = font
        tutorial.zPosition = 3
        tutorial.zRotation = 0.25
        tutorial.position = CGPoint(x: 0, y: Int(font) / -2)
        
        tutCube = SKShapeNode.init(rect: CGRect(x: area, y: area, width: self.frame.width / 8, height: self.frame.width / 8))
        tutCube.lineWidth = 5
        tutCube.strokeColor = UIColor.yellow
        tutCube.zPosition = 2
        tutCube.fillColor = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 0)
        tutCube.lineJoin = .miter
        
        lev1.text = "Level One"
        lev1.fontColor = UIColor.brown
        lev1.fontSize = font
        lev1.zPosition = 3
        lev1.zRotation = -0.25
        lev1.position = CGPoint(x: dist * 1, y: font / -2)
        
        cube1 = SKShapeNode.init(rect: CGRect(x: (dist * 1) + area, y: area, width: self.frame.width / 8, height: self.frame.width / 8))
        cube1.lineWidth = 5
        cube1.strokeColor = UIColor.brown
        cube1.zPosition = 2
        cube1.fillColor = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 0)
        cube1.lineJoin = .miter
        
        lev2.text = "Level Two"
        lev2.fontColor = UIColor.blue
        lev2.fontSize = font
        lev2.zPosition = 3
        lev2.zRotation = 0.25
        lev2.position = CGPoint(x: dist * 2, y: font / -2)
        
        cube2 = SKShapeNode.init(rect: CGRect(x: (dist * 2) + area, y: area, width: self.frame.width / 8, height: self.frame.width / 8))
        cube2.lineWidth = 5
        cube2.strokeColor = UIColor.blue
        cube2.zPosition = 2
        cube2.fillColor = UIColor.clear
        cube2.lineJoin = .miter
        
        lev3.text = "Level Three"
        lev3.fontColor = UIColor.magenta
        lev3.fontSize = font
        lev3.zPosition = 3
        lev3.zRotation = -0.25
        lev3.position = CGPoint(x: dist * 3, y: font / -2)
        
        cube3 = SKShapeNode.init(rect: CGRect(x: (dist * 3) + area, y: area, width: self.frame.width / 8, height: self.frame.width / 8))
        cube3.lineWidth = 5
        cube3.strokeColor = UIColor.magenta
        cube3.zPosition = 2
        cube3.fillColor = UIColor.clear
        cube3.lineJoin = .miter
        
        lev4.text = "Level Four"
        lev4.fontColor = UIColor.cyan
        lev4.fontSize = font
        lev4.zPosition = 3
        lev4.zRotation = 0.25
        lev4.position = CGPoint(x: dist * 4, y: font / -2)
        
        cube4 = SKShapeNode.init(rect: CGRect(x: (dist * 4) + area, y: area, width: self.frame.width / 8, height: self.frame.width / 8))
        cube4.lineWidth = 5
        cube4.strokeColor = UIColor.cyan
        cube4.zPosition = 2
        cube4.fillColor = UIColor.clear
        cube4.lineJoin = .miter
        
        lev5.text = "Level Five"
        lev5.fontColor = UIColor.orange
        lev5.fontSize = font
        lev5.zPosition = 3
        lev5.zRotation = -0.25
        lev5.position = CGPoint(x: dist * 5, y: font / -2)
        
        cube5 = SKShapeNode.init(rect: CGRect(x: (dist * 5) + area, y: area, width: self.frame.width / 8, height: self.frame.width / 8))
        cube5.lineWidth = 5
        cube5.strokeColor = UIColor.orange
        cube5.zPosition = 2
        cube5.fillColor = UIColor.clear
        cube5.lineJoin = .miter
        
        lev6.text = "Level Six"
        lev6.fontColor = UIColor.green
        lev6.fontSize = font
        lev6.zPosition = 3
        lev6.zRotation = 0.25
        lev6.position = CGPoint(x: dist * 6, y: font / -2)
        
        cube6 = SKShapeNode.init(rect: CGRect(x: (dist * 6) + area, y: area, width: self.frame.width / 8, height: self.frame.width / 8))
        cube6.lineWidth = 5
        cube6.strokeColor = UIColor.green
        cube6.zPosition = 2
        cube6.fillColor = UIColor.clear
        cube6.lineJoin = .miter
        
        lev7.text = "Level Seven"
        lev7.fontColor = UIColor.purple
        lev7.fontSize = font
        lev7.zPosition = 3
        lev7.zRotation = -0.25
        lev7.position = CGPoint(x: dist * 7, y: font / -2)
        
        cube7 = SKShapeNode.init(rect: CGRect(x: (dist * 7) + area, y: area, width: self.frame.width / 8, height: self.frame.width / 8))
        cube7.lineWidth = 5
        cube7.strokeColor = UIColor.purple
        cube7.zPosition = 2
        cube7.fillColor = UIColor.clear
        cube7.lineJoin = .miter
        
        lev8.text = "Level Eight"
        lev8.fontColor = UIColor.red
        lev8.fontSize = font
        lev8.zPosition = 3
        lev8.zRotation = 0.25
        lev8.position = CGPoint(x: dist * 8, y: font / -2)
        
        cube8 = SKShapeNode.init(rect: CGRect(x: (dist * 8) + area, y: area, width: self.frame.width / 8, height: self.frame.width / 8))
        cube8.lineWidth = 5
        cube8.strokeColor = UIColor.red
        cube8.zPosition = 2
        cube8.fillColor = UIColor.clear
        cube8.lineJoin = .miter
        
        lev9.text = "Level Nine"
        lev9.fontColor = UIColor.white
        lev9.fontSize = font
        lev9.zPosition = 3
        lev9.zRotation = -0.25
        lev9.position = CGPoint(x: dist * 9, y: font / -2)
        
        cube9 = SKShapeNode.init(rect: CGRect(x: (dist * 9) + area, y: area, width: self.frame.width / 8, height: self.frame.width / 8))
        cube9.lineWidth = 5
        cube9.strokeColor = UIColor.white
        cube9.zPosition = 2
        cube9.fillColor = UIColor.clear
        cube9.lineJoin = .miter
        
        lev10.text = "Endless"
        lev10.fontColor = UIColor.white
        lev10.fontSize = font
        lev10.zPosition = 3
        lev10.zRotation = 0.25
        lev10.position = CGPoint(x: dist * 10, y: font / -2)
        
        cube10 = SKShapeNode.init(rect: CGRect(x: (dist * 10) + area, y: area, width: self.frame.width / 8, height: self.frame.width / 8))
        cube10.lineWidth = 5
        cube10.strokeColor = UIColor.white
        cube10.zPosition = 2
        cube10.fillColor = UIColor.clear
        cube10.lineJoin = .miter
        
        moneyCube.size = CGSize(width: self.frame.height / 16, height: self.frame.height / 16)
        moneyCube.position = CGPoint(x: self.frame.height / 12, y: self.frame.height / -3.8 - self.frame.height / 28)
        moneyCube.zPosition = 4
        
        amount.text = "\(defaults.integer(forKey: "money"))"
        amount.fontSize = font
        amount.fontColor = UIColor.green
        amount.position = CGPoint(x: self.frame.height / -16, y: self.frame.height / -3.8 - self.frame.height / 16)
        amount.zPosition = 4
        
        startSc1()
    }
    func startSc1(){
        self.removeAllChildren()
        self.scroll.removeAllChildren()
        sc2 = false
        sc1 = true
        color = SKSpriteNode(imageNamed: "Color10")
        color.size = CGSize(width: self.frame.width, height: self.frame.height)
        color.position = CGPoint(x: 0, y: 0)
        self.addChild(color)
        self.addChild(scroll)
        CubeFall.position = CGPoint(x: 0, y: 0)
        CubeFall.size = CGSize(width: self.frame.width, height: self.frame.height)
        CubeFall.zPosition = 1
        self.addChild(CubeFall)
        
        self.addChild(left)
        self.addChild(right)
        let action = SKAction.scale(by: 1.33, duration: 0.5)
        let action2 = SKAction.scale(by: 0.75, duration: 0.5)
        let wait = SKAction.wait(forDuration: 0.5)
        let sequence1 = SKAction.sequence([action, action2])
        let repeatAction = SKAction.repeat(sequence1, count: 10)
        let sequence2 = SKAction.sequence([wait, repeatAction])
        left.run(repeatAction)
        right.run(sequence2)
        
        self.scroll.addChild(shop)
        self.scroll.addChild(shopCube)
        self.scroll.addChild(tutorial)
        self.scroll.addChild(tutCube)
        lev1.text = "Endless"
        self.scroll.addChild(lev1)
        self.scroll.addChild(cube1)
        lev2.text = "Levels"
        self.scroll.addChild(lev2)
        self.scroll.addChild(cube2)
    }
    func startSc2(){
        self.removeAllChildren()
        self.scroll.removeAllChildren()
        sc1 = false
        sc2 = true
        color = SKSpriteNode(imageNamed: "Color2")
        color.size = CGSize(width: self.frame.width, height: self.frame.height)
        color.position = CGPoint(x: 0, y: 0)
        self.addChild(color)
        back.size = CGSize(width: self.frame.width / 4, height: self.frame.width / 5)
        back.position = CGPoint(x: self.frame.width / -2, y: self.frame.height / 1.9)
        self.addChild(back)
        scroll.position = CGPoint(x: 0, y: 0)
        self.addChild(scroll)
        lev = 1
        CubeFall.position = CGPoint(x: 0, y: 0)
        CubeFall.size = CGSize(width: self.frame.width, height: self.frame.height)
        CubeFall.zPosition = 1
        self.addChild(CubeFall)
        
        self.addChild(left)
        self.addChild(right)
        let action = SKAction.scale(by: 1.33, duration: 0.5)
        let action2 = SKAction.scale(by: 0.75, duration: 0.5)
        let wait = SKAction.wait(forDuration: 0.5)
        let sequence1 = SKAction.sequence([action, action2])
        let repeatAction = SKAction.repeat(sequence1, count: 10)
        let sequence2 = SKAction.sequence([wait, repeatAction])
        left.run(repeatAction)
        right.run(sequence2)
        
        lev1.text = "Level One"
        self.scroll.addChild(lev1)
        self.scroll.addChild(cube1)
        lev2.text = "Level Two"
        self.scroll.addChild(lev2)
        self.scroll.addChild(cube2)
        self.scroll.addChild(lev3)
        self.scroll.addChild(cube3)
        self.scroll.addChild(lev4)
        self.scroll.addChild(cube4)
        self.scroll.addChild(lev5)
        self.scroll.addChild(cube5)
        self.scroll.addChild(lev6)
        self.scroll.addChild(cube6)
        self.scroll.addChild(lev7)
        self.scroll.addChild(cube7)
        self.scroll.addChild(lev8)
        self.scroll.addChild(cube8)
        self.scroll.addChild(lev9)
        self.scroll.addChild(cube9)
        
        let move = SKAction.moveBy(x: self.frame.width / -2, y: 0, duration: 0.5)
        scroll.run(move)
        
    }
    func scroll(direction: Int) {
        if sc2 == true {
            if direction == 1  && lev != 9{
                let move = SKAction.moveBy(x: self.frame.width / -2, y: 0, duration: 0.5)
                scroll.run(move)
                lev += 1
            }
            else if direction == -1 && lev != 1{
                let move = SKAction.moveBy(x: self.frame.width / 2, y: 0, duration: 0.5)
                scroll.run(move)
                lev -= 1
            }
            else if lev == 1 && direction == -1 {
                let move = SKAction.moveBy(x: (self.frame.width / 2) * -8, y: 0, duration: 1)
                scroll.run(move)
                lev = 9
            }
            else if lev == 9 && direction == 1 {
                let move = SKAction.moveBy(x: (self.frame.width / 2) * 8, y: 0, duration: 1)
                scroll.run(move)
                lev = 1
            }
            color.removeFromParent()
            color = SKSpriteNode(imageNamed: "Color\(lev + 1)")
            color.size = CGSize(width: self.frame.width, height: self.frame.height)
            self.addChild(color)
            back.removeFromParent()
            self.addChild(back)
        } else if sc1 == true {
            if direction == 1  && lev != 2{
                let move = SKAction.moveBy(x: self.frame.width / -2, y: 0, duration: 0.5)
                scroll.run(move)
                lev += 1
            }
            else if direction == -1 && lev != -1{
                let move = SKAction.moveBy(x: self.frame.width / 2, y: 0, duration: 0.5)
                scroll.run(move)
                lev -= 1
            }
            else if lev == -1 && direction == -1 {
                let move = SKAction.moveBy(x: (self.frame.width / 2) * -3, y: 0, duration: 1)
                scroll.run(move)
                lev = 2
            }
            else if lev == 2 && direction == 1 {
                let move = SKAction.moveBy(x: (self.frame.width / 2) * 3, y: 0, duration: 1)
                scroll.run(move)
                lev = -1
            }
        }
        let remove = SKAction.hide()
        let wait = SKAction.wait(forDuration: 0.8)
        let block = SKAction.unhide()
        let combine = SKAction.sequence([remove, wait, block])
        self.left.run(combine)
        self.right.run(combine)
        
        let defaults = UserDefaults.standard
        if defaults.integer(forKey: "lev") == 0 {
            defaults.set(1, forKey: "lev")
        }
        let levOn = defaults.integer(forKey: "lev")
        if lev > levOn && sc2 == true {
            cover.removeFromParent()
            lock.removeFromParent()
            cover.color = UIColor.black
            cover.alpha = 0.7
            cover.size = CGSize(width: self.frame.width, height: self.frame.height)
            cover.zPosition = 10
            cover.position = CGPoint(x: 0, y: 0)
            self.addChild(cover)
            lock.size = CGSize(width: self.frame.width, height: self.frame.height)
            lock.position = CGPoint(x: 0, y: 0)
            lock.zPosition = 15
            self.addChild(lock)
        }
        else {
            cover.removeFromParent()
            lock.removeFromParent()
        }
        if defaults.integer(forKey: "money") != 0 {
            amount.removeFromParent()
            moneyCube.removeFromParent()
            self.addChild(amount)
            self.addChild(moneyCube)
            amount.run(combine)
            moneyCube.run(combine)
        }
    }
    func touchDown(atPoint pos : CGPoint) {
    }
    func touchesMoved(toPoint pos: CGPoint) {
    }
    func touchUp(atPoint pos : CGPoint) {
        let defaults = UserDefaults.standard
        let levOn = defaults.integer(forKey: "lev")
        if left.contains(pos){
            scroll(direction: -1)
        }
        else if right.contains(pos){
            scroll(direction: 1)
        }
        if (cube1.contains(pos) || tutCube.contains(pos) || cube2.contains(pos) || cube3.contains(pos) || cube4.contains(pos) || cube5.contains(pos) || cube6.contains(pos) || cube7.contains(pos) || cube8.contains(pos) || cube9.contains(pos) || cube10.contains(pos) || shopCube.contains(pos)) && (pos.x >= self.frame.width / -4 && pos.x <= self.frame.width / 4) {
            print("\(lev)")
            if lev == 2 && sc1 == true {
                startSc2()
                print("startSc2")
            }
            else if lev >= 1 && sc2 == true && levOn >= lev {
                variables.lev = lev
                variables.play = true
                audioPlayer.volume = 0
                audioPlayer.pause()
                audioPlayer.numberOfLoops = -1
            }
            else if sc1 == true && lev == -1 {
                variables.shop = true
                audioPlayer.volume = 0
                audioPlayer.pause()
                audioPlayer.numberOfLoops = -1
            }
            else if sc1 == true && lev == 0 {
                variables.lev = lev
                variables.play = true
                audioPlayer.volume = 0
                audioPlayer.pause()
                audioPlayer.numberOfLoops = -1
            }
            else if sc1 == true && lev == 1 {
                variables.lev = 10
                variables.play = true
                audioPlayer.volume = 0
                audioPlayer.pause()
                audioPlayer.numberOfLoops = -1
            }
        }
        if back.contains(pos) && sc2 == true {
            startSc1()
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchesMoved(toPoint: t.location(in: self)) }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
}
struct variables {
    static var lev : Int = 0
    static var play : Bool = false
    static var shop : Bool = false
    static var donePlaying: Bool = false
    static var doneShooping: Bool = false
}
