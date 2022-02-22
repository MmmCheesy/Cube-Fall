//
//  ShopViewController.swift
//  Cube Fall
//
//  Created by Alexander Eckert on 11/28/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit

class ShopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = ShopScene(fileNamed: "ShopScene") {
            let skview = self.view as! SKView
            print("loading the shoppe")
            skview.presentScene(scene)
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
        if variables.doneShooping == true {
            variables.doneShooping = false
            self.performSegue(withIdentifier: "DoneShooping", sender: nil)
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
