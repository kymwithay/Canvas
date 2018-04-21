//
//  CanvasViewController.swift
//  Canvas
//
//  Created by Kymberlee Hill on 4/21/18.
//  Copyright © 2018 Kymberlee Hill. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {
    
    var trayOriginalCenter: CGPoint!
    var newlyCreatedFace: UIImageView!
    var newlyCreatedFaceOriginalCenter: CGPoint!
    
    //Two new variables to store the tray's position when it's "up" and "down" as well as a variable for the offset amount that the tray will move down
    var trayDownOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    
    @IBOutlet weak var trayView: UIView!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //Assign values to the trayDownOffset, trayUp and trayDown variables in viewDidLoad(). The trayDownOffset will dictate how much the tray moves down. 140 worked for my tray, but you will likely have to adjust this value to accommodate the specific size of your tray.
        trayDownOffset = 140
        trayUp = trayView.center
        trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        //  access the translation parameter of the UIPanGestureRecocognizer and store it in a constant.
        _ = sender.translation(in: view)
        
        // Get the velocity of the pan gesture recognizer
        var velocity = sender.velocity(in: view)
        
        if sender.state == .began {
            self.trayOriginalCenter = trayView.center
            
            print("Gesture began")
        } else if sender.state == .changed {
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            
            print("Gesture is changing")
        } else if sender.state == .ended {
            if velocity.y > 0 {
                UIView.animate(withDuration: 0.3) {
                    self.trayView.center = self.trayDown
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.trayView.center = self.trayUp
                }
            }
            
            
            print("Gesture ended")
        }
        
    }
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
