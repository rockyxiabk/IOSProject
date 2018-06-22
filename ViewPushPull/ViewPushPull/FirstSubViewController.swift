//
//  FirstSubViewController.swift
//  ViewPushPull
//
//  Created by Rocky on 2018/6/21.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit

class FirstSubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "First Page"
        self.view.backgroundColor = UIColor.brown
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.refresh, target: self, action: #selector(FirstSubViewController.refreshAction))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.plain, target: self, action: #selector(FirstSubViewController.nextPage))
        let lable = UILabel(frame: CGRect(x: 0, y: 0, width: 180, height: 30))
        lable.text = "Happay Day"
        lable.textAlignment = NSTextAlignment.center
        self.navigationItem.titleView = lable
    }

    @objc func nextPage(){
        let view  = SecondSubViewController()
        self.navigationController?.pushViewController(view, animated: true)
    }
    @objc func refreshAction(){
        let alert = UIAlertController(title: "tips", message: "test", preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    //重写第一个视图的方法
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //显示底部导航栏
        self.navigationController?.setToolbarHidden(false, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
