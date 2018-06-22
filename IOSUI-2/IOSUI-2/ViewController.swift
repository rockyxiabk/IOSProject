//
//  ViewController.swift
//  IOSUI-2
//
//  Created by Rocky on 2018/6/21.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 40, y: 100, width: 100, height: 30))
        label.text = "0"
        label.tag = 1
        self.view.addSubview(label)
        
        let stepper = UIStepper(frame: CGRect(x: 90, y: 100, width: 0, height: 0))
        stepper.stepValue = 1
        stepper.sizeToFit()
        stepper.value = 0
        stepper.minimumValue = 1
        stepper.maximumValue = 10000
        stepper.addTarget(self, action: #selector(ViewController.stepperAction( _ :)), for: UIControlEvents.valueChanged)
        self.view.addSubview(stepper)
        
        let input = UITextField(frame: CGRect(x: 90, y: 150, width: 200, height: 50))
        input.borderStyle = UITextBorderStyle.roundedRect
        input.placeholder = "your name"
        input.autocorrectionType = UITextAutocorrectionType.no
        input.returnKeyType = UIReturnKeyType.done
        input.clearButtonMode = UITextFieldViewMode.whileEditing
        input.keyboardType =  UIKeyboardType.namePhonePad
        input.keyboardAppearance = UIKeyboardAppearance.dark
        input.delegate = self
        self.view.addSubview(input)
        
        let btnAlert = UIButton(frame: CGRect(x: 90, y: 210, width: 150, height: 40))
        btnAlert.setTitle("点击-提示框", for: UIControlState())
        btnAlert.backgroundColor = UIColor.lightGray
        btnAlert.addTarget(self, action: #selector(ViewController.alertAction(_ :)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnAlert)
        
        let dataPicker = UIDatePicker()
        dataPicker.center = CGPoint(x: 180, y: 400)
        dataPicker.tag = 11//biaoshi
        self.view.addSubview(dataPicker)
        let btnData = UIButton(frame: CGRect(x: 90, y: 550, width: 150, height: 40))
        btnData.setTitle("Data", for: UIControlState())
        btnData.backgroundColor = UIColor.lightGray
        btnData.addTarget(self, action: #selector(ViewController.getData(_ :)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnData)
    }
    @objc func getData(_ ui: UIButton){
        let dataPicker = self.view.viewWithTag(11) as? UIDatePicker
        let date = dataPicker?.date
        let dataFormaat = DateFormatter()
        dataFormaat.dateFormat = "yyyy-MM-dd HH:mm"
        let dataTime = dataFormaat.string(from: date!)
        let alert = UIAlertController(title: "当前日期", message: dataTime, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        
        alert.addAction(action)
        
        self.present(alert,animated: true, completion: nil)
    }
    @objc func alertAction( _ ui: UIButton){
        let alert = UIAlertController(title: "choose", message: "选择打开方式", preferredStyle: UIAlertControllerStyle.actionSheet)
        let action = UIAlertAction(title: "相机", style: UIAlertActionStyle.default, handler: {
            (alert :UIAlertAction) in print("点击了相机")
        })
        let action1 = UIAlertAction(title: "相册", style: UIAlertActionStyle.default, handler: {
            (alert: UIAlertAction) in print("点击了相册")
        })
        let cancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
        
        alert.addAction(action)
        alert.addAction(action1)
        alert.addAction(cancel)
        
        self.present(alert, animated: true,completion: nil)
    }
    
    func textFieldShouldReturn( _ text: UITextField) -> Bool {
        text.resignFirstResponder()
        return true
    }
    
    @objc func stepperAction(_ step : UIStepper){
        let value = step.value
        let label = self.view.viewWithTag(1) as! UILabel
        label.text = "\(Int(value))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

