//
//  ViewController.swift
//  SliderController
//
//  Created by ABS on 16/4/7.
//  Copyright © 2016年 abs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let screenWidth:CGFloat = UIScreen.mainScreen().bounds.width
    let screenHeight:CGFloat = UIScreen.mainScreen().bounds.height
    
    let sliderViewController:SliderViewController = SliderViewController()
    var sliderView:UIView?
    var isSliderVisiable:Bool = false
    
    var tapHandle:UITapGestureRecognizer? = nil
    
    var snapView:UIView?
    
    let hitView:UIView = HitView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "MainViewController"
        self.sliderView = self.sliderViewController.view
        
        self.sliderView!.frame = CGRect(origin: CGPoint(x: screenWidth, y: 0), size: CGSize(width: screenWidth, height: screenHeight))
        self.hitView.userInteractionEnabled = true
//        self.hitView.backgroundColor = UIColor.blackColor()
        self.hitView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.01);
        self.view = self.hitView
//        self.view.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(self.sliderView!)
        
        let barButtonItem:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(ViewController.callingOutSliderViewController))
        self.navigationItem.rightBarButtonItem = barButtonItem
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func callingOutSliderViewController() {
        
        if !isSliderVisiable {
            var mainFrame:CGRect = self.view.frame
            mainFrame.origin.x = -0.6 * screenWidth
            var navFrame:CGRect = (self.navigationController?.navigationBar.frame)!
            navFrame.origin.x = -0.6 * screenWidth
            UIView.animateWithDuration(0.5, animations: {
                self.view.frame = mainFrame
                self.navigationController?.navigationBar.frame = navFrame
            }, completion: { (finished) in
                self.tapHandle = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapHandleAction))
                self.hitView.addGestureRecognizer(self.tapHandle!)
            })
        } else {
            var mainFrame:CGRect = self.view.frame
            mainFrame.origin.x = 0
            var navFrame:CGRect = (self.navigationController?.navigationBar.frame)!
            navFrame.origin.x = 0
            UIView.animateWithDuration(0.5, animations: {
                self.view.frame = mainFrame
                self.navigationController?.navigationBar.frame = navFrame
            }, completion: { (finished) in
                self.hitView.removeGestureRecognizer(self.tapHandle!)
                self.tapHandle = nil
            })
        }
        isSliderVisiable = !isSliderVisiable
 
        /*
        if !isSliderVisiable {
            
            self.snapView = self.view.snapshotViewAfterScreenUpdates(false)
            self.snapView!.frame = self.view.frame
            self.view.addSubview(self.snapView!)
            
            var mainFrame:CGRect = self.view.frame
            mainFrame.origin.x = -0.6 * screenWidth
            var navFrame:CGRect = (self.navigationController?.navigationBar.frame)!
            navFrame.origin.x = -0.6 * screenWidth
            
            var sliderFrame = self.sliderView!.frame
            sliderFrame.origin.x -= 0.6 * screenWidth
            
            UIView.animateWithDuration(0.5, animations: {
                self.snapView!.frame = mainFrame
                self.navigationController?.navigationBar.frame = navFrame
                self.sliderView!.frame = sliderFrame
                }, completion: { (finished) in
                    self.tapHandle = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapHandleAction))
                    self.snapView!.addGestureRecognizer(self.tapHandle!)
                    print(self.view.frame)
            })
        } else {
            self.snapView!.removeGestureRecognizer(self.tapHandle!)
            self.tapHandle = nil
            
            var mainFrame:CGRect = self.snapView!.frame
            mainFrame.origin.x = 0
            var navFrame:CGRect = (self.navigationController?.navigationBar.frame)!
            navFrame.origin.x = 0
            
            var sliderFrame = self.sliderView!.frame
            sliderFrame.origin.x = screenWidth
            
            UIView.animateWithDuration(0.5, animations: {
                self.snapView!.frame = mainFrame
                self.navigationController?.navigationBar.frame = navFrame
                self.sliderView!.frame = sliderFrame
                }, completion: { (finished) in
                    self.snapView?.removeFromSuperview()
                    self.snapView = nil
            })
        }
        isSliderVisiable = !isSliderVisiable
         */
    }
    
    func tapHandleAction() {
        print("tap");
        self.callingOutSliderViewController()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("main touchesBegan")
    }
    
    
    
}

