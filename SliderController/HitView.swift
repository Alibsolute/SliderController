//
//  HitView.swift
//  SliderController
//
//  Created by ABS on 16/4/7.
//  Copyright © 2016年 abs. All rights reserved.
//

import UIKit

class HitView: UIView {

    let screenWidth:CGFloat = UIScreen.mainScreen().bounds.width
    let screenHeight:CGFloat = UIScreen.mainScreen().bounds.height
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
//        let view:UIView? = super.hitTest(point, withEvent: event)
        print("\(point),\(event)")
        if point.x>screenWidth && point.x<screenWidth*1.6 {
            let subViews:[UIView] = self.subviews
            for subView in subViews {
                if subView.tag == 99 {
                    let backView:UIView = subView.subviews[0]
                    if backView.tag == 100 {
                        let buttons:[UIView] = backView.subviews
                        for button in buttons {
                            if button.tag == 101 && point.y < screenHeight/2 {
                                return button
                            } else if button.tag == 102 && point.y > screenHeight/2 {
                                return button
                            }
                        }
                    }
                }
            }
        }
        return self;
    }
    
}
