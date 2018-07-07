//
//  ViewController.swift
//  UIIOS-6
//  Animation 动画效果
//  Created by Rocky on 2018/6/22.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 80, width: 320, height: 211))
        let image = UIImage(named: "Lion")
        imageView.image = image
        imageView.tag = 1
        self.view.addSubview(imageView)
        
        //设置渐显动画-reveal  入场动画-push
        let animation = CATransition()
        animation.duration = 3//2s
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
//        animation.type = kCATransitionReveal
        animation.type = kCATransitionPush
        imageView.layer.add(animation, forKey: "Push")
//        imageView.layer.add(animation, forKey: "Reveal")
        
        let btn = UIButton(frame: CGRect(x: 50, y: 400, width: 100, height: 40))
        btn.backgroundColor = UIColor.gray
        btn.setTitle("动画块", for: UIControlState())
        btn.addTarget(self, action: #selector(ViewController.btnAction), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
    }
    @objc func btnAction(){
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(.easeIn)//动画方式
        UIView.setAnimationDuration(3)//动画时长
        UIView.setAnimationBeginsFromCurrentState(true)
        let view = self.view.viewWithTag(1)
        //flipFromLeft-翻转动画 curlUp-卷曲动画
        UIView.setAnimationTransition(.flipFromLeft, for: view!, cache: true)
        
        //动画结束事件
        view?.frame = CGRect(x: 0, y: 80, width: 0, height: 0)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStop(#selector(ViewController.animationStop))
        
        UIView.commitAnimations()
    }
    @objc func animationStop(){
        print("animation stop")
        self.view.viewWithTag(1)?.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

