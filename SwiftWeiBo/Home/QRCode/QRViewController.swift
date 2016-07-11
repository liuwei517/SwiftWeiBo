//
//  QRViewController.swift
//  Swift微博
//
//  Created by 赵子龙 on 16/7/7.
//  Copyright © 2016年 赵子龙. All rights reserved.
//

import UIKit
import AVFoundation

class QRViewController: UIViewController {

    
    
    // tabBar的设置
    @IBOutlet weak var CustomTabBar: UITabBar!
    
    // 冲击波试图和顶部的约束
    @IBOutlet weak var scanlineTop: NSLayoutConstraint!
    // scanBGView的高的约束
    @IBOutlet weak var scanBGViewHeight: NSLayoutConstraint!
    // 冲击波试图
    @IBOutlet weak var scanlineView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        
        
        
    // 给分栏设置第一个item默认选中状态
        self.CustomTabBar.selectedItem = self.CustomTabBar.items![0]
        
        
        
    }
    
    //动画要在试图完全显示出来以后再开始
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(true)
        
        self.startAnimation()
        
        
        
    }
    
    // 开始扫描
    
    private func startScan(){
    
    //1.判断是否支持输入设备
        
        if self.session.canAddInput(self.inputDevice) == false {
            
            return
            
        }
        
    //2.判断是否支持输出设备
        
        if self.session.canAddOutput(self.output) == false {
            
            return
            
        }
        
    //3.添加输入设备
        
        self.session.addInput(self.inputDevice)
    
    //4.添加输出设备
        
        self.session.addOutput(self.output)
        
    //5.设置输出设备支持的类型
        
      output.metadataObjectTypes = output.availableMetadataObjectTypes
    
    //6.设置代理用于获取扫描的内容
        output.setMetadataObjectsDelegate(self, queue:dispatch_get_main_queue() )
    //7.添加图层
        self.view.layer.insertSublayer(self.previewLayer, atIndex: 0)
        
    //8.开始扫描
        
        self.session.startRunning()
    
    }
    
    
    
    
    //开始动画
    private func startAnimation(){
    
        
        
        
        
    //首先规定冲击波试图处于扫描试图的上面
    self.scanlineTop.constant = -self.scanBGViewHeight.constant
    //更新约束
    self.view.layoutIfNeeded()
        
    UIView.animateWithDuration(1.5) {
        
        //重复动画
        
        UIView.setAnimationRepeatCount(MAXFLOAT)
        
        
        //设置冲击波试图的终点
        self.scanlineTop.constant = self.scanBGViewHeight.constant
        //更新约束
        self.view.layoutIfNeeded()
        
            
        }
        
    
    
    }
    
    //MARK：----有关扫描的懒加载
    
    //1.获取到扫描回话
    private lazy var session:AVCaptureSession = AVCaptureSession()
    //2. 获取到输入设备
    private lazy var inputDevice:AVCaptureDeviceInput? = {
        
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        
        //模拟器不支持摄像头，
        do{
            
            return try! AVCaptureDeviceInput(device: device)
            
            
        }catch{
            
            print(error)
            return nil
        }
        
    }()
    
    //3.获取到输出设备
    
    private lazy var output:AVCaptureMetadataOutput = AVCaptureMetadataOutput()
    
    
    //4.获取到预览图层
    private lazy var previewLayer:AVCaptureVideoPreviewLayer = {
    
    let player =   AVCaptureVideoPreviewLayer(session:self.session)
        
        player.frame = self.view.frame
        
        //5.设置填充模式
        player.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        return player
        
    }()
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //关闭返回
    @IBAction func colseBtn(sender: UIBarButtonItem) {
        
        

        
    }
    

}

extension QRViewController:UITabBarDelegate,AVCaptureMetadataOutputObjectsDelegate {
    
    
    //点击tabbarItem是调用
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        
        
        self.scanBGViewHeight.constant = item.tag == 0 ? 300 : 300*0.5
        
        self.view.layoutIfNeeded()
        
        //移除掉原来的动画
        self.scanlineView.layer.removeAllAnimations()
        
        //重新开始动画
        self.startAnimation()
        
    }
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        
        
        print(metadataObjects.last)
        
        
    }
    
    
    
}




