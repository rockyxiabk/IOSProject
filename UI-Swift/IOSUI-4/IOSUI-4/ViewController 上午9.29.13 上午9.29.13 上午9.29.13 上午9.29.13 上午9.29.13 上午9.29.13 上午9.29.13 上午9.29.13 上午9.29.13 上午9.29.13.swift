//
//  ViewController.swift
//  IOSUI-4
//  UITableView 的使用 数据的操作 增加 删除 移动
//  Created by Rocky on 2018/6/21.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var weeks = ["星期天0","星期一0","星期二0","星期三0","星期四0","星期五0","星期六0","星期天1","星期一1","星期二1","星期三1","星期四1","星期五1","星期六1","星期天2","星期一2","星期二2","星期三2","星期四2","星期五2","星期六2","星期天3","星期一3","星期二3","星期三3","星期四3","星期五3","星期六3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let table = UITableView(frame: view.frame)
        table.delegate = self
        table.dataSource = self
        //要插入一条数据到表格中
        table.setEditing(true, animated: true)
        //设置指定位置，然后滚动到屏幕中间
        let indexPath = IndexPath(row: 10, section: 0)
        table.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: true)
        self.view.addSubview(table)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //获得数据源长度
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weeks.count
    }
    
    //填充单元格数据
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentifier = "reusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: indentifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: indentifier)
        }
        let row = indexPath.row//position
        cell?.textLabel?.text = weeks[(row)]
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
    //设置单元格点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == UITableViewCellAccessoryType.none {
            cell?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        else{
            cell?.accessoryType = UITableViewCellAccessoryType.none
        }
    }
    //设置单元格 删除模式-delete 插入模式-insert 拖动模式-none
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.none
    }
    //设置是否可以拖动
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //更新拖动到的位置，修改数据源
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let fromR = sourceIndexPath.row
        let toR = destinationIndexPath.row
        let data = weeks[fromR]
        weeks.remove(at: fromR)//删除当前位置数据
        weeks.insert(data, at: toR)//插入到拖动的位置
    }
    //处理删除事件，更新数据源
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //删除事件
        if editingStyle ==  UITableViewCellEditingStyle.delete{
            let rowNum = indexPath.row
            weeks.remove(at: rowNum)
            let indexP = [indexPath]
            tableView.deleteRows(at: indexP, with: UITableViewRowAnimation.automatic)
        }
        //插入事件
        if editingStyle == UITableViewCellEditingStyle.insert {
            let rownum = indexPath.row
            weeks.insert("New Day", at: rownum)
            let indexN = [indexPath]
            tableView.insertRows(at: indexN, with: UITableViewRowAnimation.bottom)
        }
    }
}

