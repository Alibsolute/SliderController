//
//  SliderViewController.swift
//  SliderController
//
//  Created by ABS on 16/4/7.
//  Copyright © 2016年 abs. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("Slider touchesBegan")
    }
    
    @IBAction func buttonAction1(sender: UIButton) {
        print("buttonAction1")
    }
    
    @IBAction func buttonAction2(sender: UIButton) {
        print("buttonAction2")
    }
    
}
