//
//  SecondSubViewController.swift
//  ViewPushPull
//
//  Created by Rocky on 2018/6/21.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit

var pagenum = 0
var isShowNavi = true
var isShowToolBar = true

class SecondSubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        pagenum += 1//每次创建 加1
        self.title = "Page\(pagenum)"//设置标题文字
        self.view.backgroundColor = UIColor.purple//设置背景颜色
        
        let push = UIButton(frame: CGRect(x: 40, y: 120, width: 240, height: 40))//添加一个按钮
        push.setTitle("Push Page", for: UIControlState())//设置按钮显示的文字
        push.backgroundColor = UIColor.orange//设置
        push.addTarget(self, action: #selector(SecondSubViewController.pushAction), for: UIControlEvents.touchUpInside)
        self.view.addSubview(push)
        let pop = UIButton(frame: CGRect(x: 40, y: 180, width: 240, height: 40))//添加一个按钮
        pop.setTitle("Pop Page", for: UIControlState())//设置按钮显示的文字
        pop.backgroundColor = UIColor.orange//设置
        pop.addTarget(self, action: #selector(SecondSubViewController.popAction), for: UIControlEvents.touchUpInside)
        self.view.addSubview(pop)
        let index = UIButton(frame: CGRect(x: 40, y: 240, width: 240, height: 40))//添加一个按钮
        index.setTitle("Goto Index Page", for: UIControlState())//设置按钮显示的文字
        index.backgroundColor = UIColor.orange//设置
        index.addTarget(self, action: #selector(SecondSubViewController.indexAction), for: UIControlEvents.touchUpInside)
        self.view.addSubview(index)
        let root = UIButton(frame: CGRect(x: 40, y: 300, width: 240, height: 40))//添加一个按钮
        root.setTitle("Root Page", for: UIControlState())//设置按钮显示的文字
        root.backgroundColor = UIColor.orange//设置
        root.addTarget(self, action: #selector(SecondSubViewController.rootAction), for: UIControlEvents.touchUpInside)
        self.view.addSubview(root)
        
        let btnHideNavi = UIButton(frame: CGRect(x: 40, y: 360, width: 240, height: 40))//添加一个按钮
        btnHideNavi.setTitle("Hide Navigation", for: UIControlState())//设置按钮显示的文字
        btnHideNavi.backgroundColor = UIColor.orange//设置
        btnHideNavi.addTarget(self, action: #selector(SecondSubViewController.hideNavigationAction), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnHideNavi)
        let btnHideToolBar = UIButton(frame: CGRect(x: 40, y: 420, width: 240, height: 40))//添加一个按钮
        btnHideToolBar.setTitle("Hide ToolBar", for: UIControlState())//设置按钮显示的文字
        btnHideToolBar.backgroundColor = UIColor.orange//设置
        btnHideToolBar.addTarget(self, action: #selector(SecondSubViewController.toolBarAction), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnHideToolBar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func pushAction(){
        let viewCOntroller = SecondSubViewController()
        self.navigationController?.pushViewController(viewCOntroller, animated: true)
        
    }
    @objc func popAction(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func indexAction(){
        let  viewController = self.navigationController?.viewControllers[2]
        self.navigationController?.popToViewController(viewController!, animated: true)
    }
    @objc func rootAction(){
        self.navigationController?.popToRootViewController(animated: true)
    }

    @objc func hideNavigationAction(){
        if isShowNavi {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
        else{
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
        isShowNavi = !isShowNavi
    }
    @objc func toolBarAction(){
        if isShowToolBar {
            self.navigationController?.setToolbarHidden(true, animated: true)
        }
        else{
            self.navigationController?.setToolbarHidden(false, animated: true)
        }
        isShowToolBar = !isShowToolBar
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
