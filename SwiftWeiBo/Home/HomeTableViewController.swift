//
//  HomeTableViewController.swift
//  swift新浪微博
//
//  Created by GG on 16/7/3.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

//宏定义通知里面你的名字
let kMenuViewShowORhidden = "kMenuViewShowORhidden"


class HomeTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 利用可选链优化拆包
    self.noLoginView?.setNologinIsHome(true, imageName: "visitordiscover_feed_image_house", text: "关注一些人，回这里看看有什么惊喜")
        
    
        self.setBar()
        
    //监听菜单栏的显示与消失
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeTableViewController.change), name: kMenuViewShowORhidden, object: nil)
        
        }
    
    func change()  {
        
        
        let itemBtn = self.navigationItem.titleView as! TitleBtn
        
        itemBtn.selected = !itemBtn.selected
        
        
    }
    
    
    
    
    
        
    func setBar() {
        
        if userlogin == true {
            
            
            //设置用户名按钮
            let btn = TitleBtn(type: .Custom)
            
            btn.setTitleColor(UIColor.darkTextColor(), forState: .Normal)
            
            btn.setTitle("赵子龙", forState: .Normal)
            
            btn.sizeToFit()
            
            btn.addTarget(self, action: #selector(HomeTableViewController.clickBtn(_:)), forControlEvents: .TouchUpInside)
            
            self.navigationItem.titleView = btn
            
            //设置两侧的barbuttonItem
            self.navigationItem.leftBarButtonItem = UIBarButtonItem().customBarButton(self, selector: #selector(HomeTableViewController.homeclickLeft), imageName: "navigationbar_friendattention")
            
            
            self.navigationItem.rightBarButtonItem = UIBarButtonItem().customBarButton(self, selector: #selector(HomeTableViewController.homeclickRight), imageName: "navigationbar_pop")
            
        
    }
    
       
                    
    
    }
 
    func homeclickLeft()  {
        
        print("点击了左侧")
        

        
    }
    
    func homeclickRight()   {
        
        print("点击了右侧")
        
        //找到storyBoard
        let sb = UIStoryboard(name: "myStoryboard", bundle: nil)
        
        //选择要加载的控制器
        
        //instantiateInitialViewController 找到storyboard中左边带箭头的控制器
        
        //instantiateViewControllerWithIdentifier在storyBoard根据标识符找到相应的控制器
        
        let QRCodeVC = sb.instantiateInitialViewController()
        
        self.presentViewController(QRCodeVC!, animated: true, completion: nil)
        
        
    }
    
    

    func clickBtn(btn:UIButton)  {

        
        // btn.selected = !btn.selected
        
        let menuVC = MenuViewController()
        
        //设置模态控制器的展现样式的自定义 // PS: 如果不自定义，模态控制器会将当前控制器给移除，然后显示在window上
        menuVC.modalPresentationStyle = .Custom
        
        //因为在代理方法里面自定义，所以要挂代理
        
        menuVC.transitioningDelegate = poper
        
        
        self.presentViewController(menuVC, animated: true, completion: nil)
        
        
    }
    
    
    
    
    //控制动画和展示样式的对象
    private  var poper:PoperAnimationController = {
    
        let vc = PoperAnimationController()
        
        vc.poperFrame = CGRectMake(100,57 , 200, 250)
        
    return vc
        
    }()
    
    
    deinit{
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    
    
    
}

