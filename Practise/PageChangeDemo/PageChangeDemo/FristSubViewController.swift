//
//  FristSubViewController.swift
//  PageChangeDemo
//
//  Created by 夏佰奎 on 2018/6/14.
//  Copyright © 2018年 夏佰奎. All rights reserved.
//

import UIKit

class FristSubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "First Page"
        self.view.backgroundColor = UIColor.brown
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.plain, target: self, action: #selector(FristSubViewController.nextPage))
    }
    @objc func nextPage(){
        let view  = SecondSubViewController()
        self.navigationController?.pushViewController(view, animated: true)
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
