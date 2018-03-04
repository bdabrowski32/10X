//
//  ButtonNode.swift
//  Bowl Runner 2
//
//  Created by BDabrowski on 2/28/17.
//  Copyright © 2017 Broski Games. All rights reserved.
//

import Foundation
import SpriteKit

class ButtonNode: SKSpriteNode, EventListenerNode, InteractiveNode {
    
    var buttonAnimation: SKAction!
    var currentButtonAnimation: SKAction?
    let notification = UINotificationFeedbackGenerator()
    
    
    
    let soundBytes = [
        SKAction.playSoundFileNamed("10x.m4a", waitForCompletion: false),
        SKAction.playSoundFileNamed("average_is_a_failing_formula.m4a", waitForCompletion: false),
        SKAction.playSoundFileNamed("be_great.m4a", waitForCompletion: false),
        SKAction.playSoundFileNamed("better_than_everyone.m4a", waitForCompletion: true),
        SKAction.playSoundFileNamed("dont_be_a_dummy.m4a", waitForCompletion: true),
        SKAction.playSoundFileNamed("dont_bitch_out.m4a", waitForCompletion: true),
        SKAction.playSoundFileNamed("every_problem_you_have.m4a", waitForCompletion: true),
        SKAction.playSoundFileNamed("feed_the_beast.m4a", waitForCompletion: true),
        SKAction.playSoundFileNamed("get_your_money_right.m4a", waitForCompletion: true),
        SKAction.playSoundFileNamed("grown_up_money.m4a", waitForCompletion: true),
        SKAction.playSoundFileNamed("how_far_you_have_come.m4a", waitForCompletion: true),
        SKAction.playSoundFileNamed("keep_your_attention_on_goals.m4a", waitForCompletion: true),
        SKAction.playSoundFileNamed("make_money_or_make_excuses.m4a", waitForCompletion: true),
        SKAction.playSoundFileNamed("no_excuses.m4a", waitForCompletion: true),
        SKAction.playSoundFileNamed("pay_the_price_today.m4a", waitForCompletion: true),
        SKAction.playSoundFileNamed("success_is_your_duty.m4a", waitForCompletion: true),
        SKAction.playSoundFileNamed("they_hatin_on_you.m4a", waitForCompletion: true),
        SKAction.playSoundFileNamed("tired_of_baby_money.m4a", waitForCompletion: true),
        SKAction.playSoundFileNamed("whose_got_my_money.m4a", waitForCompletion: true),
        SKAction.playSoundFileNamed("you_aint_got_a_problem.m4a", waitForCompletion: true),
    ]
    
    var soundIndex: Int = -1
    
    func didMoveToScene() {
        print("button added to scene")
        
        isUserInteractionEnabled = true
    }
    
    func interact() {
        print("play sound")
        //clickWait()
        playNextSound()
        runButtonAnimation(buttonAnimation)
        isUserInteractionEnabled = true
    }
    
    func clickWait() {
        let click = SKAction.playSoundFileNamed("click.wav", waitForCompletion: true)
        let wait = SKAction.wait(forDuration: 0.7)
        let sequence = SKAction.sequence([click, wait])
        run(sequence)
        notification.notificationOccurred(.success)
        
    }
    
    func playCurrentSound() -> Bool {
        
        switch soundIndex {
            
            case 1 : run(soundBytes[1])
            case 2 : run(soundBytes[2])
            case 3 : run(soundBytes[3])
            case 4 : run(soundBytes[4])
            case 5 : run(soundBytes[5])
            case 6 : run(soundBytes[6])
            case 7 : run(soundBytes[7])
            case 8 : run(soundBytes[8])
            case 9 : run(soundBytes[9])
            case 10 : run(soundBytes[10])
            case 11 : run(soundBytes[11])
            case 12 : run(soundBytes[12])
            case 13 : run(soundBytes[13])
            case 14 : run(soundBytes[14])
            case 15 : run(soundBytes[15])
            case 16 : run(soundBytes[16])
            case 17 : run(soundBytes[17])
            case 18 : run(soundBytes[18])
            case 19 : run(soundBytes[19])
            default: run(soundBytes[0])
            
        }
        
        return true
    }

    
    
    func playNextSound() {
        var soundPlayed = false
        repeat {
            soundIndex += 1
            if soundIndex > soundBytes.count {
                soundIndex = 1
            }
            //clickWait()
            soundPlayed = playCurrentSound()
        } while !soundPlayed
    }
    
    func setupAnimationWithPrefix(_ prefix: String, start: Int, end: Int, timePerFrame: TimeInterval) -> SKAction {
        var textures = [SKTexture]()
        for i in start...end {
            textures.append(SKTexture(imageNamed: "\(prefix)\(i)"))
        }
        return SKAction.animate(with: textures, timePerFrame: timePerFrame)
    }
    
    func runButtonAnimation(_ animation: SKAction) {
        if currentButtonAnimation == nil || currentButtonAnimation! != animation {
            removeAction(forKey: "buttonAnimation")
            run(animation, withKey: "buttonAnimation")
            currentButtonAnimation = animation
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        clickWait()
        buttonAnimation = setupAnimationWithPrefix("tenx-button", start: 1, end: 2, timePerFrame: 0.2)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        interact()
        print(soundIndex)
    }
}
