//
//  ViewController.swift
//  IOSUI
//
//  Created by Rocky on 2018/6/21.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn1 = UIButton(type: UIButtonType.roundedRect)
        btn1.frame = CGRect(x: 80, y: 100, width: 240, height: 40)
        self.view.addSubview(btn1)
        
        let btn2 = UIButton(type: UIButtonType.roundedRect)
        btn2.frame = CGRect(x: 80, y: 150, width: 240, height: 40)
        btn2.backgroundColor = UIColor.purple
        btn2.tintColor = UIColor.yellow
        btn2.setTitle("tap Me", for: UIControlState())
        btn2.addTarget(self, action: #selector(ViewController.btnClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn2)
        
        let btn3 = UIButton(type: UIButtonType.roundedRect)
        btn3.frame = CGRect(x: 80, y: 200, width: 240, height: 40)
        btn3.backgroundColor = UIColor.purple
        btn3.tintColor = UIColor.yellow
        btn3.setTitle("tap Me", for: UIControlState())
        btn3.layer.masksToBounds = true
        btn3.layer.borderColor = UIColor.lightGray.cgColor
        btn3.layer.borderWidth = 5
        btn3.layer.cornerRadius = 10
        btn3.addTarget(self, action: #selector(ViewController.btnClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn3)
        
        let btn4 = UIButton(type: UIButtonType.roundedRect)
        btn4.frame = CGRect(x: 80, y: 250, width: 200, height: 50)
        btn4.setBackgroundImage(UIImage(named: "bf_zuozhekuang"), for: UIControlState())
        btn4.setTitle("Image Tap", for: UIControlState())
        btn4.setTitleColor(UIColor.white, for: UIControlState())
        btn4.titleLabel?.font = UIFont(name: "Arial", size: 24)
        btn4.addTarget(self, action: #selector(ViewController.btnClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn4)
        
        let lable = CustomUILable(frame: CGRect(x: 80, y: 300, width: 300, height: 100))
        lable.text = "hello Swift to Ios Developerllo Swift to Ios Developerllo Swift to Ios Developerllo Swift to Ios Developerllo Swift to Ios Developerllo Swift to Ios Developerllo Swift to Ios Developerllo Swift to Ios Developerllo Swift to Ios Developer"
        lable.font = UIFont(name: "Arial", size: 54)//设置字体和大小
        lable.textColor = UIColor.red
        lable.textAlignment = NSTextAlignment.center//文字剧中
        lable.lineBreakMode = NSLineBreakMode.byWordWrapping//自动换行 单词不分割
        lable.numberOfLines = 0//不限制行数
        lable.backgroundColor = UIColor.yellow
        self.view.addSubview(lable)
        
        let switch1 = UISwitch(frame: CGRect(x: 50, y: 50, width: 100, height: 50))
        switch1.setOn(true, animated: true)//设置开关默认打开的
        switch1.addTarget(self, action: #selector(ViewController.switchAction( _ :)), for: UIControlEvents.valueChanged)
        self.view.addSubview(switch1)
    }
    @objc func btnClick(){
        
    }
    @objc func switchAction( _ uiSwitch : UISwitch ){
        var message = "turn on"
        if !uiSwitch.isOn {
            message = "turn off"
        }
    
        let  alert = UIAlertController(title: "提示", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

