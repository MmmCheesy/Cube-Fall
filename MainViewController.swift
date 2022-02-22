//
//  MainViewController.swift
//  Cube Fall
//
//  Created by Alexander Eckert on 10/7/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = MainScene(fileNamed: "MainScene"){
            let skView = self.view as! SKView
            skView.presentScene(scene)
        }

        // Do any additional setup after loading the view.
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    override var shouldAutorotate: Bool {
        return true
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if variables.play == true {
            self.performSegue(withIdentifier: "StartGame", sender: nil)
            variables.play = false
        }
        if variables.shop == true {
            self.performSegue(withIdentifier: "shop", sender: nil)
            variables.shop = false
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
