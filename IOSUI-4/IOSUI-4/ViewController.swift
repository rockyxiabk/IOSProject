//
//  ViewController.swift
//  IOSUI-4
//
//  Created by Rocky on 2018/6/21.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    let weeks = ["星期天","星期一","星期二","星期三","星期四","星期五","星期六"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weeks.count*7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentifier = "reusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: indentifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: indentifier)
        }
        let row = indexPath.row//position
        cell?.textLabel?.text = weeks[(row%7)]
        //设置文本信息
//        cell?.textLabel?.text = "Cell Title Here"
//        cell?.detailTextLabel?.text = "Detail Information Here"
        
        //设置图片
        let image = UIImage(named: "wode_anquan")
        let image1 = UIImage(named: "wode_lishi")
        cell?.imageView?.image = image//默认显示
        cell?.imageView?.highlightedImage = image1//选中显示
        
        //设置单元格背景颜色
        if row == 1 {
            cell?.backgroundColor = UIColor.yellow
        }
        else{
            let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
            let view = UIView(frame: rect)
            view.backgroundColor = UIColor.brown
            cell?.backgroundView = view
        }
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let table = UITableView(frame: view.frame)
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

