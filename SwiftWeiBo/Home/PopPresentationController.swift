//
//  PopPresentationController.swift
//  Swift微博
//
//  Created by 赵子龙 on 16/7/6.
//  Copyright © 2016年 赵子龙. All rights reserved.
//

import UIKit

class PopPresentationController: UIPresentationController {

    var poperframe:CGRect?
    
    //试图将要显示时调用
    override func containerViewWillLayoutSubviews() {
        
        //遮罩
        
        let view = UIView()
        
        view.backgroundColor = UIColor.blackColor()
        
        view.alpha = 0.3
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(PopPresentationController.clickmaskView))
        
        
        view.frame = UIScreen.mainScreen().bounds
        
        //self.containerView:容器试图，放上遮罩
        self.containerView?.insertSubview(view, atIndex: 0)
        
        view.addGestureRecognizer(tap)
        
        //展示出来的的控制器
        self.presentedView()?.frame = poperframe!
        
        
    }
    
    func clickmaskView() {
        
        
        print("点击了遮罩")
        
        //找到弹出的控制器，dismiss回去
        self.presentedViewController.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    
    

    
}
