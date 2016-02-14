//
//  ViewController.swift
//  Drag Test
//
//  Created by hendri on 2/10/2014.
//  Copyright (c) 2014 hendri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var img: UIImageView!
    
    @IBAction func handleDrag(draggy: UIPanGestureRecognizer){
        
        //get location of image:
        let loc = draggy.translationInView(self.view)
        
        //add location of image to location of tap
        let offsetX = draggy.view!.center.x + loc.x
        let offsetY = draggy.view!.center.y + loc.y
        
        img.center = CGPointMake(offsetX, offsetY)
        
        draggy.setTranslation(CGPointZero, inView: self.view)//reset the translation
        
        print(draggy.velocityInView(self.view))
//        println(self.view)
        print(draggy.state)
        
        
        if draggy.state == .Ended{
            print("end")
//            draggy.view!.center.x = 100
            UIView.animateWithDuration(0.3,
                delay: 0,
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {
                    draggy.view!.center.x = 0 + (draggy.view?.frame.width)!/2
                },
                completion: nil)
        }
        
        
    }


}

