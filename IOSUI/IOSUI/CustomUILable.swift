//
//  CustomUILable.swift
//  IOSUI
//  自定义UILabel 文本标签样式
//  Created by Rocky on 2018/6/21.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit

class CustomUILable: UILabel {

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context!.setTextDrawingMode(CGTextDrawingMode.stroke)//设置画笔样式
        context?.setLineWidth(2)//设置瞄边宽度
        context?.setLineJoin(CGLineJoin.round)//设置顶点为圆形方式
        self.textColor = UIColor.white
        super.drawText(in: rect)
        context?.setTextDrawingMode(CGTextDrawingMode.fill)//设置文字填充模式
        self.textColor = UIColor.black//设置字体颜色
        super.drawText(in: rect)
    }
}
