//
//  CustomView.swift
//  Swift微博
//
//  Created by 赵子龙 on 16/7/5.
//  Copyright © 2016年 赵子龙. All rights reserved.
//

import UIKit

class CustomView: UIView {

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        //添加试图
        self.addSubview(self.maskBGView)
        self.addSubview(self.circleView)
        self.addSubview(self.noLoginLabel)
        self.addSubview(self.iconView)
        //布局子试图
        
        self.addLayout()
        
    }
    
    func setNologinIsHome(isHome:Bool,imageName:String,text:String)  {
        
        self.circleView.hidden = !isHome
        
        self.iconView.image = UIImage(named: imageName)
        
        self.noLoginLabel.text = text
        
        
        if isHome == true {
            
            self.starAnimation()
            
        }
        
    }
    
    func starAnimation() {
        
        // 创建一个核心动画对象
        
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        //设置动画结束
        
        animation.toValue = 2 * M_PI
        
        animation.duration = 20
        
        animation.repeatCount = MAXFLOAT
        
        // 动画结束后是否移除
        animation.removedOnCompletion = false
        
        //添加到视图的layer层次
        
        self.circleView.layer.addAnimation(animation, forKey: nil)
        
        
    }
    
    
    
    
    
    // 添加约束
    private func addLayout() {
    
        self.maskBGView.snp_makeConstraints{
            
            (make)in make.edges.equalTo(self).inset(0)
            
            
            
        }
        
        self.circleView.snp_makeConstraints{
            
            (make)in make.center.equalTo(self)
            
            
        }
        
        
        self.noLoginLabel.snp_makeConstraints { (make) in
            
            make.width.equalTo(244)
            
            make.top.equalTo(self.circleView.snp_bottom).offset(10)
            
            make.centerX.equalTo(circleView.snp_centerX)
            
            
        }
        
        self.iconView.snp_makeConstraints { (make) in
            
            
            make.center.equalTo(self)
            
            
        }
        
        
        
    }
    
    // 如果父类中有required构造方法，子类一旦重写构造方法，都必须实现父类的required修饰的方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //MARK:懒加载创建试图
   
    // 背景
    private lazy var maskBGView:UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "visitordiscover_feed_mask_smallicon")
        

        return imageView
        
        
        
    }()
    
    
    // 圈图
    
    private lazy var circleView:UIImageView = {
    
    
        let imageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        
    
    return imageView
    
    
    }()
    
    // 提示语
    
    private lazy var noLoginLabel:UILabel = {
    
        let label = UILabel()
        
        
        label.font = UIFont.systemFontOfSize(17)
        
    
        label.textColor = UIColor.darkTextColor()
        
        label.text = "wodememdahjkjhk.ghjfg,j['fgk[pgkhfgjhfgjfgo[jhfgjk[fgj[gk"
    
    
        label.numberOfLines = 0
        
        return label
        
    
    }()
    
    // 模块的icon图标
    
    private lazy var iconView: UIImageView = {
    
    
    
        let imageView = UIImageView(image:UIImage(named: "visitordiscover_feed_image_house"))
        
    
    
    return imageView
    
    
    }()
    
    
    
    
    
  
}







