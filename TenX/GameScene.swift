//
//  GameScene.swift
//  Bowl Runner 2
//
//  Created by BDabrowski on 2/19/17.
//  Copyright © 2017 Broski Games. All rights reserved.
//

import SpriteKit
import GameplayKit


protocol EventListenerNode {
    func didMoveToScene()
}

protocol InteractiveNode {
    func interact()
}



class GameScene: SKScene, InteractiveNode, SKPhysicsContactDelegate {

    
    var buttonNode: ButtonNode!
    //var buttonAnimation: SKAction!
    //var currentButtonAnimation: SKAction?
    
    override func didMove(to view: SKView) {
        //Calculate playable margin
        
        let maxAspectRatio: CGFloat = 9.0/16.0
        let maxAspectRatioHeight = size.width / maxAspectRatio
        let playableMargin: CGFloat = (size.height - maxAspectRatioHeight)/2
        
        let playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: size.height-playableMargin*2)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: playableRect)
        physicsWorld.contactDelegate = self
        
        enumerateChildNodes(withName: "//*", using: { node, _ in
            if let EventListenerNode = node as? EventListenerNode {
                EventListenerNode.didMoveToScene()
            }
        })
        
        buttonNode = childNode(withName: "//button") as? ButtonNode
        
        
        
        isUserInteractionEnabled = true
    }
    

    
    func interact() {
        isUserInteractionEnabled = false
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("scene touched")
        
    }
}
