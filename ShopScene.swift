//
//  ShopScene.swift
//  Cube Fall
//
//  Created by Alexander Eckert on 11/28/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit
import StoreKit

class ShopScene: SKScene, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    let bg = SKSpriteNode(imageNamed: "Color0")
    let bg2 = SKSpriteNode(imageNamed: "Color0")
    let bg3 = SKSpriteNode(imageNamed: "Color0")
    let back = SKSpriteNode(imageNamed: "Back")
    let skulls = SKSpriteNode(imageNamed: "MoneyCube")
    let money = SKLabelNode(fontNamed: "American Typewriter")
    let cameraNode = SKCameraNode()
    var pnt1x = Int()
    var pnt1y = Int()
    var pnt2x = Int()
    var pnt2y = Int()
    var scroll : Bool = false
    
    var Sc1 : Bool = true
    var Sc2 : Bool = true
    var Sc3 : Bool = false
    
    let vending1 = SKSpriteNode(imageNamed: "VendingOne")
    let vending2 = SKSpriteNode(imageNamed: "VendingTwo")
    let vending3 = SKSpriteNode(imageNamed: "VendingThree")
    let wheel1 = SKSpriteNode(imageNamed: "WheelOne")
    let wheel2 = SKSpriteNode(imageNamed: "WheelTwo")
    let wheel3 = SKSpriteNode(imageNamed: "WheelThree")
    var spinAction = SKAction()
    var spun : Bool = false
    var spunDun : Bool = false
    var vendNote1 = SKLabelNode(fontNamed: "American Typewriter")
    var vendNote2 = SKLabelNode(fontNamed: "American Typewriter")
    var vendNote3 = SKLabelNode(fontNamed: "American Typewriter")
    
    var vend1 : Bool = false
    var vend2 : Bool = false
    var vend3 : Bool = false
    
    var characters = SKLabelNode(fontNamed: "American Typewriter")
    var playerScroll = SKSpriteNode()
    var player0 = SKSpriteNode(imageNamed: "Player0")
    var player1 = SKSpriteNode(imageNamed: "Player1")
    var player2 = SKSpriteNode(imageNamed: "Player2")
    var player3 = SKSpriteNode(imageNamed: "Player3")
    var player4 = SKSpriteNode(imageNamed: "Player4")
    var player5 = SKSpriteNode(imageNamed: "Player5")
    var player6 = SKSpriteNode(imageNamed: "Player6")
    var player7 = SKSpriteNode(imageNamed: "Player7")
    var player8 = SKSpriteNode(imageNamed: "Player8")
    var player9 = SKSpriteNode(imageNamed: "Player9")
    var player10 = SKSpriteNode(imageNamed: "Player10")
    var player11 = SKSpriteNode(imageNamed: "Player11")
    var player12 = SKSpriteNode(imageNamed: "Player12")
    var player13 = SKSpriteNode(imageNamed: "Player13")
    var player14 = SKSpriteNode(imageNamed: "Player14")
    var player15 = SKSpriteNode(imageNamed: "Player15")
    var player16 = SKSpriteNode(imageNamed: "Player16")
    var player17 = SKSpriteNode(imageNamed: "Player17")
    var player18 = SKSpriteNode(imageNamed: "Player18")
    var player19 = SKSpriteNode(imageNamed: "Player19")
    var player20 = SKSpriteNode(imageNamed: "Player20")
    var player21 = SKSpriteNode(imageNamed: "Player21")
    var player22 = SKSpriteNode(imageNamed: "Player22")
    var player23 = SKSpriteNode(imageNamed: "Player23")
    var player0Note = SKLabelNode(fontNamed: "American Typewriter")
    var player1Note = SKLabelNode(fontNamed: "American Typewriter")
    var player2Note = SKLabelNode(fontNamed: "American Typewriter")
    var player3Note = SKLabelNode(fontNamed: "American Typewriter")
    var player4Note = SKLabelNode(fontNamed: "American Typewriter")
    var player5Note = SKLabelNode(fontNamed: "American Typewriter")
    var player6Note = SKLabelNode(fontNamed: "American Typewriter")
    var player7Note = SKLabelNode(fontNamed: "American Typewriter")
    var player8Note = SKLabelNode(fontNamed: "American Typewriter")
    var player9Note = SKLabelNode(fontNamed: "American Typewriter")
    var player10Note = SKLabelNode(fontNamed: "American Typewriter")
    var player11Note = SKLabelNode(fontNamed: "American Typewriter")
    var player12Note = SKLabelNode(fontNamed: "American Typewriter")
    var player13Note = SKLabelNode(fontNamed: "American Typewriter")
    var player14Note = SKLabelNode(fontNamed: "American Typewriter")
    var player15Note = SKLabelNode(fontNamed: "American Typewriter")
    var player16Note = SKLabelNode(fontNamed: "American Typewriter")
    var player17Note = SKLabelNode(fontNamed: "American Typewriter")
    var player18Note = SKLabelNode(fontNamed: "American Typewriter")
    var player19Note = SKLabelNode(fontNamed: "American Typewriter")
    var player20Note = SKLabelNode(fontNamed: "American Typewriter")
    var player21Note = SKLabelNode(fontNamed: "American Typewriter")
    var player22Note = SKLabelNode(fontNamed: "American Typewriter")
    var player23Note = SKLabelNode(fontNamed: "American Typewriter")
    
    var distance = Int()
    var distance2 = Int()
    
    var boostables = SKLabelNode(fontNamed: "American Typewriter")
    var itemScroll = SKSpriteNode()
    var lvlSkip = SKSpriteNode(imageNamed: "LvlSkip")
    var extraLife = SKSpriteNode(imageNamed: "ExtraLife")
    var slowMo = SKSpriteNode(imageNamed: "SlowMo")
    var shrink = SKSpriteNode(imageNamed: "Shrink")
    var superSpeed = SKSpriteNode(imageNamed: "SuperSpeed")
    var fullMove = SKSpriteNode(imageNamed: "FullMove")
    var itemNote1 = SKLabelNode(fontNamed: "American Typewriter")
    var itemNote2 = SKLabelNode(fontNamed: "American Typewriter")
    var itemNote3 = SKLabelNode(fontNamed: "American Typewriter")
    var itemNote4 = SKLabelNode(fontNamed: "American Typewriter")
    var itemNote5 = SKLabelNode(fontNamed: "American Typewriter")
    var itemNote6 = SKLabelNode(fontNamed: "American Typewriter")
    
    var buySkulls = SKLabelNode(fontNamed: "American Typewriter")
    var leastSkulls = SKSpriteNode(imageNamed: "LeastSkulls")
    var someSkulls = SKSpriteNode(imageNamed: "SomeSkulls")
    var mostSkulls = SKSpriteNode(imageNamed: "MostSkulls")
    var leastNote = SKLabelNode(fontNamed: "American Typewriter")
    var someNote = SKLabelNode(fontNamed: "American Typewriter")
    var mostNote = SKLabelNode(fontNamed: "American Typewriter")
    
    var powerNote : UITextView = UITextView(frame: CGRect())
    var abilityNote : UITextView = UITextView(frame: CGRect())
    
    var list = [SKProduct]()
    var p = SKProduct()
    var IAPEnabled : Bool = true
    
    var purchaseConfirm = SKSpriteNode(imageNamed: "PurchaseConfirm")
    var purchaseDecline = SKSpriteNode(imageNamed: "PurchaseDecline")
    var purchaseInfo = UITextView()
    var item : Int = 0
    var buying: Bool = false
    
    override func didMove(to view: SKView) {
        bg.size = CGSize(width: self.frame.width, height: self.frame.height)
        self.addChild(bg)
        bg2.size = CGSize(width: self.frame.width, height: self.frame.height)
        bg2.yScale = -1
        bg2.position = CGPoint(x: 0, y: -self.frame.height)
        self.addChild(bg2)
        bg3.size = CGSize(width: self.frame.width, height: self.frame.height)
        bg3.position = CGPoint(x: 0, y: -self.frame.height * 2)
        self.addChild(bg3)
        back.size = CGSize(width: self.frame.width / 4, height: self.frame.width / 5)
        back.position = CGPoint(x: self.frame.width / -2, y: self.frame.height / 1.9)
        self.addChild(back)
        skulls.position = CGPoint(x: (self.frame.width / 2) - (self.frame.height * 0.05), y: (self.frame.height / 2) - (self.frame.height * 0.05))
        skulls.size = CGSize(width: self.frame.height * 0.1, height: self.frame.height * 0.1)
        self.addChild(skulls)
        let defaults = UserDefaults.standard
        money.text = "\(defaults.integer(forKey: "money"))"
        money.fontColor = UIColor.green
        money.fontSize = CGFloat(self.frame.height * 0.1)
        money.position = CGPoint(x: (self.frame.width / 2.5) - (self.frame.height * 0.05), y: (self.frame.height / 2) - (self.frame.height * 0.07))
        self.addChild(money)
        self.addChild(playerScroll)
        cameraNode.position = CGPoint(x: 0, y: 0)
        self.addChild(cameraNode)
        self.camera = cameraNode
        
        if SKPaymentQueue.canMakePayments() {
            print("IAP is enabled, loading...")
            let productID: NSSet = NSSet(objects: "StackOfSkulls", "PileOfSkulls", "OodlesOfSkulls")
            let request: SKProductsRequest = SKProductsRequest(productIdentifiers: productID as! Set<String>)
            request.delegate = self
            request.start()
        }
        else {
            print("please enable IAPs")
            IAPEnabled = false
        }
        
        vending1.size = CGSize(width: self.frame.width / 3, height: self.frame.height / 2)
        vending1.position = CGPoint(x: self.frame.width / -4, y: self.frame.height / 5)
        self.addChild(vending1)
        
        vending2.position = CGPoint(x: 0, y: self.frame.height / 5)
        vending2.size = CGSize(width: self.frame.width / 3, height: self.frame.height / 2)
        self.addChild(vending2)
        
        vending3.position = CGPoint(x: self.frame.width / 4, y: self.frame.height / 5)
        vending3.size = CGSize(width: self.frame.width / 3, height: self.frame.height / 2)
        self.addChild(vending3)
        
        wheel1.size = CGSize(width: self.frame.width / 8.5, height: self.frame.width / 8.5)
        wheel1.position = vending1.position
        self.addChild(wheel1)
        
        wheel2.size = CGSize(width: self.frame.width / 8.5, height: self.frame.width / 8.5)
        wheel2.position = vending2.position
        self.addChild(wheel2)
        
        wheel3.size = CGSize(width: self.frame.width / 8.5, height: self.frame.width / 8.5)
        wheel3.position = vending3.position
        self.addChild(wheel3)
        
        vendNote1.text = "100"
        vendNote1.fontSize = CGFloat(self.frame.height / 15)
        vendNote1.fontColor = UIColor.blue
        vendNote1.position = CGPoint(x: vending1.position.x, y: vending1.position.y - (vending1.size.height * 0.65))
        self.addChild(vendNote1)
        
        vendNote2.text = "250"
        vendNote2.fontSize = CGFloat(self.frame.height / 15)
        vendNote2.fontColor = UIColor.blue
        vendNote2.position = CGPoint(x: vending2.position.x, y: vending2.position.y - (vending2.size.height * 0.65))
        self.addChild(vendNote2)
        
        vendNote3.text = "400"
        vendNote3.fontSize = CGFloat(self.frame.height / 15)
        vendNote3.fontColor = UIColor.blue
        vendNote3.position = CGPoint(x: vending3.position.x, y: vending3.position.y - (vending3.size.height * 0.65))
        self.addChild(vendNote3)
        
        addPlayers()
        addBoostables()
        addSkulls()
        
        /*
        defaults.set(nil, forKey: "player0")
        defaults.set(nil, forKey: "player1")
        defaults.set(nil, forKey: "player2")
        defaults.set(nil, forKey: "player3")
        defaults.set(nil, forKey: "player4")
        defaults.set(nil, forKey: "player5")
        defaults.set(nil, forKey: "player6")
        defaults.set(nil, forKey: "player7")
        defaults.set(nil, forKey: "player8")
        defaults.set(nil, forKey: "player9")
        defaults.set(nil, forKey: "player10")
        defaults.set(nil, forKey: "player11")
        defaults.set(nil, forKey: "player12")
        defaults.set(nil, forKey: "player13")
        defaults.set(nil, forKey: "player14")
        defaults.set(nil, forKey: "player15")
        defaults.set(nil, forKey: "player16")
        defaults.set(nil, forKey: "player17")
        defaults.set(nil, forKey: "player18")
        defaults.set(nil, forKey: "player19")
        defaults.set(nil, forKey: "player20")
        defaults.set(nil, forKey: "player21")
        defaults.set(nil, forKey: "player22")
        defaults.set(nil, forKey: "player23")
        */
        
        powerNote = UITextView(frame: CGRect(x: 0, y: 0, width: self.frame.width / 3, height: self.frame.height / 4))
        powerNote.text = "Powers: \n"
        powerNote.font = UIFont(name: "American Typewriter", size: self.frame.height / 25)
        powerNote.textColor = UIColor.white
        powerNote.layer.borderWidth = 5
        powerNote.layer.cornerRadius = 2.5
        powerNote.backgroundColor = UIColor(red: 81/360, green: 81/360, blue: 81/360, alpha: 0.7)
        powerNote.layer.borderColor = UIColor(red: 28/360, green: 28/360, blue: 28/360, alpha: 0.7).cgColor
        powerNote.isSelectable = false
        powerNote.isEditable = false
        powerNote.isUserInteractionEnabled = false
        powerNote.isScrollEnabled = false
        
        abilityNote = UITextView(frame: CGRect(x: self.frame.width * (2/3), y: 0, width: self.frame.width / 3, height: self.frame.height / 4))
        abilityNote.text = "Abilities: \n"
        abilityNote.font = UIFont(name: "American Typewriter", size: self.frame.height / 25)
        abilityNote.textColor = UIColor.white
        abilityNote.layer.borderWidth = 5
        abilityNote.layer.cornerRadius = 2.5
        abilityNote.backgroundColor = UIColor(red: 81/360, green: 81/360, blue: 81/360, alpha: 0.7)
        abilityNote.layer.borderColor = UIColor(red: 28/360, green: 28/360, blue: 28/360, alpha: 0.7).cgColor
        abilityNote.isSelectable = false
        abilityNote.isEditable = false
        abilityNote.isUserInteractionEnabled = false
        abilityNote.isScrollEnabled = false
    }
    func loadSc1() {
        Sc2 = false
        Sc1 = true
        Sc3 = false
        vend1 = false
        vend2 = false
        vend3 = false
        
        self.removeAllChildren()
        self.addChild(bg)
        self.addChild(bg2)
        self.addChild(bg3)
        self.addChild(back)
        self.addChild(cameraNode)
        skulls.position = CGPoint(x: (self.frame.width / 2) - (self.frame.height * 0.05), y: (self.frame.height / 2) - (self.frame.height * 0.05))
        skulls.size = CGSize(width: self.frame.height * 0.1, height: self.frame.height * 0.1)
        self.addChild(skulls)
        let defaults = UserDefaults.standard
        money.text = "\(defaults.integer(forKey: "money"))"
        money.fontColor = UIColor.green
        money.fontSize = CGFloat(self.frame.height * 0.1)
        money.position = CGPoint(x: (self.frame.width / 2.5) - (self.frame.height * 0.05), y: (self.frame.height / 2) - (self.frame.height * 0.07))
        self.addChild(money)
        
        vending1.size = CGSize(width: self.frame.width / 3, height: self.frame.height / 2)
        vending1.position = CGPoint(x: self.frame.width / -4, y: self.frame.height / 5)
        self.addChild(vending1)
        
        vending2.position = CGPoint(x: 0, y: self.frame.height / 5)
        vending2.size = CGSize(width: self.frame.width / 3, height: self.frame.height / 2)
        self.addChild(vending2)
        
        vending3.position = CGPoint(x: self.frame.width / 4, y: self.frame.height / 5)
        vending3.size = CGSize(width: self.frame.width / 3, height: self.frame.height / 2)
        self.addChild(vending3)
        
        wheel1.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        wheel1.position = vending1.position
        self.addChild(wheel1)
        
        wheel2.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        wheel2.position = vending2.position
        self.addChild(wheel2)
        
        wheel3.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        wheel3.position = vending3.position
        self.addChild(wheel3)
        
        self.addChild(vendNote1)
        self.addChild(vendNote2)
        self.addChild(vendNote3)
        
        addPlayers()
        addBoostables()
        addSkulls()
    }
    func loadSc2(vend: Int) {
        Sc1 = false
        Sc2 = true
        Sc3 = false
        
        self.removeAllChildren()
        self.addChild(bg)
        self.addChild(bg2)
        self.addChild(back)
        self.addChild(cameraNode)
        cameraNode.position = CGPoint(x: 0, y: 0)
        cameraNode.removeFromParent()
        
        if vend1 == true {
            vending1.size = CGSize(width: self.frame.width, height: self.frame.height)
            vending1.position = CGPoint(x: 0, y: 0)
            self.addChild(vending1)
            
            wheel1.size = CGSize(width: self.frame.height / 2, height: self.frame.height / 2)
            wheel1.position = CGPoint(x: 0, y: 0)
            self.addChild(wheel1)
            
            skulls.position = CGPoint(x: self.frame.width / -3, y: self.frame.height / -8)
            skulls.size = CGSize(width: self.frame.height / 10, height: self.frame.height / 10)
            self.addChild(skulls)
            
            money.position = CGPoint(x: self.frame.width / -3, y: 0)
            money.fontSize = CGFloat(self.frame.height / 5)
            self.addChild(money)
        }
        else if vend2 == true {
            vending2.size = CGSize(width: self.frame.width, height: self.frame.height)
            vending2.position = CGPoint(x: 0, y: 0)
            self.addChild(vending2)
            
            wheel2.size = CGSize(width: self.frame.height / 2, height: self.frame.height / 2)
            wheel2.position = CGPoint(x: 0, y: 0)
            self.addChild(wheel2)
            
            skulls.position = CGPoint(x: self.frame.width / -3, y: self.frame.height / -8)
            skulls.size = CGSize(width: self.frame.height / 10, height: self.frame.height / 10)
            self.addChild(skulls)
            
            money.position = CGPoint(x: self.frame.width / -3, y: 0)
            money.fontSize = CGFloat(self.frame.height / 5)
            self.addChild(money)
        }
        else if vend3 == true {
            vending3.size = CGSize(width: self.frame.width, height: self.frame.height)
            vending3.position = CGPoint(x: 0, y: 0)
            self.addChild(vending3)
            
            wheel3.size = CGSize(width: self.frame.height / 2, height: self.frame.height / 2)
            wheel3.position = CGPoint(x: 0, y: 0)
            self.addChild(wheel3)
            
            skulls.position = CGPoint(x: self.frame.width / -3, y: self.frame.height / -8)
            skulls.size = CGSize(width: self.frame.height / 10, height: self.frame.height / 10)
            self.addChild(skulls)
            
            money.position = CGPoint(x: self.frame.width / -3, y: 0)
            money.fontSize = CGFloat(self.frame.height / 5)
            self.addChild(money)
        }
    }
    func addPlayers() {
        playerScroll.removeAllActions()
        playerScroll.removeFromParent()
        playerScroll.size = CGSize(width: 0, height: 0)
        self.addChild(playerScroll)
        characters.removeFromParent()
        player0.removeFromParent()
        player1.removeFromParent()
        player2.removeFromParent()
        player3.removeFromParent()
        player4.removeFromParent()
        player5.removeFromParent()
        player6.removeFromParent()
        player7.removeFromParent()
        player8.removeFromParent()
        player9.removeFromParent()
        player10.removeFromParent()
        player11.removeFromParent()
        player12.removeFromParent()
        player13.removeFromParent()
        player14.removeFromParent()
        player15.removeFromParent()
        player16.removeFromParent()
        player17.removeFromParent()
        player18.removeFromParent()
        player19.removeFromParent()
        player20.removeFromParent()
        player21.removeFromParent()
        player22.removeFromParent()
        player23.removeFromParent()
        player0Note.removeFromParent()
        player1Note.removeFromParent()
        player2Note.removeFromParent()
        player3Note.removeFromParent()
        player4Note.removeFromParent()
        player5Note.removeFromParent()
        player6Note.removeFromParent()
        player7Note.removeFromParent()
        player8Note.removeFromParent()
        player9Note.removeFromParent()
        player10Note.removeFromParent()
        player11Note.removeFromParent()
        player12Note.removeFromParent()
        player13Note.removeFromParent()
        player14Note.removeFromParent()
        player15Note.removeFromParent()
        player16Note.removeFromParent()
        player17Note.removeFromParent()
        player18Note.removeFromParent()
        player19Note.removeFromParent()
        player20Note.removeFromParent()
        player21Note.removeFromParent()
        player22Note.removeFromParent()
        player23Note.removeFromParent()
        
        characters.text = "Characters:"
        characters.position = CGPoint(x: self.frame.width / -4, y: self.frame.height / -7 - self.frame.height * 0.1)
        characters.fontColor = UIColor.blue
        characters.fontSize = CGFloat(self.frame.height / 10)
        self.addChild(characters)
        
        player0.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player0.position = CGPoint(x: self.frame.width * -0.4, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player0)
        
        player1.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player1.position = CGPoint(x: self.frame.width * -0.2, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player1)
        
        player2.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player2.position = CGPoint(x: 0, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player2)
        
        player3.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player3.position = CGPoint(x: self.frame.width * 0.2, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player3)
        
        player4.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player4.position = CGPoint(x: self.frame.width * 0.4, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player4)
        
        player5.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player5.position = CGPoint(x: self.frame.width * 0.6, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player5)
        
        player6.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player6.position = CGPoint(x: self.frame.width * 0.8, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player6)
        
        player7.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player7.position = CGPoint(x: self.frame.width, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player7)
        
        player8.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player8.position = CGPoint(x: self.frame.width * 1.2, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player8)
        
        player9.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player9.position = CGPoint(x: self.frame.width * 1.4, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player9)
        
        player10.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player10.position = CGPoint(x: self.frame.width * 1.6, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player10)
        
        player11.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player11.position = CGPoint(x: self.frame.width * 1.8, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player11)
        
        player12.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player12.position = CGPoint(x: self.frame.width * 2, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player12)
        
        player13.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player13.position = CGPoint(x: self.frame.width * 2.2, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player13)
        
        player14.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player14.position = CGPoint(x: self.frame.width * 2.4, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player14)
        
        player15.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player15.position = CGPoint(x: self.frame.width * 2.6, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player15)
        
        player16.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player16.position = CGPoint(x: self.frame.width * 2.8, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player16)
        
        player17.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player17.position = CGPoint(x: self.frame.width * 3, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player17)
        
        player18.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player18.position = CGPoint(x: self.frame.width * 3.2, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player18)
        
        player19.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player19.position = CGPoint(x: self.frame.width * 3.4, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player19)
        
        player20.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player20.position = CGPoint(x: self.frame.width * 3.6, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player20)
        
        player21.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player21.position = CGPoint(x: self.frame.width * 3.8, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player21)
        
        player22.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player22.position = CGPoint(x: self.frame.width * 4, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player22)
        
        player23.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        player23.position = CGPoint(x: self.frame.width * 4.2, y: self.frame.height / -3 - self.frame.height * 0.1)
        self.playerScroll.addChild(player23)
        
        let defaults = UserDefaults.standard
        
        let p0str = defaults.string(forKey: "player0")
        if p0str == nil || p0str == "activated"{
            defaults.set("activated", forKey: "player0")
            player0Note.text = "Activated"
            player0Note.fontColor = UIColor.green
        }else if p0str == "owned" {
            player0Note.text = ""
        }
        player0Note.fontSize = CGFloat(self.frame.height / 15)
        player0Note.position = CGPoint(x: 0, y: -(player0.size.height * 0.75))
        self.player0.addChild(player0Note)
        
        let p1str = defaults.string(forKey: "player1")
        if p1str == nil {
            player1Note.text = "150"
            player1Note.fontColor = UIColor.blue
        } else if p1str == "activated" {
            player1Note.text = "Activated"
            player1Note.fontColor = UIColor.green
        } else if p1str == "owned" {
            player1Note.text = ""
        }
        player1Note.fontSize = CGFloat(self.frame.height / 15)
        player1Note.position = CGPoint(x: 0, y: -(player1.size.height * 0.75))
        self.player1.addChild(player1Note)
        
        let p2str = defaults.string(forKey: "player2")
        if p2str == nil {
            player2Note.text = "150"
            player2Note.fontColor = UIColor.blue
        } else if p2str == "activated" {
            player2Note.text = "Activated"
            player2Note.fontColor = UIColor.green
        } else if p2str == "owned" {
            player2Note.text = ""
        }
        player2Note.fontSize = CGFloat(self.frame.height / 15)
        player2Note.position = CGPoint(x: 0, y: -(player2.size.height * 0.75))
        self.player2.addChild(player2Note)
        
        let p3str = defaults.string(forKey: "player3")
        if p3str == nil {
            player3Note.text = "150"
            player3Note.fontColor = UIColor.blue
        } else if p3str == "activated" {
            player3Note.text = "Activated"
            player3Note.fontColor = UIColor.green
        } else if p3str == "owned" {
            player3Note.text = ""
        }
        player3Note.fontSize = CGFloat(self.frame.height / 15)
        player3Note.position = CGPoint(x: 0, y: -(player3.size.height * 0.75))
        self.player3.addChild(player3Note)
        
        let p4str = defaults.string(forKey: "player4")
        if p4str == nil {
            player4Note.text = "150"
            player4Note.fontColor = UIColor.blue
        } else if p4str == "activated" {
            player4Note.text = "Activated"
            player4Note.fontColor = UIColor.green
        } else if p4str == "owned" {
            player4Note.text = ""
        }
        player4Note.fontSize = CGFloat(self.frame.height / 15)
        player4Note.position = CGPoint(x: 0, y: -(player4.size.height * 0.75))
        self.player4.addChild(player4Note)
        
        let p5str = defaults.string(forKey: "player5")
        if p5str == nil {
            player5Note.text = "150"
            player5Note.fontColor = UIColor.blue
        } else if p5str == "activated" {
            player5Note.text = "Activated"
            player5Note.fontColor = UIColor.green
        } else if p5str == "owned" {
            player5Note.text = ""
        }
        player5Note.fontSize = CGFloat(self.frame.height / 15)
        player5Note.position = CGPoint(x: 0, y: -(player5.size.height * 0.75))
        self.player5.addChild(player5Note)
        
        let p6str = defaults.string(forKey: "player6")
        if p6str == nil {
            player6Note.text = "150"
            player6Note.fontColor = UIColor.blue
        } else if p6str == "activated" {
            player6Note.text = "Activated"
            player6Note.fontColor = UIColor.green
        } else if p6str == "owned" {
            player6Note.text = ""
        }
        player6Note.fontSize = CGFloat(self.frame.height / 15)
        player6Note.position = CGPoint(x: 0, y: -(player6.size.height * 0.75))
        self.player6.addChild(player6Note)
        
        let p7str = defaults.string(forKey: "player7")
        if p7str == nil {
            player7Note.text = "150"
            player7Note.fontColor = UIColor.blue
        } else if p7str == "activated" {
            player7Note.text = "Activated"
            player7Note.fontColor = UIColor.green
        } else if p7str == "owned" {
            player7Note.text = ""
        }
        player7Note.fontSize = CGFloat(self.frame.height / 15)
        player7Note.position = CGPoint(x: 0, y: -(player7.size.height * 0.75))
        self.player7.addChild(player7Note)
        
        let p8str = defaults.string(forKey: "player8")
        if p8str == nil {
            player8Note.text = "300"
            player8Note.fontColor = UIColor.blue
        } else if p8str == "activated" {
            player8Note.text = "Activated"
            player8Note.fontColor = UIColor.green
        } else if p8str == "owned" {
            player8Note.text = ""
        }
        player8Note.fontSize = CGFloat(self.frame.height / 15)
        player8Note.position = CGPoint(x: 0, y: -(player8.size.height * 0.75))
        self.player8.addChild(player8Note)
        
        let p9str = defaults.string(forKey: "player9")
        if p9str == nil {
            player9Note.text = "300"
            player9Note.fontColor = UIColor.blue
        } else if p9str == "activated" {
            player9Note.text = "Activated"
            player9Note.fontColor = UIColor.green
        } else if p9str == "owned" {
            player9Note.text = ""
        }
        player9Note.fontSize = CGFloat(self.frame.height / 15)
        player9Note.position = CGPoint(x: 0, y: -(player9.size.height * 0.75))
        self.player9.addChild(player9Note)
        
        let p10str = defaults.string(forKey: "player10")
        if p10str == nil {
            player10Note.text = "300"
            player10Note.fontColor = UIColor.blue
        } else if p10str == "activated" {
            player10Note.text = "Activated"
            player10Note.fontColor = UIColor.green
        } else if p10str == "owned" {
            player10Note.text = ""
        }
        player10Note.fontSize = CGFloat(self.frame.height / 15)
        player10Note.position = CGPoint(x: 0, y: -(player10.size.height * 0.75))
        self.player10.addChild(player10Note)
        
        let p11str = defaults.string(forKey: "player11")
        if p11str == nil {
            player11Note.text = "300"
            player11Note.fontColor = UIColor.blue
        } else if p11str == "activated" {
            player11Note.text = "Activated"
            player11Note.fontColor = UIColor.green
        } else if p11str == "owned" {
            player11Note.text = ""
        }
        player11Note.fontSize = CGFloat(self.frame.height / 15)
        player11Note.position = CGPoint(x: 0, y: -(player11.size.height * 0.75))
        self.player11.addChild(player11Note)
        
        let p12str = defaults.string(forKey: "player12")
        if p12str == nil {
            player12Note.text = "300"
            player12Note.fontColor = UIColor.blue
        } else if p12str == "activated" {
            player12Note.text = "Activated"
            player12Note.fontColor = UIColor.green
        } else if p12str == "owned" {
            player12Note.text = ""
        }
        player12Note.fontSize = CGFloat(self.frame.height / 15)
        player12Note.position = CGPoint(x: 0, y: -(player12.size.height * 0.75))
        self.player12.addChild(player12Note)
        
        let p13str = defaults.string(forKey: "player13")
        if p13str == nil {
            player13Note.text = "300"
            player13Note.fontColor = UIColor.blue
        } else if p13str == "activated" {
            player13Note.text = "Activated"
            player13Note.fontColor = UIColor.green
        } else if p13str == "owned" {
            player13Note.text = ""
        }
        player13Note.fontSize = CGFloat(self.frame.height / 15)
        player13Note.position = CGPoint(x: 0, y: -(player13.size.height * 0.75))
        self.player13.addChild(player13Note)
        
        let p14str = defaults.string(forKey: "player14")
        if p14str == nil {
            player14Note.text = "300"
            player14Note.fontColor = UIColor.blue
        } else if p14str == "activated" {
            player14Note.text = "Activated"
            player14Note.fontColor = UIColor.green
        } else if p14str == "owned" {
            player14Note.text = ""
        }
        player14Note.fontSize = CGFloat(self.frame.height / 15)
        player14Note.position = CGPoint(x: 0, y: -(player14.size.height * 0.75))
        self.player14.addChild(player14Note)
        
        let p15str = defaults.string(forKey: "player15")
        if p15str == nil {
            player15Note.text = "300"
            player15Note.fontColor = UIColor.blue
        } else if p15str == "activated" {
            player15Note.text = "Activated"
            player15Note.fontColor = UIColor.green
        } else if p15str == "owned" {
            player15Note.text = ""
        }
        player15Note.fontSize = CGFloat(self.frame.height / 15)
        player15Note.position = CGPoint(x: 0, y: -(player15.size.height * 0.75))
        self.player15.addChild(player15Note)
        
        let p16str = defaults.string(forKey: "player16")
        if p16str == nil {
            player16Note.text = "500"
            player16Note.fontColor = UIColor.blue
        } else if p16str == "activated" {
            player16Note.text = "Activated"
            player16Note.fontColor = UIColor.green
        } else if p16str == "owned" {
            player16Note.text = ""
        }
        player16Note.fontSize = CGFloat(self.frame.height / 15)
        player16Note.position = CGPoint(x: 0, y: -(player16.size.height * 0.75))
        self.player16.addChild(player16Note)
        
        let p17str = defaults.string(forKey: "player17")
        if p17str == nil {
            player17Note.text = "500"
            player17Note.fontColor = UIColor.blue
        } else if p17str == "activated" {
            player17Note.text = "Activated"
            player17Note.fontColor = UIColor.green
        } else if p17str == "owned" {
            player17Note.text = ""
        }
        player17Note.fontSize = CGFloat(self.frame.height / 15)
        player17Note.position = CGPoint(x: 0, y: -(player17.size.height * 0.75))
        self.player17.addChild(player17Note)
        
        let p18str = defaults.string(forKey: "player18")
        if p18str == nil {
            player18Note.text = "500"
            player18Note.fontColor = UIColor.blue
        } else if p18str == "activated" {
            player18Note.text = "Activated"
            player18Note.fontColor = UIColor.green
        } else if p18str == "owned" {
            player18Note.text = ""
        }
        player18Note.fontSize = CGFloat(self.frame.height / 15)
        player18Note.position = CGPoint(x: 0, y: -(player18.size.height * 0.75))
        self.player18.addChild(player18Note)
        
        let p19str = defaults.string(forKey: "player19")
        if p19str == nil {
            player19Note.text = "500"
            player19Note.fontColor = UIColor.blue
        } else if p19str == "activated" {
            player19Note.text = "Activated"
            player19Note.fontColor = UIColor.green
        } else if p19str == "owned" {
            player19Note.text = ""
        }
        player19Note.fontSize = CGFloat(self.frame.height / 15)
        player19Note.position = CGPoint(x: 0, y: -(player19.size.height * 0.75))
        self.player19.addChild(player19Note)
        
        let p20str = defaults.string(forKey: "player20")
        if p20str == nil {
            player20Note.text = "500"
            player20Note.fontColor = UIColor.blue
        } else if p20str == "activated" {
            player20Note.text = "Activated"
            player20Note.fontColor = UIColor.green
        } else if p20str == "owned" {
            player20Note.text = ""
        }
        player20Note.fontSize = CGFloat(self.frame.height / 15)
        player20Note.position = CGPoint(x: 0, y: -(player20.size.height * 0.75))
        self.player20.addChild(player20Note)
        
        let p21str = defaults.string(forKey: "player21")
        if p21str == nil {
            player21Note.text = "500"
            player21Note.fontColor = UIColor.blue
        } else if p21str == "activated" {
            player21Note.text = "Activated"
            player21Note.fontColor = UIColor.green
        } else if p21str == "owned" {
            player21Note.text = ""
        }
        player21Note.fontSize = CGFloat(self.frame.height / 15)
        player21Note.position = CGPoint(x: 0, y: -(player21.size.height * 0.75))
        self.player21.addChild(player21Note)
        
        let p22str = defaults.string(forKey: "player22")
        if p22str == nil {
            player22Note.text = "500"
            player22Note.fontColor = UIColor.blue
        } else if p22str == "activated" {
            player22Note.text = "Activated"
            player22Note.fontColor = UIColor.green
        } else if p22str == "owned" {
            player22Note.text = ""
        }
        player22Note.fontSize = CGFloat(self.frame.height / 15)
        player22Note.position = CGPoint(x: 0, y: -(player22.size.height * 0.75))
        self.player22.addChild(player22Note)
        
        let p23str = defaults.string(forKey: "player23")
        if p23str == nil {
            player23Note.text = "500"
            player23Note.fontColor = UIColor.blue
        } else if p23str == "activated" {
            player23Note.text = "Activated"
            player23Note.fontColor = UIColor.green
        } else if p23str == "owned" {
            player23Note.text = ""
        }
        player23Note.fontSize = CGFloat(self.frame.height / 15)
        player23Note.position = CGPoint(x: 0, y: -(player23.size.height * 0.75))
        self.player23.addChild(player23Note)
    }
    func loadSc3(prod: Int, id: String){
        Sc1 = false
        Sc2 = false
        Sc3 = true
        cameraNode.position = CGPoint(x: 0, y: 0)
        item = prod
        
        purchaseInfo = UITextView(frame: CGRect(x: 0, y: self.frame.height / 6 , width: self.frame.width - 20, height: self.frame.height / 3))
        purchaseInfo.font = UIFont(name: "American Typewriter", size: self.frame.height / 20)
        purchaseInfo.textColor = UIColor.white
        purchaseInfo.text = "Leedle Leedle Leedle Leedle Leedle Leedle Leedle Leedle Leedle Leedle Leedle Leedle Leedle \n leedle \n leedle \n leedle \n leedle \n leedle \n leedle \n leedle"
        purchaseInfo.textAlignment = .center
        purchaseInfo.isSelectable = false
        purchaseInfo.isEditable = false
        purchaseInfo.isScrollEnabled = false
        purchaseInfo.backgroundColor = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 0)
        
        purchaseConfirm.size = CGSize(width: self.frame.width / 2, height: self.frame.height * 2)
        purchaseConfirm.position = CGPoint(x: self.frame.width / -4, y: self.frame.height * -1.5)
        self.addChild(purchaseConfirm)
        
        purchaseDecline.size = CGSize(width: self.frame.width / 2, height: self.frame.height * 2)
        purchaseDecline.position = CGPoint(x: self.frame.width / 4, y: self.frame.height * 1.5)
        self.addChild(purchaseDecline)
        
        let action1 = SKAction.moveTo(y: self.frame.height / 2, duration: 1)
        let action2 = SKAction.moveTo(y: self.frame.height / -2, duration: 1)
        
        purchaseConfirm.run(action1)
        purchaseDecline.run(action2)
        
        if prod >= 0 && prod <= 7 {
            purchaseInfo.text = "Confirm your purchase \n of the \(id) player \n for 150 skulls"
        } else if prod >= 8 && prod <= 15 {
            purchaseInfo.text = "Confirm your purchase \n of the \(id) player \n for 300 skulls"
        } else if prod >= 16 && prod <= 23 {
            purchaseInfo.text = "Confirm your purchase \n of the \(id) player \n for 500 skulls"
        }
        else if prod == 24 {
            purchaseInfo.text = "Confirm your purchase \n of one Level Skip for 150 skulls \n (Automatically unlocks the next level)"
        } else if prod == 25 {
            purchaseInfo.text = "Confirm your purchase \n of one Extra life \n for 100 skulls"
        } else if prod == 26 {
            purchaseInfo.text = "Confirm your purchase of one \n Slow Motion game for 50 skulls \n (Slows down every skull for 1 level)"
        } else if prod == 27 {
            purchaseInfo.text = "Confirm your purchase of one \n Shrink Potion for 50 skulls \n (Shrinks your player for 1 level)"
        } else if prod == 28 {
            purchaseInfo.text = "Confirm your purchase of one \n Super Speed game for 50 skulls \n (Move faster for 1 level)"
        } else if prod == 29 {
            purchaseInfo.text = "Confirm your purchase of one \n Full Movement game for 25 skulls \n (Move anywhere from the start of one level)"
        } else if prod == 30 {
            purchaseInfo.text = "Confirm your purchase of 250 Skulls for $0.99"
            purchaseInfo.font = UIFont(name: "American Typewriter", size: self.frame.height / 15)
        } else if prod == 31 {
            purchaseInfo.text = "Confirm your purchase of 550 Skulls for $1.99"
            purchaseInfo.font = UIFont(name: "American Typewriter", size: self.frame.height / 15)
        } else if prod == 32 {
            purchaseInfo.text = "Confirm your purchase of 900 Skulls for $2.99"
            purchaseInfo.font = UIFont(name: "American Typewriter", size: self.frame.height / 15)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.view?.addSubview(self.purchaseInfo)
        })
    }
    func addBoostables() {
        boostables.removeFromParent()
        itemScroll.removeFromParent()
        lvlSkip.removeFromParent()
        extraLife.removeFromParent()
        slowMo.removeFromParent()
        shrink.removeFromParent()
        superSpeed.removeFromParent()
        fullMove.removeFromParent()
        itemNote1.removeFromParent()
        itemNote2.removeFromParent()
        itemNote3.removeFromParent()
        itemNote4.removeFromParent()
        itemNote5.removeFromParent()
        itemNote6.removeFromParent()
        self.addChild(itemScroll)
        
        boostables.text = "Boostables:"
        boostables.fontColor = UIColor.blue
        boostables.position = CGPoint(x: self.frame.width / -4, y: self.frame.height * -0.8 - self.frame.height * 0.1)
        boostables.fontSize = CGFloat(self.frame.height / 10)
        self.addChild(boostables)
        
        lvlSkip.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        lvlSkip.position = CGPoint(x: self.frame.width * -0.4, y: self.frame.height * -1 - self.frame.height * 0.1)
        itemScroll.addChild(lvlSkip)
        
        extraLife.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        extraLife.position = CGPoint(x: self.frame.width * -0.2, y: self.frame.height * -1 - self.frame.height * 0.1)
        itemScroll.addChild(extraLife)
        
        slowMo.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        slowMo.position = CGPoint(x: self.frame.width * -0.0, y: self.frame.height * -1 - self.frame.height * 0.1)
        itemScroll.addChild(slowMo)
        
        shrink.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        shrink.position = CGPoint(x: self.frame.width * 0.2, y: self.frame.height * -1 - self.frame.height * 0.1)
        itemScroll.addChild(shrink)
        
        superSpeed.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        superSpeed.position = CGPoint(x: self.frame.width * 0.4, y: self.frame.height * -1 - self.frame.height * 0.1)
        itemScroll.addChild(superSpeed)
        
        fullMove.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        fullMove.position = CGPoint(x: self.frame.width * 0.6, y: self.frame.height * -1 - self.frame.height * 0.1)
        itemScroll.addChild(fullMove)
        
        let defaults = UserDefaults.standard
        
        if defaults.string(forKey: "item1") == nil {
            itemNote1.text = "150"
            itemNote1.fontColor = UIColor.blue
        } else if defaults.string(forKey: "item1") == "activated" {
            itemNote1.text = "Activated"
            itemNote1.fontColor = UIColor.green
        } else if defaults.string(forKey: "item1") == "unactivated" {
            itemNote1.text = "Not Active"
            itemNote1.fontColor = UIColor.red
        }
        itemNote1.position = CGPoint(x: 0, y: -lvlSkip.size.height * 0.75)
        itemNote1.fontSize = CGFloat(self.frame.height / 15)
        self.lvlSkip.addChild(itemNote1)
        
        if defaults.string(forKey: "item2") == nil {
            itemNote2.text = "100"
            itemNote2.fontColor = UIColor.blue
        } else if defaults.string(forKey: "item2") == "activated" {
            itemNote2.text = "Activated"
            itemNote2.fontColor = UIColor.green
        } else if defaults.string(forKey: "item2") == "unactivated" {
            itemNote2.text = "Not Active"
            itemNote2.fontColor = UIColor.red
        }
        itemNote2.position = CGPoint(x: 0, y: -lvlSkip.size.height * 0.75)
        itemNote2.fontSize = CGFloat(self.frame.height / 15)
        self.extraLife.addChild(itemNote2)
        
        if defaults.string(forKey: "item3") == nil {
            itemNote3.text = "50"
            itemNote3.fontColor = UIColor.blue
        } else if defaults.string(forKey: "item3") == "activated" {
            itemNote3.text = "Activated"
            itemNote3.fontColor = UIColor.green
        } else if defaults.string(forKey: "item3") == "unactivated" {
            itemNote3.text = "Not Active"
            itemNote3.fontColor = UIColor.red
        }
        itemNote3.position = CGPoint(x: 0, y: -lvlSkip.size.height * 0.75)
        itemNote3.fontSize = CGFloat(self.frame.height / 15)
        self.slowMo.addChild(itemNote3)
        
        if defaults.string(forKey: "item4") == nil {
            itemNote4.text = "50"
            itemNote4.fontColor = UIColor.blue
        } else if defaults.string(forKey: "item4") == "activated" {
            itemNote4.text = "Activated"
            itemNote4.fontColor = UIColor.green
        } else if defaults.string(forKey: "item4") == "unactivated" {
            itemNote4.text = "Not Active"
            itemNote4.fontColor = UIColor.red
        }
        itemNote4.position = CGPoint(x: 0, y: -lvlSkip.size.height * 0.75)
        itemNote4.fontSize = CGFloat(self.frame.height / 15)
        self.shrink.addChild(itemNote4)
        
        if defaults.string(forKey: "item5") == nil {
            itemNote5.text = "50"
            itemNote5.fontColor = UIColor.blue
        } else if defaults.string(forKey: "item5") == "activated" {
            itemNote5.text = "Activated"
            itemNote5.fontColor = UIColor.green
        } else if defaults.string(forKey: "item5") == "unactivated" {
            itemNote5.text = "Not Active"
            itemNote5.fontColor = UIColor.red
        }
        itemNote5.position = CGPoint(x: 0, y: -lvlSkip.size.height * 0.75)
        itemNote5.fontSize = CGFloat(self.frame.height / 15)
        self.superSpeed.addChild(itemNote5)
        
        if defaults.string(forKey: "item6") == nil {
            itemNote6.text = "25"
            itemNote6.fontColor = UIColor.blue
        } else if defaults.string(forKey: "item6") == "activated" {
            itemNote6.text = "Activated"
            itemNote6.fontColor = UIColor.green
        } else if defaults.string(forKey: "item6") == "unactivated" {
            itemNote6.text = "Not Active"
            itemNote6.fontColor = UIColor.red
        }
        itemNote6.position = CGPoint(x: 0, y: -lvlSkip.size.height * 0.75)
        itemNote6.fontSize = CGFloat(self.frame.height / 15)
        self.fullMove.addChild(itemNote6)
    }
    func addSkulls() {
        buySkulls.removeFromParent()
        leastSkulls.removeFromParent()
        someSkulls.removeFromParent()
        mostSkulls.removeFromParent()
        leastNote.removeFromParent()
        someNote.removeFromParent()
        mostNote.removeFromParent()
        
        buySkulls.text = "Skulls:"
        buySkulls.fontSize = CGFloat(self.frame.height / 10)
        buySkulls.position = CGPoint(x: self.frame.width / -4, y: self.frame.height * -1.4 - self.frame.height * 0.1)
        buySkulls.fontColor = UIColor.blue
        self.addChild(buySkulls)
        
        leastSkulls.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        leastSkulls.position = CGPoint(x: self.frame.width * -0.4, y: self.frame.height * -1.6 - self.frame.height * 0.1)
        self.addChild(leastSkulls)
        
        someSkulls.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        someSkulls.position = CGPoint(x: self.frame.width * -0.2, y: self.frame.height * -1.6 - self.frame.height * 0.1)
        self.addChild(someSkulls)
        
        mostSkulls.size = CGSize(width: self.frame.height / 4, height: self.frame.height / 4)
        mostSkulls.position = CGPoint(x: 0, y: self.frame.height * -1.6 - self.frame.height * 0.1)
        self.addChild(mostSkulls)
        
        leastNote.text = "$0.99"
        leastNote.fontColor = UIColor.blue
        leastNote.fontSize = CGFloat(self.frame.height / 15)
        leastNote.position = CGPoint(x: self.leastSkulls.position.x, y: (self.frame.height * -1.6 - self.frame.height * 0.1) + (self.leastSkulls.size.height * -0.75))
        self.addChild(leastNote)
        
        someNote.text = "$1.99"
        someNote.fontColor = UIColor.blue
        someNote.fontSize = CGFloat(self.frame.height / 15)
        someNote.position = CGPoint(x: self.someSkulls.position.x, y: (self.frame.height * -1.6 - self.frame.height * 0.1) + (self.someSkulls.size.height * -0.75))
        self.addChild(someNote)
        
        mostNote.text = "$2.99"
        mostNote.fontColor = UIColor.blue
        mostNote.fontSize = CGFloat(self.frame.height / 15)
        mostNote.position = CGPoint(x: self.mostSkulls.position.x, y: (self.frame.height * -1.6 - self.frame.height * 0.1) + (self.mostSkulls.size.height * -0.75))
        self.addChild(mostNote)
    }
    func activate(player: Int){
        let defaults = UserDefaults.standard
        defaults.set("activated", forKey: "player\(player)")
        let pastActive = defaults.integer(forKey: "active")
        defaults.set(player, forKey: "active")
        if pastActive == 0 {
            defaults.set("owned", forKey: "player0")
            player0Note.removeFromParent()
            player0Note.text = ""
            player0.addChild(player0Note)
        }else if pastActive == 1 {
            defaults.set("owned", forKey: "player1")
            player1Note.removeFromParent()
            player1Note.text = ""
            player1.addChild(player1Note)
        }else if pastActive == 2 {
            defaults.set("owned", forKey: "player2")
            player2Note.removeFromParent()
            player2Note.text = ""
            player2.addChild(player2Note)
        }else if pastActive == 3 {
            defaults.set("owned", forKey: "player3")
            player3Note.removeFromParent()
            player3Note.text = ""
            player3.addChild(player3Note)
        }else if pastActive == 4 {
            defaults.set("owned", forKey: "player4")
            player4Note.removeFromParent()
            player4Note.text = ""
            player4.addChild(player4Note)
        }else if pastActive == 5 {
            defaults.set("owned", forKey: "player5")
            player5Note.removeFromParent()
            player5Note.text = ""
            player5.addChild(player5Note)
        }else if pastActive == 6 {
            defaults.set("owned", forKey: "player6")
            player6Note.removeFromParent()
            player6Note.text = ""
            player6.addChild(player6Note)
        }else if pastActive == 7 {
            defaults.set("owned", forKey: "player7")
            player7Note.removeFromParent()
            player7Note.text = ""
            player7.addChild(player7Note)
        }else if pastActive == 8 {
            defaults.set("owned", forKey: "player8")
            player8Note.removeFromParent()
            player8Note.text = ""
            player8.addChild(player8Note)
        }else if pastActive == 9 {
            defaults.set("owned", forKey: "player9")
            player9Note.removeFromParent()
            player9Note.text = ""
            player9.addChild(player9Note)
        }else if pastActive == 10 {
            defaults.set("owned", forKey: "player10")
            player10Note.removeFromParent()
            player10Note.text = ""
            player10.addChild(player10Note)
        }else if pastActive == 11{
            defaults.set("owned", forKey: "player11")
            player11Note.removeFromParent()
            player11Note.text = ""
            player11.addChild(player11Note)
        }else if pastActive == 12 {
            defaults.set("owned", forKey: "player12")
            player12Note.removeFromParent()
            player12Note.text = ""
            player12.addChild(player12Note)
        }else if pastActive == 13 {
            defaults.set("owned", forKey: "player13")
            player13Note.removeFromParent()
            player13Note.text = ""
            player13.addChild(player13Note)
        }else if pastActive == 14 {
            defaults.set("owned", forKey: "player14")
            player14Note.removeFromParent()
            player14Note.text = ""
            player14.addChild(player14Note)
        }else if pastActive == 15 {
            defaults.set("owned", forKey: "player15")
            player15Note.removeFromParent()
            player15Note.text = ""
            player15.addChild(player15Note)
        }else if pastActive == 16 {
            defaults.set("owned", forKey: "player16")
            player16Note.removeFromParent()
            player16Note.text = ""
            player16.addChild(player16Note)
        }else if pastActive == 17 {
            defaults.set("owned", forKey: "player17")
            player17Note.removeFromParent()
            player17Note.text = ""
            player17.addChild(player17Note)
        }else if pastActive == 18 {
            defaults.set("owned", forKey: "player18")
            player18Note.removeFromParent()
            player18Note.text = ""
            player18.addChild(player18Note)
        }else if pastActive == 19 {
            defaults.set("owned", forKey: "player19")
            player19Note.removeFromParent()
            player19Note.text = ""
            player19.addChild(player19Note)
        }else if pastActive == 20 {
            defaults.set("owned", forKey: "player20")
            player20Note.removeFromParent()
            player20Note.text = ""
            player20.addChild(player20Note)
        }else if pastActive == 21 {
            defaults.set("owned", forKey: "player21")
            player21Note.removeFromParent()
            player21Note.text = ""
            player21.addChild(player21Note)
        }else if pastActive == 22 {
            defaults.set("owned", forKey: "player22")
            player22Note.removeFromParent()
            player22Note.text = ""
            player22.addChild(player22Note)
        }else if pastActive == 23 {
            defaults.set("owned", forKey: "player23")
            player23Note.removeFromParent()
            player23Note.text = ""
            player23.addChild(player23Note)
        }
    }
    func showPowers(player: Int) {
        if player == 0 || player == 2 || player == 3 || player == 4 || player == 5 || player == 6 || player == 7 {
            powerNote.text = "Powers: \n   None"
            abilityNote.text = "Abilities: \n   None"
        }else if player == 1 {
            powerNote.text = "Powers: \n   Super speed."
            abilityNote.text = "Abilities: \n   None"
        }else if player == 8 {
            powerNote.text = "Powers: \n   Smaller than other players. Better at dodging skulls."
            abilityNote.text = "Abilites: \n   None"
        }else if player == 9 {
            powerNote.text = "Powers: \n   Skrinks all the enemy skulls"
            abilityNote.text = "Abilities: \n   None"
        }else if player == 10 {
            powerNote.text = "Powers: \n   Move anywhere you'd like from the start of the level, and at higher speeds."
            abilityNote.text = "Abilities: \n   None"
        }else if player == 11 {
            powerNote.text = "Powers: \n   Super speed."
            abilityNote.text = "Abilities: \n   None"
        }else if player == 12 {
            powerNote.text = "Powers: \n   None"
            abilityNote.text = "Abilities: \n   Once per level, tap the screen for 5 seconds of invincibility."
        }else if player == 13 {
            powerNote.text = "Powers: \n   None"
            abilityNote.text = "Abilities: \n   Once per level, tap the screen for 10 seconds of super speed."
        }else if player == 14 {
            powerNote.text = "Powers: \n   Collect 100 coins from green skulls rather than 50 on the endless level."
            abilityNote.text = "Abilities: \n   None"
        }else if player == 15 {
            powerNote.text = "Powers: \n   Slightly faster than other players."
            abilityNote.text = "Abilities: \n   Once per level, tap the screen to freeze the enemy skulls for 3 seconds."
        }else if player == 16 {
            powerNote.text = "Powers: \n   Slightly faster than other players."
            abilityNote.text = "Abilities: \n   Once per level, ram into a skull to break it."
        }else if player == 17 {
            powerNote.text = "Powers: \n   Super speed, and shrinks all enemy skulls"
            abilityNote.text = "Abilities: \n   None"
        }else if player == 18 {
            powerNote.text = "Powers: \n   None"
            abilityNote.text = "Abilities: \n   Once per level, tap to destroy every skull on screen."
        }else if player == 19 {
            powerNote.text = "Powers: \n   Super Speed, and smaller than other players."
            abilityNote.text = "Abilities: \n   None"
        }else if player == 20 {
            powerNote.text = "Powers: \n   Shrinks every skull and player on the level."
            abilityNote.text = "Abilities: \n   Once per level, tap the screen for a 10 second speed boost."
        }else if player == 21 {
            powerNote.text = "Powers: \n   Slightly faster than other players."
            abilityNote.text = "Abilities: \n   Once per level, tap the screen and skrink for 10 seconds."
        }else if player == 22 {
            powerNote.text = "Powers: \n   Super speed."
            abilityNote.text = "Abilities: \n   Once per level, tap the screen for 8 seconds of invincibility."
        }else if player == 23 {
            powerNote.text = "Powers: \n   Slightly faster than other players."
            abilityNote.text = "Abilities: \n   Two extra lives per level."
        }
        self.view?.addSubview(powerNote)
        self.view?.addSubview(abilityNote)
    }
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        let myProduct = response.products
        
        print(response.products.count)
        
        print(myProduct[0].productIdentifier)
        print(myProduct[1].productIdentifier)
        print(myProduct[2].productIdentifier)
        
        list.append(myProduct[0] as SKProduct)
        list.append(myProduct[1] as SKProduct)
        list.append(myProduct[2] as SKProduct)
        print("product added")
    }
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("add paymnet")
        for transaction:AnyObject in transactions {
            let trans = transaction as! SKPaymentTransaction
            print(trans.error as Any)
            
            switch trans.transactionState {
            case .purchased:
                print("buy, ok unlock iap here")
                print(p.productIdentifier)
                
                let prodID = p.productIdentifier as String
                switch prodID {
                case "StackOfSkulls":
                    giveSkulls(count: 250)
                case "PileOfSkulls":
                    giveSkulls(count: 550)
                case "OodlesOfSkulls":
                    giveSkulls(count: 900)
                default:
                    print("IAP not setup")
                }
                queue.finishTransaction(trans)
                break;
            case .failed:
                print("buy error")
                queue.finishTransaction(trans)
                break;
            default:
                print("default")
                break;
                
            }
        }
    }
    func buySkulls(str: String) {
        print("buying func called")
        for product in list {
            let prodID = product.productIdentifier
            if(prodID == "\(str)") {
                p = product
                print("\(p)")
                buyProduct()
                break;
            }
        }
    }
    func giveSkulls(count: Int){
        let defaults = UserDefaults.standard
        let mon = defaults.integer(forKey: "money")
        defaults.set(mon + count, forKey: "money")
        purchaseInfo.removeFromSuperview()
        loadSc1()
        buying = false
        purchaseDecline.position = CGPoint(x: self.frame.width / 4, y: self.frame.height * -6)
        purchaseConfirm.position = CGPoint(x: self.frame.width / -4, y: self.frame.height * 5)
        purchaseDecline.removeFromParent()
        purchaseConfirm.removeFromParent()
    }
    func buyProduct() {
        print("buy " + p.productIdentifier)
        let pay = SKPayment(product: p)
        SKPaymentQueue.default().add(self as SKPaymentTransactionObserver)
        SKPaymentQueue.default().add(pay as SKPayment)
    }
    func finishTransaction(trans:SKPaymentTransaction){
        print("finish trans")
    }
    private func paymentQueue(queue: SKPaymentQueue!, removedTransactions transactions: [AnyObject]!){
        print("remove trans")
    }
    func touchDown(atPoint pos : CGPoint) {
        scroll = false
        pnt1x = Int(pos.x)
        pnt1y = Int(pos.y)
        distance = Int(pos.y)
        distance2 = Int(pos.x)
        
        //let w : Bool = false; if w == true {buySkulls(str: "StackOfSkulls")}
    }
    func touchesMoved(toPoint pos: CGPoint) {
        if Sc1 == true {
            var move = SKAction()
            let change = -CGFloat((Int(pos.y) - distance))
            move = SKAction.moveBy(x: 0, y: change, duration: 0)
            cameraNode.run(move)
            distance = Int(pos.y) + Int(change)
            if playerScroll.contains(pos){
                var move2 = SKAction()
                let change2 = CGFloat((Int(pos.x) - distance2))
                move2 = SKAction.moveBy(x: change2 * 2, y: 0, duration: 0.1)
                playerScroll.run(move2)
                distance2 = Int(pos.x) + Int(change2)
            }
            else if itemScroll.contains(pos){
                var move2 = SKAction()
                let change2 = CGFloat((Int(pos.x) - distance2))
                move2 = SKAction.moveBy(x: change2 * 2, y: 0, duration: 0.1)
                itemScroll.run(move2)
                distance2 = Int(pos.x) + Int(change2)
            }
        }
    }
    func touchUp(atPoint pos : CGPoint) {
        pnt2x = Int(pos.x)
        pnt2y = Int(pos.y)
        if ((pnt1x - pnt2x) < 5 && (pnt1x - pnt2x) > -5 && (pnt1y - pnt2y) < 5 && (pnt1y - pnt2y) > -5) {
            scroll = false
        }
        else {
            scroll = true
        }
        if cameraNode.position.y > 0 && Sc1 == true {
            let camerareset = SKAction.move(to: CGPoint(x: 0, y: 0), duration: 0.5)
            cameraNode.run(camerareset)
        }
        if cameraNode.position.y < -self.frame.height * 1.5 && Sc1 == true {
            let camerareset = SKAction.move(to: CGPoint(x: 0, y: -self.frame.height * 1.5), duration: 0.5)
            cameraNode.run(camerareset)
        }
        if scroll == true && playerScroll.contains(pos) && Sc1 == true{
            playerScroll.removeAllChildren()
            playerScroll.removeFromParent()
            let y : CGFloat = self.frame.height / -3 - self.frame.height * 0.1
            
            player0.position = CGPoint(x: player0.position.x + playerScroll.position.x, y: y)
            player1.position = CGPoint(x: player1.position.x + playerScroll.position.x, y: y)
            player2.position = CGPoint(x: player2.position.x + playerScroll.position.x, y: y)
            player3.position = CGPoint(x: player3.position.x + playerScroll.position.x, y: y)
            player4.position = CGPoint(x: player4.position.x + playerScroll.position.x, y: y)
            player5.position = CGPoint(x: player5.position.x + playerScroll.position.x, y: y)
            player6.position = CGPoint(x: player6.position.x + playerScroll.position.x, y: y)
            player7.position = CGPoint(x: player7.position.x + playerScroll.position.x, y: y)
            player8.position = CGPoint(x: player8.position.x + playerScroll.position.x, y: y)
            player9.position = CGPoint(x: player9.position.x + playerScroll.position.x, y: y)
            player10.position = CGPoint(x: player10.position.x + playerScroll.position.x, y: y)
            player11.position = CGPoint(x: player11.position.x + playerScroll.position.x, y: y)
            player12.position = CGPoint(x: player12.position.x + playerScroll.position.x, y: y)
            player13.position = CGPoint(x: player13.position.x + playerScroll.position.x, y: y)
            player14.position = CGPoint(x: player14.position.x + playerScroll.position.x, y: y)
            player15.position = CGPoint(x: player15.position.x + playerScroll.position.x, y: y)
            player16.position = CGPoint(x: player16.position.x + playerScroll.position.x, y: y)
            player17.position = CGPoint(x: player17.position.x + playerScroll.position.x, y: y)
            player18.position = CGPoint(x: player18.position.x + playerScroll.position.x, y: y)
            player19.position = CGPoint(x: player19.position.x + playerScroll.position.x, y: y)
            player20.position = CGPoint(x: player20.position.x + playerScroll.position.x, y: y)
            player21.position = CGPoint(x: player21.position.x + playerScroll.position.x, y: y)
            player22.position = CGPoint(x: player22.position.x + playerScroll.position.x, y: y)
            player23.position = CGPoint(x: player23.position.x + playerScroll.position.x, y: y)
            
            playerScroll.position = CGPoint(x: 0, y: 0)
            self.addChild(playerScroll)
            playerScroll.addChild(player0);playerScroll.addChild(player1);playerScroll.addChild(player2);playerScroll.addChild(player3);playerScroll.addChild(player4);playerScroll.addChild(player5);playerScroll.addChild(player6);playerScroll.addChild(player7);playerScroll.addChild(player8);playerScroll.addChild(player9);playerScroll.addChild(player10);playerScroll.addChild(player11);playerScroll.addChild(player12);playerScroll.addChild(player13);playerScroll.addChild(player14);playerScroll.addChild(player15);playerScroll.addChild(player16);playerScroll.addChild(player17);playerScroll.addChild(player18);playerScroll.addChild(player19);playerScroll.addChild(player20);playerScroll.addChild(player21);playerScroll.addChild(player22);playerScroll.addChild(player23)
        }
        if scroll == true && itemScroll.contains(pos) && Sc1 == true {
            itemScroll.removeAllChildren()
            itemScroll.removeFromParent()
            let y : CGFloat = self.frame.height * -1 - self.frame.height * 0.1
            
            lvlSkip.position = CGPoint(x: lvlSkip.position.x + itemScroll.position.x, y: y)
            extraLife.position = CGPoint(x: extraLife.position.x + itemScroll.position.x, y: y)
            slowMo.position = CGPoint(x: slowMo.position.x + itemScroll.position.x, y: y)
            shrink.position = CGPoint(x: shrink.position.x + itemScroll.position.x, y: y)
            superSpeed.position = CGPoint(x: superSpeed.position.x + itemScroll.position.x, y: y)
            fullMove.position = CGPoint(x: fullMove.position.x + itemScroll.position.x, y: y)
            
            itemScroll.position = CGPoint(x: 0, y: 0)
            self.addChild(itemScroll)
            itemScroll.addChild(lvlSkip);itemScroll.addChild(extraLife);itemScroll.addChild(slowMo);itemScroll.addChild(shrink);itemScroll.addChild(superSpeed);itemScroll.addChild(fullMove)
        }
        if back.contains(pos) && scroll == false {
            if Sc1 == true {
                variables.doneShooping = true
            }
            else if Sc2 == true && spun == false{
                loadSc1()
            }
            else if Sc3 == true {
                purchaseInfo.removeFromSuperview()
                loadSc1()
            }
        }
        if purchaseDecline.contains(pos) && Sc3 == true {
            purchaseInfo.removeFromSuperview()
            loadSc1()
            purchaseDecline.position = CGPoint(x: self.frame.width * 8, y: 0)
            purchaseConfirm.position = CGPoint(x: self.frame.width * -8, y: 0)
        }
        else if purchaseConfirm.contains(pos) && Sc3 == true {
            let defaults = UserDefaults.standard
            let mon = defaults.integer(forKey: "money")
            if item >= 0 && item <= 23 {
                defaults.set("owned", forKey: "player\(item)")
                if item >= 0 && item <= 7 {
                    defaults.set(mon - 150, forKey: "money")
                } else if item >= 8 && item <= 15 {
                    defaults.set(mon - 300, forKey: "money")
                } else if item >= 16 && item <= 23 {
                    defaults.set(mon - 500, forKey: "money")
                }
                if item == 0 {
                    activate(player: 0)
                    showPowers(player: 0)
                    player0Note.removeFromParent()
                    player0Note.fontColor = UIColor.green
                    player0Note.text = "Activated"
                    player0.addChild(player0Note)
                } else if item == 1 {
                    activate(player: 1)
                    showPowers(player: 1)
                    player1Note.removeFromParent()
                    player1Note.fontColor = UIColor.green
                    player1Note.text = "Activated"
                    player1.addChild(player1Note)
                } else if item == 2 {
                    activate(player: 2)
                    showPowers(player: 2)
                    player2Note.removeFromParent()
                    player2Note.fontColor = UIColor.green
                    player2Note.text = "Activated"
                    player2.addChild(player2Note)
                } else if item == 3 {
                    activate(player: 3)
                    showPowers(player: 3)
                    player3Note.removeFromParent()
                    player3Note.fontColor = UIColor.green
                    player3Note.text = "Activated"
                    player3.addChild(player3Note)
                } else if item == 4 {
                    activate(player: 4)
                    showPowers(player: 4)
                    player4Note.removeFromParent()
                    player4Note.fontColor = UIColor.green
                    player4Note.text = "Activated"
                    player4.addChild(player4Note)
                } else if item == 5 {
                    activate(player: 5)
                    showPowers(player: 5)
                    player5Note.removeFromParent()
                    player5Note.fontColor = UIColor.green
                    player5Note.text = "Activated"
                    player5.addChild(player5Note)
                } else if item == 6 {
                    activate(player: 6)
                    showPowers(player: 6)
                    player6Note.removeFromParent()
                    player6Note.fontColor = UIColor.green
                    player6Note.text = "Activated"
                    player6.addChild(player6Note)
                } else if item == 7 {
                    activate(player: 7)
                    showPowers(player: 7)
                    player7Note.removeFromParent()
                    player7Note.fontColor = UIColor.green
                    player7Note.text = "Activated"
                    player7.addChild(player7Note)
                } else if item == 8 {
                    activate(player: 8)
                    showPowers(player: 8)
                    player8Note.removeFromParent()
                    player8Note.fontColor = UIColor.green
                    player8Note.text = "Activated"
                    player8.addChild(player8Note)
                } else if item == 9 {
                    activate(player: 9)
                    showPowers(player: 9)
                    player9Note.removeFromParent()
                    player9Note.fontColor = UIColor.green
                    player9Note.text = "Activated"
                    player9.addChild(player9Note)
                } else if item == 10 {
                    activate(player: 10)
                    showPowers(player: 10)
                    player10Note.removeFromParent()
                    player10Note.fontColor = UIColor.green
                    player10Note.text = "Activated"
                    player10.addChild(player10Note)
                } else if item == 11 {
                    activate(player: 11)
                    showPowers(player: 11)
                    player11Note.removeFromParent()
                    player11Note.fontColor = UIColor.green
                    player11Note.text = "Activated"
                    player11.addChild(player11Note)
                } else if item == 12 {
                    activate(player: 12)
                    showPowers(player: 12)
                    player12Note.removeFromParent()
                    player12Note.fontColor = UIColor.green
                    player12Note.text = "Activated"
                    player12.addChild(player12Note)
                } else if item == 13 {
                    activate(player: 13)
                    showPowers(player: 13)
                    player13Note.removeFromParent()
                    player13Note.fontColor = UIColor.green
                    player13Note.text = "Activated"
                    player13.addChild(player13Note)
                } else if item == 14 {
                    activate(player: 14)
                    showPowers(player: 14)
                    player14Note.removeFromParent()
                    player14Note.fontColor = UIColor.green
                    player14Note.text = "Activated"
                    player14.addChild(player14Note)
                } else if item == 15 {
                    activate(player: 15)
                    showPowers(player: 15)
                    player15Note.removeFromParent()
                    player15Note.fontColor = UIColor.green
                    player15Note.text = "Activated"
                    player15.addChild(player15Note)
                } else if item == 16 {
                    activate(player: 16)
                    showPowers(player: 16)
                    player16Note.removeFromParent()
                    player16Note.fontColor = UIColor.green
                    player16Note.text = "Activated"
                    player16.addChild(player16Note)
                } else if item == 17 {
                    activate(player: 17)
                    showPowers(player: 17)
                    player17Note.removeFromParent()
                    player17Note.fontColor = UIColor.green
                    player17Note.text = "Activated"
                    player17.addChild(player17Note)
                } else if item == 18 {
                    activate(player: 18)
                    showPowers(player: 18)
                    player18Note.removeFromParent()
                    player18Note.fontColor = UIColor.green
                    player18Note.text = "Activated"
                    player18.addChild(player18Note)
                } else if item == 19 {
                    activate(player: 19)
                    showPowers(player: 19)
                    player19Note.removeFromParent()
                    player19Note.fontColor = UIColor.green
                    player19Note.text = "Activated"
                    player19.addChild(player19Note)
                } else if item == 20 {
                    activate(player: 20)
                    showPowers(player: 20)
                    player20Note.removeFromParent()
                    player20Note.fontColor = UIColor.green
                    player20Note.text = "Activated"
                    player20.addChild(player20Note)
                } else if item == 21 {
                    activate(player: 21)
                    showPowers(player: 21)
                    player21Note.removeFromParent()
                    player21Note.fontColor = UIColor.green
                    player21Note.text = "Activated"
                    player21.addChild(player21Note)
                } else if item == 22 {
                    activate(player: 22)
                    showPowers(player: 22)
                    player22Note.removeFromParent()
                    player22Note.fontColor = UIColor.green
                    player22Note.text = "Activated"
                    player22.addChild(player22Note)
                } else if item == 23 {
                    activate(player: 23)
                    showPowers(player: 23)
                    player23Note.removeFromParent()
                    player23Note.fontColor = UIColor.green
                    player23Note.text = "Activated"
                    player23.addChild(player23Note)
                }
            } else if item == 24 {
                defaults.set(mon - 150, forKey: "money")
                defaults.set(nil, forKey: "item1")
                let levsbeat = defaults.integer(forKey: "lev")
                defaults.set(levsbeat + 1, forKey: "lev")
            } else if item == 25 {
                defaults.set(mon - 150, forKey: "money")
                defaults.set("activated", forKey: "item2")
            } else if item == 26 {
                defaults.set(mon - 150, forKey: "money")
                defaults.set("activated", forKey: "item3")
            } else if item == 27 {
                defaults.set(mon - 150, forKey: "money")
                defaults.set("activated", forKey: "item4")
            } else if item == 28 {
                defaults.set(mon - 150, forKey: "money")
                defaults.set("activated", forKey: "item5")
            } else if item == 29 {
                defaults.set(mon - 150, forKey: "money")
                defaults.set("activated", forKey: "item6")
            }
            else if item == 30 && buying == false {
                buying = true
                buySkulls(str: "StackOfSkulls")
            } else if item == 31 && buying == false {
                buying = true
                buySkulls(str: "PileOfSkulls")
            } else if item == 32 && buying == false {
                buying = true
                buySkulls(str: "OodlesOfSkulls")
            }
            if item <= 29 {
                purchaseInfo.removeFromSuperview()
                loadSc1()
                purchaseDecline.position = CGPoint(x: self.frame.width * 8, y: 0)
                purchaseConfirm.position = CGPoint(x: self.frame.width * -8, y: 0)
            } else if item >= 30 {
                let cover = SKSpriteNode()
                cover.color = UIColor.black
                cover.alpha = 0.5
                cover.size = CGSize(width: self.frame.width, height: self.frame.height)
                cover.position = CGPoint(x: 0, y: 0)
                self.addChild(cover)
            }
        }
        if vending1.contains(pos) && scroll == false && Sc1 == true {
            vend1 = true
            loadSc2(vend: 1)
        }
        else if vending2.contains(pos) && scroll == false && Sc1 == true {
            vend2 = true
            loadSc2(vend: 2)
        }
        else if vending3.contains(pos) && scroll == false && Sc1 == true {
            vend3 = true
            loadSc2(vend: 3)
        }
        else if wheel1.contains(pos) && Sc2 == true && vend1 == true && spun == false {
            let defaults = UserDefaults.standard
            let currency = defaults.integer(forKey: "money")
            spun = true
            if currency < 100 {
                spun = false
                let note = SKLabelNode(fontNamed: "American Typewriter")
                note.text = "You need 100 skulls to spin this wheel"
                note.fontColor = UIColor.red
                note.fontSize = CGFloat(self.frame.height / 15)
                note.position = CGPoint(x: 0, y: self.frame.height / 3)
                note.alpha = 0
                note.zPosition = 1
                self.addChild(note)
                let noteBg = SKSpriteNode()
                noteBg.color = UIColor.black
                noteBg.size = CGSize(width: self.frame.width * 0.75, height: self.frame.height / 10)
                noteBg.position = CGPoint(x: 0, y: (self.frame.height / 3) + self.frame.height / 30)
                noteBg.alpha = 0
                noteBg.zPosition = 0
                self.addChild(noteBg)
                money.removeFromParent()
                money.fontColor = UIColor.red
                self.addChild(money)
                let fade = SKAction.fadeAlpha(by: 1, duration: 0.5)
                noteBg.run(fade)
                note.run(fade)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    let unfade = SKAction.fadeAlpha(by: -1, duration: 1)
                    note.run(unfade)
                    noteBg.run(unfade)
                })
            }
            else {
                var num = CGFloat.random(in: 24...31.9)
                num.round(FloatingPointRoundingRule.down)
                let int : Int = Int(num - 24)
                spinAction = SKAction.rotate(byAngle: num / 8 * 6.2831, duration: 2)
                wheel1.run(spinAction)
                let str = defaults.string(forKey: "player\(int)")
                if str == nil {
                    defaults.set("owned", forKey: "player\(int)")
                    defaults.set(currency - 100, forKey: "money")
                    money.removeFromParent()
                    money.text = "\(currency - 100)"
                    self.addChild(money)
                    let wonPlayer = SKSpriteNode(imageNamed: "Player\(num - 24)")
                    wonPlayer.size = CGSize(width: self.frame.height / 2, height: self.frame.height / 2)
                    wonPlayer.alpha = 0
                    let playerBg1 = SKSpriteNode(imageNamed: "PlayerBg1")
                    playerBg1.size = CGSize(width: self.frame.width, height: self.frame.height)
                    playerBg1.alpha = 0
                    self.addChild(playerBg1)
                    let playerBg2 = SKSpriteNode(imageNamed: "PlayerBg2")
                    playerBg2.size = CGSize(width: self.frame.width, height: self.frame.height)
                    playerBg2.alpha = 0
                    self.addChild(playerBg2)
                    self.addChild(wonPlayer)
                    let wait = SKAction.wait(forDuration: 2)
                    let wait2 = SKAction.wait(forDuration: 1)
                    let fade = SKAction.fadeAlpha(by: 1, duration: 1)
                    let unfade = SKAction.fadeAlpha(by: -1, duration: 1)
                    let sequence = SKAction.sequence([wait, fade])
                    let sequence2 = SKAction.sequence([fade, unfade])
                    let action = SKAction.repeat(sequence2, count: 8)
                    let sequence3 = SKAction.sequence([wait, fade])
                    let sequence4 = SKAction.sequence([wait, wait2, action, fade])
                    
                    wonPlayer.run(sequence)
                    playerBg1.run(sequence3)
                    playerBg2.run(sequence4)
                    
                    if int == 0 {
                        activate(player: 0)
                        player0Note.removeFromParent()
                        player0Note.fontColor = UIColor.green
                        player0Note.text = "Activated"
                    } else if int == 1 {
                        activate(player: 1)
                        player1Note.removeFromParent()
                        player1Note.fontColor = UIColor.green
                        player1Note.text = "Activated"
                    } else if int == 2 {
                        activate(player: 2)
                        player2Note.removeFromParent()
                        player2Note.fontColor = UIColor.green
                        player2Note.text = "Activated"
                    } else if int == 3 {
                        activate(player: 3)
                        player3Note.removeFromParent()
                        player3Note.fontColor = UIColor.green
                        player3Note.text = "Activated"
                    } else if int == 4 {
                        activate(player: 4)
                        player4Note.removeFromParent()
                        player4Note.fontColor = UIColor.green
                        player4Note.text = "Activated"
                    } else if int == 5 {
                        activate(player: 5)
                        player5Note.removeFromParent()
                        player5Note.fontColor = UIColor.green
                        player5Note.text = "Activated"
                    } else if int == 6 {
                        activate(player: 6)
                        player6Note.removeFromParent()
                        player6Note.fontColor = UIColor.green
                        player6Note.text = "Activated"
                    } else if int == 7 {
                        activate(player: 7)
                        player7Note.removeFromParent()
                        player7Note.fontColor = UIColor.green
                        player7Note.text = "Activated"
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                        self.showPowers(player: int)
                        self.spunDun = true
                    })
                } else if str == "owned" || str == "activated" {
                    defaults.set(currency - 100, forKey: "money")
                    money.removeFromParent()
                    money.text = "\(currency - 100)"
                    self.addChild(money)
                    
                    let wait1 = SKAction.wait(forDuration: 2.5)
                    let wait2 = SKAction.wait(forDuration: 1)
                    let fall = SKAction.moveTo(y: -self.frame.height * 1.5, duration: 1)
                    let fade = SKAction.fadeAlpha(by: -1, duration: 0)
                    let moveBack = SKAction.moveTo(y: 0, duration: 0)
                    let fadeBack = SKAction.fadeAlpha(by: 1, duration: 1)
                    let remove = SKAction.removeFromParent()
                    
                    wheel1.zPosition = 3
                    
                    let tryAgen = SKLabelNode(fontNamed: "American Typewriter")
                    tryAgen.text = "Try Again"
                    tryAgen.fontColor = UIColor.red
                    tryAgen.fontSize = CGFloat(self.frame.height / 10)
                    tryAgen.position = CGPoint(x: 0, y: self.frame.height / -20)
                    tryAgen.alpha = 1
                    tryAgen.zPosition = 1
                    self.addChild(tryAgen)
                    
                    let sequence1 = SKAction.sequence([wait1, fall, fade, moveBack, wait2, fadeBack])
                    wheel1.run(sequence1)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
                        self.spunDun = true
                        tryAgen.run(remove)
                        self.wheel1.zPosition = 0
                    })
                }
            }
        }
        else if wheel2.contains(pos) && Sc2 == true && vend2 == true && spun == false{
            let defaults = UserDefaults.standard
            let currency = defaults.integer(forKey: "money")
            spun = true
            if currency < 250 {
                spun = false
                let note = SKLabelNode(fontNamed: "American Typewriter")
                note.text = "You need 250 skulls to spin this wheel"
                note.fontColor = UIColor.red
                note.fontSize = CGFloat(self.frame.height / 15)
                note.position = CGPoint(x: 0, y: self.frame.height / 3)
                note.alpha = 0
                note.zPosition = 1
                self.addChild(note)
                let noteBg = SKSpriteNode()
                noteBg.color = UIColor.black
                noteBg.size = CGSize(width: self.frame.width * 0.75, height: self.frame.height / 10)
                noteBg.position = CGPoint(x: 0, y: (self.frame.height / 3) + self.frame.height / 30)
                noteBg.alpha = 0
                noteBg.zPosition = 0
                self.addChild(noteBg)
                money.removeFromParent()
                money.fontColor = UIColor.red
                self.addChild(money)
                let fade = SKAction.fadeAlpha(by: 1, duration: 0.5)
                noteBg.run(fade)
                note.run(fade)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    let unfade = SKAction.fadeAlpha(by: -1, duration: 1)
                    note.run(unfade)
                    noteBg.run(unfade)
                })
            }
            else {
                var num = CGFloat.random(in: 24...31.9)
                let int : Int = Int(num - 16)
                num.round(FloatingPointRoundingRule.down)
                spinAction = SKAction.rotate(byAngle: num / 8 * 6.2831, duration: 2)
                wheel2.run(spinAction)
                let str = defaults.string(forKey: "player\(int)")
                if str == nil {
                    defaults.set("owned", forKey: "player\(int)")
                    defaults.set(currency - 250, forKey: "money")
                    money.removeFromParent()
                    money.text = "\(currency - 250)"
                    self.addChild(money)
                    let wonPlayer = SKSpriteNode(imageNamed: "Player\(num - 16)")
                    wonPlayer.size = CGSize(width: self.frame.height / 2, height: self.frame.height / 2)
                    wonPlayer.alpha = 0
                    let playerBg1 = SKSpriteNode(imageNamed: "PlayerBg1")
                    playerBg1.size = CGSize(width: self.frame.width, height: self.frame.height)
                    playerBg1.alpha = 0
                    self.addChild(playerBg1)
                    let playerBg2 = SKSpriteNode(imageNamed: "PlayerBg2")
                    playerBg2.size = CGSize(width: self.frame.width, height: self.frame.height)
                    playerBg2.alpha = 0
                    self.addChild(playerBg2)
                    self.addChild(wonPlayer)
                    let wait = SKAction.wait(forDuration: 2)
                    let wait2 = SKAction.wait(forDuration: 1)
                    let fade = SKAction.fadeAlpha(by: 1, duration: 1)
                    let unfade = SKAction.fadeAlpha(by: -1, duration: 1)
                    let sequence = SKAction.sequence([wait, fade])
                    let sequence2 = SKAction.sequence([fade, unfade])
                    let action = SKAction.repeat(sequence2, count: 8)
                    let sequence3 = SKAction.sequence([wait, fade])
                    let sequence4 = SKAction.sequence([wait, wait2, action, fade])
                    
                    wonPlayer.run(sequence)
                    playerBg1.run(sequence3)
                    playerBg2.run(sequence4)
                    
                    if int == 8 {
                        activate(player: 8)
                        player8Note.removeFromParent()
                        player8Note.fontColor = UIColor.green
                        player8Note.text = "Activated"
                    } else if int == 9 {
                        activate(player: 9)
                        player9Note.removeFromParent()
                        player9Note.fontColor = UIColor.green
                        player9Note.text = "Activated"
                    } else if int == 10 {
                        activate(player: 10)
                        player10Note.removeFromParent()
                        player10Note.fontColor = UIColor.green
                        player10Note.text = "Activated"
                    } else if int == 11 {
                        activate(player: 11)
                        player11Note.removeFromParent()
                        player11Note.fontColor = UIColor.green
                        player11Note.text = "Activated"
                    } else if int == 12 {
                        activate(player: 12)
                        player12Note.removeFromParent()
                        player12Note.fontColor = UIColor.green
                        player12Note.text = "Activated"
                    } else if int == 13 {
                        activate(player: 13)
                        player13Note.removeFromParent()
                        player13Note.fontColor = UIColor.green
                        player13Note.text = "Activated"
                    } else if int == 14 {
                        activate(player: 14)
                        player14Note.removeFromParent()
                        player14Note.fontColor = UIColor.green
                        player14Note.text = "Activated"
                    } else if int == 15 {
                        activate(player: 15)
                        player15Note.removeFromParent()
                        player15Note.fontColor = UIColor.green
                        player15Note.text = "Activated"
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                        self.showPowers(player: int)
                        self.spunDun = true
                    })
                } else if str == "owned" || str == "activated" {
                    defaults.set(currency - 250, forKey: "money")
                    money.removeFromParent()
                    money.text = "\(currency - 250)"
                    self.addChild(money)
                    
                    let wait1 = SKAction.wait(forDuration: 2.5)
                    let wait2 = SKAction.wait(forDuration: 1)
                    let fall = SKAction.moveTo(y: -self.frame.height * 1.5, duration: 1)
                    let fade = SKAction.fadeAlpha(by: -1, duration: 0)
                    let moveBack = SKAction.moveTo(y: 0, duration: 0)
                    let fadeBack = SKAction.fadeAlpha(by: 1, duration: 1)
                    let remove = SKAction.removeFromParent()
                    
                    wheel2.zPosition = 3
                    
                    let tryAgen = SKLabelNode(fontNamed: "American Typewriter")
                    tryAgen.text = "Try Again"
                    tryAgen.fontColor = UIColor.red
                    tryAgen.fontSize = CGFloat(self.frame.height / 10)
                    tryAgen.position = CGPoint(x: 0, y: self.frame.height / -20)
                    tryAgen.alpha = 1
                    tryAgen.zPosition = 1
                    self.addChild(tryAgen)
                    
                    let sequence1 = SKAction.sequence([wait1, fall, fade, moveBack, wait2, fadeBack])
                    wheel2.run(sequence1)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
                        self.spunDun = true
                        tryAgen.run(remove)
                        self.wheel2.zPosition = 0
                    })
                }
            }
        }
        else if wheel3.contains(pos) && Sc2 == true && vend3 == true && spun == false{
            let defaults = UserDefaults.standard
            let currency = defaults.integer(forKey: "money")
            spun = true
            if currency < 400 {
                spun = false
                let note = SKLabelNode(fontNamed: "American Typewriter")
                note.text = "You need 400 skulls to spin this wheel"
                note.fontColor = UIColor.red
                note.fontSize = CGFloat(self.frame.height / 15)
                note.position = CGPoint(x: 0, y: self.frame.height / 3)
                note.alpha = 0
                note.zPosition = 1
                self.addChild(note)
                let noteBg = SKSpriteNode()
                noteBg.color = UIColor.black
                noteBg.size = CGSize(width: self.frame.width * 0.75, height: self.frame.height / 10)
                noteBg.position = CGPoint(x: 0, y: (self.frame.height / 3) + self.frame.height / 30)
                noteBg.alpha = 0
                noteBg.zPosition = 0
                self.addChild(noteBg)
                money.removeFromParent()
                money.fontColor = UIColor.red
                self.addChild(money)
                let fade = SKAction.fadeAlpha(by: 1, duration: 0.5)
                noteBg.run(fade)
                note.run(fade)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    let unfade = SKAction.fadeAlpha(by: -1, duration: 1)
                    note.run(unfade)
                    noteBg.run(unfade)
                })
            }
            else {
                var num = CGFloat.random(in: 24...31.9)
                let int : Int = Int(num - 8)
                num.round(FloatingPointRoundingRule.down)
                spinAction = SKAction.rotate(byAngle: num / 8 * 6.2831, duration: 2)
                wheel3.run(spinAction)
                let str = defaults.string(forKey: "player\(int)")
                if str == nil {
                    defaults.set("owned", forKey: "player\(int)")
                    defaults.set(currency - 400, forKey: "money")
                    money.removeFromParent()
                    money.text = "\(currency - 400)"
                    self.addChild(money)
                    let wonPlayer = SKSpriteNode(imageNamed: "Player\(num - 8)")
                    wonPlayer.size = CGSize(width: self.frame.height / 2, height: self.frame.height / 2)
                    wonPlayer.alpha = 0
                    let playerBg1 = SKSpriteNode(imageNamed: "PlayerBg1")
                    playerBg1.size = CGSize(width: self.frame.width, height: self.frame.height)
                    playerBg1.alpha = 0
                    self.addChild(playerBg1)
                    let playerBg2 = SKSpriteNode(imageNamed: "PlayerBg2")
                    playerBg2.size = CGSize(width: self.frame.width, height: self.frame.height)
                    playerBg2.alpha = 0
                    self.addChild(playerBg2)
                    self.addChild(wonPlayer)
                    let wait = SKAction.wait(forDuration: 2)
                    let wait2 = SKAction.wait(forDuration: 1)
                    let fade = SKAction.fadeAlpha(by: 1, duration: 1)
                    let unfade = SKAction.fadeAlpha(by: -1, duration: 1)
                    let sequence = SKAction.sequence([wait, fade])
                    let sequence2 = SKAction.sequence([fade, unfade])
                    let action = SKAction.repeat(sequence2, count: 8)
                    let sequence3 = SKAction.sequence([wait, fade])
                    let sequence4 = SKAction.sequence([wait, wait2, action, fade])
                    
                    wonPlayer.run(sequence)
                    playerBg1.run(sequence3)
                    playerBg2.run(sequence4)
                    
                    if int == 16 {
                        activate(player: 16)
                        player16Note.removeFromParent()
                        player16Note.fontColor = UIColor.green
                        player16Note.text = "Activated"
                    } else if int == 17 {
                        activate(player: 17)
                        player17Note.removeFromParent()
                        player17Note.fontColor = UIColor.green
                        player17Note.text = "Activated"
                    } else if int == 18 {
                        activate(player: 18)
                        player18Note.removeFromParent()
                        player18Note.fontColor = UIColor.green
                        player18Note.text = "Activated"
                    } else if int == 19 {
                        activate(player: 19)
                        player19Note.removeFromParent()
                        player19Note.fontColor = UIColor.green
                        player19Note.text = "Activated"
                    } else if int == 20 {
                        activate(player: 20)
                        player20Note.removeFromParent()
                        player20Note.fontColor = UIColor.green
                        player20Note.text = "Activated"
                    } else if int == 21 {
                        activate(player: 21)
                        player21Note.removeFromParent()
                        player21Note.fontColor = UIColor.green
                        player21Note.text = "Activated"
                    } else if int == 22 {
                        activate(player: 22)
                        player22Note.removeFromParent()
                        player22Note.fontColor = UIColor.green
                        player22Note.text = "Activated"
                    } else if int == 23 {
                        activate(player: 23)
                        player23Note.removeFromParent()
                        player23Note.fontColor = UIColor.green
                        player23Note.text = "Activated"
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                        self.showPowers(player: int)
                        self.spunDun = true
                    })
                } else if str == "owned" || str == "activated" {
                    defaults.set(currency - 400, forKey: "money")
                    money.removeFromParent()
                    money.text = "\(currency - 400)"
                    self.addChild(money)
                    
                    let wait1 = SKAction.wait(forDuration: 2.5)
                    let wait2 = SKAction.wait(forDuration: 1)
                    let fall = SKAction.moveTo(y: -self.frame.height * 1.5, duration: 1)
                    let fade = SKAction.fadeAlpha(by: -1, duration: 0)
                    let moveBack = SKAction.moveTo(y: 0, duration: 0)
                    let fadeBack = SKAction.fadeAlpha(by: 1, duration: 1)
                    let remove = SKAction.removeFromParent()
                    
                    wheel3.zPosition = 3
                    
                    let tryAgen = SKLabelNode(fontNamed: "American Typewriter")
                    tryAgen.text = "Try Again"
                    tryAgen.fontColor = UIColor.red
                    tryAgen.fontSize = CGFloat(self.frame.height / 10)
                    tryAgen.position = CGPoint(x: 0, y: self.frame.height / -20)
                    tryAgen.alpha = 1
                    tryAgen.zPosition = 1
                    self.addChild(tryAgen)
                    
                    let sequence1 = SKAction.sequence([wait1, fall, fade, moveBack, wait2, fadeBack])
                    wheel3.run(sequence1)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
                        self.spunDun = true
                        tryAgen.run(remove)
                        self.wheel3.zPosition = 0
                    })
                }
            }
        }
        else if spun == true && spunDun == true{
            spunDun = false
            spun = false
            if vend1 == true {
                loadSc2(vend: 1)
            }
            else if vend2 == true {
                loadSc2(vend: 2)
            }
            else if vend3 == true {
                loadSc2(vend: 3)
            }
        }
        else if player0.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player0")
            if str == "owned"{
                activate(player: 0)
                player0Note.removeFromParent()
                player0Note.fontColor = UIColor.green
                player0Note.text = "Activated"
                player0.addChild(player0Note)
                showPowers(player: 0)
            } else if str == "activated" {
                showPowers(player: 0)
            } else if str == nil && defaults.integer(forKey: "money") >= 150 {
                loadSc3(prod: 0, id: "Player 0")
            }
        }
        else if player1.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player1")
            if str == "owned"{
                activate(player: 1)
                player1Note.removeFromParent()
                player1Note.fontColor = UIColor.green
                player1Note.text = "Activated"
                player1.addChild(player1Note)
                showPowers(player: 1)
            } else if str == "activated" {
                showPowers(player: 1)
            } else if str == nil && defaults.integer(forKey: "money") >= 150 {
                loadSc3(prod: 1, id: "MyType")
            }
        }
        else if player2.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player2")
            if str == "owned"{
                activate(player: 2)
                player2Note.removeFromParent()
                player2Note.fontColor = UIColor.green
                player2Note.text = "Activated"
                player2.addChild(player2Note)
                showPowers(player: 2)
            } else if str == "activated" {
                showPowers(player: 2)
            } else if str == nil && defaults.integer(forKey: "money") >= 150 {
                loadSc3(prod: 2, id: "Heart")
            }
        }
        else if player3.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player3")
            if str == "owned"{
                activate(player: 3)
                player3Note.removeFromParent()
                player3Note.fontColor = UIColor.green
                player3Note.text = "Activated"
                player3.addChild(player3Note)
                showPowers(player: 3)
            } else if str == "activated" {
                showPowers(player: 3)
            } else if str == nil && defaults.integer(forKey: "money") >= 150 {
                loadSc3(prod: 3, id: "Eye")
            }
        }
        else if player4.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player4")
            if str == "owned"{
                activate(player: 4)
                player4Note.removeFromParent()
                player4Note.fontColor = UIColor.green
                player4Note.text = "Activated"
                player4.addChild(player4Note)
                showPowers(player: 4)
            } else if str == "activated" {
                showPowers(player: 4)
            } else if str == nil && defaults.integer(forKey: "money") >= 150 {
                loadSc3(prod: 4, id: "Stop Sign")
            }
        }
        else if player5.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player5")
            if str == "owned"{
                activate(player: 5)
                player5Note.removeFromParent()
                player5Note.fontColor = UIColor.green
                player5Note.text = "Activated"
                player5.addChild(player5Note)
                showPowers(player: 5)
            } else if str == "activated" {
                showPowers(player: 5)
            } else if str == nil && defaults.integer(forKey: "money") >= 150 {
                loadSc3(prod: 5, id: "Monster")
            }
        }
        else if player6.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player6")
            if str == "owned"{
                activate(player: 6)
                player6Note.removeFromParent()
                player6Note.fontColor = UIColor.green
                player6Note.text = "Activated"
                player6.addChild(player6Note)
                showPowers(player: 6)
            } else if str == "activated" {
                showPowers(player: 6)
            } else if str == nil && defaults.integer(forKey: "money") >= 150 {
                loadSc3(prod: 6, id: "Donut")
            }
        }
        else if player7.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player7")
            if str == "owned"{
                activate(player: 7)
                player7Note.removeFromParent()
                player7Note.fontColor = UIColor.green
                player7Note.text = "Activated"
                player7.addChild(player7Note)
                showPowers(player: 7)
            } else if str == "activated" {
                showPowers(player: 7)
            } else if str == nil && defaults.integer(forKey: "money") >= 150 {
                loadSc3(prod: 7, id: "Moustache")
            }
        }
        else if player8.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player8")
            if str == "owned"{
                activate(player: 8)
                player8Note.removeFromParent()
                player8Note.fontColor = UIColor.green
                player8Note.text = "Activated"
                player8.addChild(player8Note)
                showPowers(player: 8)
            } else if str == "activated" {
                showPowers(player: 8)
            } else if str == nil && defaults.integer(forKey: "money") >= 300 {
                loadSc3(prod: 8, id: "Fluff")
            }
        }
        else if player9.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player9")
            if str == "owned"{
                activate(player: 9)
                player9Note.removeFromParent()
                player9Note.fontColor = UIColor.green
                player9Note.text = "Activated"
                player9.addChild(player9Note)
                showPowers(player: 9)
            } else if str == "activated" {
                showPowers(player: 9)
            } else if str == nil && defaults.integer(forKey: "money") >= 300 {
                loadSc3(prod: 9, id: "Radio Tower")
            }
        }
        else if player10.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player10")
            if str == "owned"{
                activate(player: 10)
                player10Note.removeFromParent()
                player10Note.fontColor = UIColor.green
                player10Note.text = "Activated"
                player10.addChild(player10Note)
                showPowers(player: 10)
            } else if str == "activated" {
                showPowers(player: 10)
            } else if str == nil && defaults.integer(forKey: "money") >= 300 {
                loadSc3(prod: 10, id: "Iris")
            }
        }
        else if player11.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player11")
            if str == "owned"{
                activate(player: 11)
                player11Note.removeFromParent()
                player11Note.fontColor = UIColor.green
                player11Note.text = "Activated"
                player11.addChild(player11Note)
                showPowers(player: 11)
            } else if str == "activated" {
                showPowers(player: 11)
            } else if str == nil && defaults.integer(forKey: "money") >= 300 {
                loadSc3(prod: 11, id: "Clock")
            }
        }
        else if player12.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player12")
            if str == "owned"{
                activate(player: 12)
                player12Note.removeFromParent()
                player12Note.fontColor = UIColor.green
                player12Note.text = "Activated"
                player12.addChild(player12Note)
                showPowers(player: 12)
            } else if str == "activated" {
                showPowers(player: 12)
            } else if str == nil && defaults.integer(forKey: "money") >= 300 {
                loadSc3(prod: 12, id: "Yin Yang")
            }
        }
        else if player13.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player13")
            if str == "owned"{
                activate(player: 13)
                player13Note.removeFromParent()
                player13Note.fontColor = UIColor.green
                player13Note.text = "Activated"
                player13.addChild(player13Note)
                showPowers(player: 13)
            } else if str == "activated" {
                showPowers(player: 13)
            } else if str == nil && defaults.integer(forKey: "money") >= 300 {
                loadSc3(prod: 13, id: "Dog")
            }
        }
        else if player14.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player14")
            if str == "owned"{
                activate(player: 14)
                player14Note.removeFromParent()
                player14Note.fontColor = UIColor.green
                player14Note.text = "Activated"
                player14.addChild(player14Note)
                showPowers(player: 14)
            } else if str == "activated" {
                showPowers(player: 14)
            } else if str == nil && defaults.integer(forKey: "money") >= 300 {
                loadSc3(prod: 14, id: "Penny")
            }
        }
        else if player15.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player15")
            if str == "owned"{
                activate(player: 15)
                player15Note.removeFromParent()
                player15Note.fontColor = UIColor.green
                player15Note.text = "Activated"
                player15.addChild(player15Note)
                showPowers(player: 15)
            } else if str == "activated" {
                showPowers(player: 15)
            } else if str == nil && defaults.integer(forKey: "money") >= 300 {
                loadSc3(prod: 15, id: "Fish")
            }
        }
        else if player16.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player16")
            if str == "owned"{
                activate(player: 16)
                player16Note.removeFromParent()
                player16Note.fontColor = UIColor.green
                player16Note.text = "Activated"
                player16.addChild(player16Note)
                showPowers(player: 16)
            } else if str == "activated" {
                showPowers(player: 16)
            } else if str == nil && defaults.integer(forKey: "money") >= 500 {
                loadSc3(prod: 16, id: "Saw Blade")
            }
        }
        else if player17.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player17")
            if str == "owned"{
                activate(player: 17)
                player17Note.removeFromParent()
                player17Note.fontColor = UIColor.green
                player17Note.text = "Activated"
                player17.addChild(player17Note)
                showPowers(player: 17)
            } else if str == "activated" {
                showPowers(player: 17)
            } else if str == nil && defaults.integer(forKey: "money") >= 500 {
                loadSc3(prod: 17, id: "Burger")
            }
        }
        else if player18.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player18")
            if str == "owned"{
                activate(player: 18)
                player18Note.removeFromParent()
                player18Note.fontColor = UIColor.green
                player18Note.text = "Activated"
                player18.addChild(player18Note)
                showPowers(player: 18)
            } else if str == "activated" {
                showPowers(player: 18)
            } else if str == nil && defaults.integer(forKey: "money") >= 500 {
                loadSc3(prod: 18, id: "Bomb")
            }
        }
        else if player19.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player19")
            if str == "owned"{
                activate(player: 19)
                player19Note.removeFromParent()
                player19Note.fontColor = UIColor.green
                player19Note.text = "Activated"
                player19.addChild(player19Note)
                showPowers(player: 19)
            } else if str == "activated" {
                showPowers(player: 19)
            } else if str == nil && defaults.integer(forKey: "money") >= 500 {
                loadSc3(prod: 19, id: "Cookie")
            }
        }
        else if player20.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player20")
            if str == "owned"{
                activate(player: 20)
                player20Note.removeFromParent()
                player20Note.fontColor = UIColor.green
                player20Note.text = "Activated"
                player20.addChild(player20Note)
                showPowers(player: 20)
            } else if str == "activated" {
                showPowers(player: 20)
            } else if str == nil && defaults.integer(forKey: "money") >= 500 {
                loadSc3(prod: 20, id: "Sun")
            }
        }
        else if player21.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player21")
            if str == "owned"{
                activate(player: 21)
                player21Note.removeFromParent()
                player21Note.fontColor = UIColor.green
                player21Note.text = "Activated"
                player21.addChild(player21Note)
                showPowers(player: 21)
            } else if str == "activated" {
                showPowers(player: 21)
            } else if str == nil && defaults.integer(forKey: "money") >= 500 {
                loadSc3(prod: 21, id: "Moon")
            }
        }
        else if player22.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player22")
            if str == "owned"{
                activate(player: 22)
                player22Note.removeFromParent()
                player22Note.fontColor = UIColor.green
                player22Note.text = "Activated"
                player22.addChild(player22Note)
                showPowers(player: 22)
            } else if str == "activated" {
                showPowers(player: 22)
            } else if str == nil && defaults.integer(forKey: "money") >= 500 {
                loadSc3(prod: 22, id: "Octopus")
            }
        }
        else if player23.contains(pos) && scroll == false && Sc1 == true{
            let defaults = UserDefaults.standard
            let str = defaults.string(forKey: "player23")
            if str == "owned"{
                activate(player: 23)
                player23Note.removeFromParent()
                player23Note.fontColor = UIColor.green
                player23Note.text = "Activated"
                player23.addChild(player23Note)
                showPowers(player: 23)
            } else if str == "activated" {
                showPowers(player: 23)
            } else if str == nil && defaults.integer(forKey: "money") >= 500 {
                loadSc3(prod: 23, id: "Tree")
            }
        }
        if lvlSkip.contains(pos) && scroll == false && Sc1 == true {
            let defaults = UserDefaults.standard
            let mon = defaults.integer(forKey: "money")
            if defaults.string(forKey: "item1") == nil {
                if mon >= 150 && defaults.integer(forKey: "lev") < 9 {
                    loadSc3(prod: 24, id: "Level Skip")
                }
            }
        }
        else if extraLife.contains(pos) && scroll == false && Sc1 == true {
            let defaults = UserDefaults.standard
            let mon = defaults.integer(forKey: "money")
            if defaults.string(forKey: "item2") == nil {
                if mon >= 100 {
                    loadSc3(prod: 25, id: "Extra Life")
                }
            } else if defaults.string(forKey: "item2") == "activated" {
                defaults.set("unactivated", forKey: "item2")
                itemNote2.removeFromParent()
                itemNote2.text = "Not Active"
                itemNote2.fontColor = UIColor.red
                self.extraLife.addChild(itemNote2)
            } else if defaults.string(forKey: "item2") == "unactivated" {
                defaults.set("activated", forKey: "item2")
                itemNote2.removeFromParent()
                itemNote2.text = "Activated"
                itemNote2.fontColor = UIColor.green
                self.extraLife.addChild(itemNote2)
            }
        }
        else if slowMo.contains(pos) && scroll == false && Sc1 == true {
            let defaults = UserDefaults.standard
            let mon = defaults.integer(forKey: "money")
            if defaults.string(forKey: "item3") == nil {
                if mon >= 50 {
                    loadSc3(prod: 26, id: "Slow Motion Game")
                }
            } else if defaults.string(forKey: "item3") == "activated" {
                defaults.set("unactivated", forKey: "item3")
                itemNote3.removeFromParent()
                itemNote3.text = "Not Active"
                itemNote3.fontColor = UIColor.red
                self.slowMo.addChild(itemNote3)
            } else if defaults.string(forKey: "item3") == "unactivated" {
                defaults.set("activated", forKey: "item3")
                itemNote3.removeFromParent()
                itemNote3.text = "Activated"
                itemNote3.fontColor = UIColor.green
                self.slowMo.addChild(itemNote3)
            }
        }
        else if shrink.contains(pos) && scroll == false && Sc1 == true {
            let defaults = UserDefaults.standard
            let mon = defaults.integer(forKey: "money")
            if defaults.string(forKey: "item4") == nil {
                if mon >= 50 {
                    loadSc3(prod: 27, id: "Shrink Potion")
                }
            } else if defaults.string(forKey: "item4") == "activated" {
                defaults.set("unactivated", forKey: "item4")
                itemNote4.removeFromParent()
                itemNote4.text = "Not Active"
                itemNote4.fontColor = UIColor.red
                self.shrink.addChild(itemNote4)
            } else if defaults.string(forKey: "item4") == "unactivated" {
                defaults.set("activated", forKey: "item4")
                itemNote4.removeFromParent()
                itemNote4.text = "Activated"
                itemNote4.fontColor = UIColor.green
                self.shrink.addChild(itemNote4)
            }
        }
        else if superSpeed.contains(pos) && scroll == false && Sc1 == true {
            let defaults = UserDefaults.standard
            let mon = defaults.integer(forKey: "money")
            if defaults.string(forKey: "item5") == nil {
                if mon >= 50 {
                    loadSc3(prod: 28, id: "Super Super")
                }
            } else if defaults.string(forKey: "item5") == "activated" {
                defaults.set("unactivated", forKey: "item5")
                itemNote5.removeFromParent()
                itemNote5.text = "Not Active"
                itemNote5.fontColor = UIColor.red
                self.superSpeed.addChild(itemNote5)
            } else if defaults.string(forKey: "item5") == "unactivated" {
                defaults.set("activated", forKey: "item5")
                itemNote5.removeFromParent()
                itemNote5.text = "Activated"
                itemNote5.fontColor = UIColor.green
                self.superSpeed.addChild(itemNote5)
            }
        }
        else if fullMove.contains(pos) && scroll == false && Sc1 == true {
            let defaults = UserDefaults.standard
            let mon = defaults.integer(forKey: "money")
            if defaults.string(forKey: "item6") == nil {
                if mon >= 25 {
                    loadSc3(prod: 29, id: "Level Skip")
                }
            } else if defaults.string(forKey: "item6") == "activated" {
                defaults.set("unactivated", forKey: "item6")
                itemNote6.removeFromParent()
                itemNote6.text = "Not Active"
                itemNote6.fontColor = UIColor.red
                self.fullMove.addChild(itemNote6)
            } else if defaults.string(forKey: "item6") == "unactivated" {
                defaults.set("activated", forKey: "item6")
                itemNote6.removeFromParent()
                itemNote6.text = "Activated"
                itemNote6.fontColor = UIColor.green
                self.fullMove.addChild(itemNote6)
            }
        }
        if leastSkulls.contains(pos){
            cameraNode.removeAllActions()
            loadSc3(prod: 30, id: "Stack Of Skulls")
        }
        else if someSkulls.contains(pos){
            cameraNode.removeAllActions()
            loadSc3(prod: 31, id: "Pile Of Skulls")
        }
        else if mostSkulls.contains(pos){
            cameraNode.removeAllActions()
            loadSc3(prod: 32, id: "Oodles Of Skulls")
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        powerNote.removeFromSuperview()
        abilityNote.removeFromSuperview()
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchesMoved(toPoint: t.location(in: self)) }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
}
