//
//  MenuViewController.swift
//  Swift微博
//
//  Created by 赵子龙 on 16/7/6.
//  Copyright © 2016年 赵子龙. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


   self.view.backgroundColor = UIColor.grayColor()
      
      self.view.backgroundColor = UIColor.clearColor()
        
       self.laYoutUI()
        
        
        
    }

    
    func laYoutUI() {
        
        
        //背景试图
        
        let imageView = UIImageView()
        //拉伸图片(上下拉伸)
        var image = UIImage(named: "popover_background")
        
        image = image?.resizableImageWithCapInsets(UIEdgeInsetsMake(image!.size.height/2, 0, image!.size.height/2, 0), resizingMode: .Stretch)
        
        imageView.image = image
        
        self.view.addSubview(imageView)
        
        
        imageView.snp_makeConstraints { (make) in
            
            make.edges.equalTo(self.view).inset(0)
    
            
        }
        
        let tableView = UITableView(frame: CGRectMake(0, 0, 0, 0), style: .Plain)
        
        self.view.addSubview(tableView)
        
        tableView.snp_makeConstraints { (make) in
            
            make.edges.equalTo(self.view).inset(20)
            
            
        }
        
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
