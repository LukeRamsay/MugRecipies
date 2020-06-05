//
//  ViewController.swift
//  MugRecipies
//
//  Created by Luke Ramsay on 2020/05/18.
//  Copyright © 2020 Luke Ramsay. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var hideButton: UIButton!
    @IBOutlet weak var summonButton: UIButton!
    @IBOutlet weak var textPannel: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        //Custom
        
        boxAnchor.actions.showInterface.onAction = handleShowInterface(_:)
    }
    
    //MARK: - Custom Behaviour
    
    func handleShowInterface(_ entity: Entity?){
        guard entity != nil else {return}
        
        textPannel.isHidden = false
        showButton.isHidden = false
        hideButton.isHidden = false
        summonButton.isHidden = false
    }
    
    @IBAction func OnShowMenu(_ sender: Any) {
        if let sceneAnchor = arView.scene.anchors[0] as? Experience.Box {
        
        sceneAnchor.notifications.showMenu.post()
        }
    }
    
    @IBAction func OnHideMenu(_ sender: Any) {
        if let sceneAnchor = arView.scene.anchors[0] as? Experience.Box {
        
        sceneAnchor.notifications.hideMenu.post()
        }
    }
    
    @IBAction func OnShowChef(_ sender: Any) {
        if let sceneAnchor = arView.scene.anchors[0] as? Experience.Box {
        
        sceneAnchor.notifications.summonChef.post()
        }
    }
}
