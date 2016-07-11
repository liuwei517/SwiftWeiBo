//
//  MainViewController.swift
//  swift新浪微博
//
//  Created by GG on 16/7/3.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let vc = HomeTableViewController()
        
        vc.title = "首页"
        
        
        /*
         
         tabBar.tintColor:tabbar字体颜色
         tabBar.bartintColor:tabbar的背景颜色
         
         */
 
        self.tabBar.tintColor = UIColor.orangeColor();
        
        self .addVC()
        
        
    }
    
    
    let btn = UIButton(type: .Custom)
    
    private func addMidBtn(){
        
        
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
        
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState:.Highlighted)
        
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
        
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: .Highlighted)
    
        let screenW = UIScreen.mainScreen().bounds.size.width
        
        
        let btnW = screenW / CGFloat((self.viewControllers?.count)!)
        
        
        let btnH:CGFloat = 49
        
        
        let btnX:CGFloat = 2 * btnW
        
        let btnY:CGFloat = 0
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH)
        
        self.tabBar.addSubview(btn)
        
        btn.addTarget(self, action: #selector(MainViewController.clickBtn), forControlEvents: .TouchUpInside)
        
        
        
    }
    
    func clickBtn()  {
        
        print("点击了加号")
        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.addMidBtn()
        
        
    }
    
    
    
    private func addVC(){
        self.addTabBarChildrenVC("HomeTableViewController",title:"首页",imageName:"tabbar_home")
        
        self.addTabBarChildrenVC("MessageTableViewController", title: "消息", imageName: "tabbar_message_center")
        
        self.addTabBarChildrenVC("NewiewViewController", title: "", imageName: "")
        self.self.self.addTabBarChildrenVC("DiscoverTableViewController", title: "发现", imageName: "tabbar_discover")
        
        self.addTabBarChildrenVC("ProfileTableViewController", title: "我", imageName: "tabbar_profile")
        
    }

    
    
    private func addTabBarChildrenVC(ClassName:String,title:String,imageName:String){
        
        /*
         * 将字符串类名转化为类,工程名称.字符串
         */

        //1.动态获取命名空间:用来区分完全相同的类，项目名字区分
        
        let namespace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as!String
        
        print(namespace)
        
        
        // 2.拼接类名：命名空间+ . + 类名
        let ClassName:AnyClass = NSClassFromString(namespace + "." + ClassName)!
        
        //3.指定ClassName是一个控制器类
        
        let claVC = ClassName as! UIViewController.Type
        
        //4.用一个转化成控制器的类创建一个对象
        let vc = claVC.init()
        
        vc.title = title
    
        vc.tabBarItem.image = UIImage(named: imageName)
        
        vc.tabBarItem.selectedImage = UIImage(named:imageName +  "_highlighted")
        
        let nav = UINavigationController(rootViewController: vc)
        
        self.addChildViewController(nav)
        
        
    }
    
}



