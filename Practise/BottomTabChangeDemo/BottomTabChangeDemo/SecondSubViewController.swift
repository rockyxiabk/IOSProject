//
//  SecondSubViewController.swift
//  BottomTabChangeDemo
//
//  Created by 夏佰奎 on 2018/6/14.
//  Copyright © 2018年 夏佰奎. All rights reserved.
//

import UIKit

class SecondSubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Second Page"
        self.tabBarItem.image = UIImage(named: "icon_fight_on")
        self.view.backgroundColor = UIColor.green
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
