//
//  ViewController.swift
//  UIIOS-5
//  UIImageView CoreImage 对图片的处理
//  reated by Rocky on 2018/6/22.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let image = UIImage(named: "iphone_bg")
//        let gray = grayImage(image: image!)
//        let scale = scaleImage(image: gray, newSize: CGSize(width: 200, height: 200))
//
//        let imageView = UIImageView(image: scale)
//        imageView.center = CGPoint(x: 180, y: 300)
//        self.view.addSubview(imageView)

        let imageA = UIImage(named: "iphone_bg")
        let imageViewA = UIImageView(frame: view.frame)
        imageViewA.image = imageA
        self.view.addSubview(imageViewA)
        
        //设置滤镜效果
//        let ciImage = CIImage(image: imageA!)
//        let filter = CIFilter(name: "CIPixellate")//初始化滤镜效果 马赛克
//        filter?.setDefaults()
//        filter?.setValue(ciImage, forKey: kCIInputImageKey)
//        let outImage = filter?.outputImage
//        imageViewA.image = UIImage(ciImage: outImage!)
        
        //设置滤镜效果
//        let ciImage = CIImage(image: imageA!)
//        let color = CIColor(red: 0.8, green: 0.6, blue: 0.4)
//        let filter = CIFilter(name: "CIColorMonochrome")//初始化滤镜 单色调
//        filter?.setValue(color, forKey: kCIInputColorKey)
//        filter?.setValue(1.0, forKey: kCIInputIntensityKey)
//        filter?.setValue(ciImage, forKey: kCIOutputImageKey)
//        let out = filter?.outputImage
//        imageViewA.image = UIImage(ciImage: out!)
        
        //图片模糊效果
        if #available(iOS 8.0, *) {
            //light regular dark
            let blur = UIBlurEffect(style: .prominent)
            let blurView = UIVisualEffectView(effect: blur)
            blurView.frame = view.frame
            blurView.layer.cornerRadius = 0
            blurView.layer.masksToBounds = true
            imageViewA.addSubview(blurView)
        }
        else{
            print("当前版本过低，不支持该效果")
        }
        
        //获取所有滤镜信息
        let build = CIFilter.filterNames(inCategory: kCICategoryBuiltIn)
        for filter1 in build {
            let filterS = CIFilter(name: filter1 as String)
            let attr = filterS!.attributes
            print("[\(String(describing: filterS))]\n")
            print(attr)
            print("--------------------------")
        }
    }
    //按照比例缩放图片，
    func scaleImage(image: UIImage,newSize: CGSize) -> UIImage {
        let imageSize = image.size
        let w = imageSize.width
        let h = imageSize.height
        
        let nw = newSize.width/w
        let nh = newSize.height/h
        let scale = (nw < nh) ? nw : nh
        
        let sW = w * scale
        let sH = h * scale
        let targt = CGSize(width: sW, height: sH)
        
        UIGraphicsBeginImageContext(targt)
        image.draw(in: CGRect(x: 0, y: 0, width: sW, height: sW))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        return newImage!
    }
    //将图片转换为灰度图片
    func grayImage(image:UIImage) -> UIImage {
        let imageSize = image.size
        let width = Int(imageSize.width)
        let height = Int(imageSize.height)
        
        let spaceref = CGColorSpaceCreateDeviceGray()
        let context = CGContext(data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: 0, space: spaceref, bitmapInfo: CGBitmapInfo().rawValue)
        
        let rect = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
        context?.draw(image.cgImage!, in: rect)
        
        let gray = UIImage(cgImage: (context?.makeImage())!)
        return gray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

