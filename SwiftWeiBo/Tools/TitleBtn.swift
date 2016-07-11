//
//  TitleBtn.swift
//  Swift微博
//
//  Created by 赵子龙 on 16/7/5.
//  Copyright © 2016年 赵子龙. All rights reserved.
//

import UIKit

class TitleBtn: UIButton {

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.setImage(UIImage(named: "navigationbar_arrow_down"), forState: .Normal)
        
        self.setImage(UIImage(named: "navigationbar_arrow_up"), forState: .Selected)
        
       
        
        
    }
    
    //将button设置为左字右图
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.titleLabel?.frame.origin.x = 0
        
        self.imageView?.frame.origin.x = (self.titleLabel?.frame.size.width)!
        
        
        
    }
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
