//
//  UIBarButtonItem+Categary.swift
//  Swift微博
//
//  Created by 赵子龙 on 16/7/6.
//  Copyright © 2016年 赵子龙. All rights reserved.
//

import Foundation
import UIKit

// 给UIBarButtonItem添加一个类目
extension UIBarButtonItem{

    
    func customBarButton(target:AnyObject,selector:Selector,imageName:String) -> UIBarButtonItem {
        
        let Btn = UIButton(type: .Custom)
        
        Btn.setBackgroundImage(UIImage(named: imageName), forState: .Normal)
        
        Btn.setBackgroundImage(UIImage(named: imageName + "_highlighted"), forState: .Highlighted)
        
        Btn.frame = CGRectMake(0, 0, 40, 40)
    
        
        Btn.addTarget(target, action: selector, forControlEvents: .TouchUpInside)
        
        return UIBarButtonItem(customView:Btn)
        
        
    }
    
    
    
    


}