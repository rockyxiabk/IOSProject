//
//  ViewController.swift
//  SBox-8
//
//  Created by Rocky on 2018/6/22.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit

/**
 iOS的沙盒机制
 
 iOS应用程序只能对自己创建的文件系统读取文件，这个独立，封闭，安全的空间，叫做沙盒。它一般存放着程序包文件（可执行文件），图片，音频，视频，plist文件，SQLite数据库以及其他文件。
 
 每个应用程序都有自己的独立的存储空间（沙盒）
 
 iOS文件系统
 
 iOS沙盒模型下有四个目录：
 Documents:一般需要持久的数据都放在此目录中，可以在当中添加子文件夹，iTunes备份和恢复的时候，会包括此目录。
 
 Tmp:用于存放临时文件的目录，当应用程序退出运行时，该目录下的文件会被自动清除。
 
 APP:这是应用程序的程序包目录，包括应用程序的本身。由于应用程序必须包括签名，所以在运行时不能对这个目录中的内容进行修改，否则可能会使应用程序无法启动。
 
 Library:其中Library中包含2个目录：
 
 Caches:用于存放应用程序运行时生成的数据，也就是缓存，不会被自动清除，改目录不参与备份
 
 Preferences:存放应用程序的偏好设置，使用NSUserDefault 来存取，会被iTunes备份
 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取ios 文件基本结构
        let homePath = NSHomeDirectory()
        
        print("homePth:\(homePath)")
        let docPath1 = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)//文档目录
        print("docPath1:\(docPath1[0])")
        let docPath2 = NSHomeDirectory() + "/Documents"
        print("docPath2:\(docPath2)")
        
        let libs1 = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)//库目录
        print("libs1:\(libs1[0])")
        let libs2 = NSHomeDirectory() + "/Library"
        print("libs2:\(libs2)")
        
        let cache1 = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)//该应用的缓存文件
        print("cache1:\(cache1[0])")
        let cache2 = NSHomeDirectory() + "/Library/Caches"
        print("cache2:\(cache2)")
        
        let per1 = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.preferencePanesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        print("per1:\(per1[0])")
        let per2 = NSHomeDirectory() + "/Library/PreferencePanes"
        print("per2:\(per2)")
        
        
        let temp1 = NSTemporaryDirectory()//临时目录
        print("temp1:\(temp1)")
        let temp2 = NSHomeDirectory() + "/tmp"
        print("temp2:\(temp2)")
        
        //文件的操作 创建文件夹
        let fileManager = FileManager.default
        let baseUrl = NSHomeDirectory() + "/Documents/test"
        let exist = fileManager.fileExists(atPath: baseUrl)
        if !exist {
            do{
                try fileManager.createDirectory(atPath: baseUrl, withIntermediateDirectories: true, attributes: nil)
                print("created")
            }catch{
            print("error")
            }
        }else{
            print("existed")
        }
        self.saveImage()
        self.writeText()
        self.writeArray()
        self.writeDictionary()
        self.fileBianrary()
        self.copyFile()
        self.moveFile()
        self.listFoler()
        self.removeFolder()
    }
    /**
     homePth:/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1
     docPath1:/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1/Documents
     docPath2:/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1/Documents
     libs1:/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1/Library
     libs2:/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1/Library
     cache1:/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1/Library/Caches
     cache2:/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1/Library/Caches
     per1:/var/mobile/Containers/Data/Application/32652744-9BB8-494C-860D-305BDEFCFC4D/Library/PreferencePanes
     per2:/var/mobile/Containers/Data/Application/32652744-9BB8-494C-860D-305BDEFCFC4D/Library/Preferences
     temp1:/private/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1/tmp/
     temp2:/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1/tmp
     */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func writeText() -> Void {
        let path = NSHomeDirectory() + "/Documents/swift.txt"
        let info = "homePth:/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1\ndocPath1:/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1/DocumentsdocPath2:/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1/Documentslibs1:/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1/Librarylibs2:/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1/Librarycache1:/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1/Library/Cachescache2:/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1/Library/Cachestemp1:/private/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1/tmp/temp2:/var/mobile/Containers/Data/Application/EADAEEAA-51D9-461A-89A8-F76B07ED7CF1/tmp"
        do {
            try info.write(toFile: path, atomically: true, encoding: .utf8)
            print("write file success")
        } catch {
            print("write file error")
        }
    }
    func writeArray() -> Void {
        let fruits : NSArray = ["Apple","Orange","banana"]
        let fruitsString = NSHomeDirectory() + "/Documents/fruits.plist"//字符串数组
        fruits.write(toFile: fruitsString, atomically: true)
        print("array write success")
    }
    func writeDictionary() -> Void {
        let dictionary = ["apple":"swift","android":"Kotlin"]
        let product = dictionary as NSDictionary
        let path = NSHomeDirectory() + "/Documents/products.plist"
        product.write(toFile: path, atomically: true)
        print("dictionary write success")
    }
    func saveImage() -> Void {
        let iamgePath = NSHomeDirectory() + "/Documents/pic.png"
        let image = UIImage(named: "Lion")
        let imageData: Data = UIImagePNGRepresentation(image!)!
        try? imageData.write(to: URL(fileURLWithPath: iamgePath), options: [.atomic])
        print("image save success")
    }
    //遍历文件夹
    func fileBianrary() -> Void {
        let fileManager = FileManager.default
        let path = NSHomeDirectory() + "/Documents/"
        let files = try? fileManager.contentsOfDirectory(atPath: path)
        print("file Name:\(String(describing: files))")
        let contens = fileManager.enumerator(atPath: path)
        print("file name2:\(String(describing: contens?.allObjects))")
    }
    //copy file
    func copyFile() -> Void {
        let manager = FileManager.default
        let path = NSHomeDirectory() + "/Documents/pic.png"
        let targetPath = NSHomeDirectory() + "/Documents/tt.png"
        let exist = manager.fileExists(atPath: targetPath)
        if exist {
            //delete file
            do{
                try manager.removeItem(atPath: targetPath)
                print("delete success")
                copyFile()
                return
            }catch{
                print("delete failed")
            }
        }
        do {
            try manager.copyItem(atPath: path, toPath: targetPath)
            print("copy file success")
        } catch {
            print("copy file failed")
        }
    }
    //move file
    func moveFile() -> Void {
        let manager = FileManager.default
        let path = NSHomeDirectory() + "/Documents/pic.png"
        let targetPath = NSHomeDirectory() + "/Documents/pic.png"
        do {
            try manager.moveItem(atPath: path, toPath: targetPath)
            print("move file success")
        } catch {
            print("move file failed")
        }
    }
    //remove folder
    func removeFolder() -> Void {
        let manager = FileManager.default
        let path = NSHomeDirectory() + "/Documents/"
        let files = manager.subpaths(atPath: path)
        for file in files! {
            do{
                try manager.removeItem(atPath: path + "/\(file)")
                print("remove file :\(path)\(file) success")
            }catch{
                print("remove file failed")
            }
        }
    }
    // get file list
    func listFoler() -> Void {
        let manager = FileManager.default
        let  path = NSHomeDirectory() + "/Documents/"
        let contens = manager.enumerator(atPath: path)
        print("contens:\(String(describing: contens?.allObjects))")
    }
}
