//
//  ViewController.swift
//  Http-12
//
//  Created by Rocky on 2018/6/25.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let reachability = Reachability()!
    var label = UILabel()
    var image = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        Thread.sleep(forTimeInterval: 2)
        
        //判断网络连接状状态
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
        }
        reachability.whenUnreachable = { _ in
            print("Not reachable")
        }
        
        do {
            try reachability.startNotifier()//开始检测
        } catch {
            print("Unable to start notifier")
        }
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do{
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
        
        //UIApplication.shared.openURL(URL(string: "http://baidu.com")!)//使用应用自带默认浏览器打开url
        //UIApplication.shared.open(URL(string: "http://baidu.com")!, options: [:], completionHandler: nil)
        //UIApplication.shared.openURL(URL(string: "tel:15696024549")!)//打电话
        
        //UIApplication.shared.openURL(URL(string: "sms:176004480")!)//发短息
        //UIApplication.shared.openURL(URL(string: "mailto:rocky_shine@163.com")!)//发邮件
        
//        var address = "Beijing"
//        address = address.addingPercentEncoding(withAllowedCharacters: CharacterSet())!
//        let url = "https://maps.google.cn/maps!q=\(address)"
//        UIApplication.shared.openURL(URL(string: url)!)
        
        let rect = CGRect(x: 50, y: 50, width: 300, height: 300)
        label.frame = rect
        label.text = "Loading"
        label.font = UIFont(name: "Arial", size: 14)
        label.backgroundColor   = UIColor.gray
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        
//        let url = URL(string: "http://www.weather.com.cn/data/sk/101010100.html")
//        let request = URLRequest.init(url: url!, cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 60)
//
//        do {
//            let data: Data = try NSURLConnection.sendSynchronousRequest(request, returning: URLResponse.)
//            let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
//
//            self.label.text = str! as String
//        } catch {
//            print("net connect  error")
//        }
        
        //加载网络图片
//        self.image.frame = view.frame
//        self.view.addSubview(image)
//        let url = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529925275607&di=c755c4c4a0384f6973c51f7d40344b8a&imgtype=0&src=http%3A%2F%2Fpic28.photophoto.cn%2F20130705%2F0036036828711548_b.jpg")
//        let request = URLRequest(url: url!)
//        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main, completionHandler: {
//            (response:URLResponse?,data:Data?,error:Error?)->Void in
//            let image = UIImage(data: data!)
//            self.image.image = image
//        })
//
        //下载网络图片到本地
//        let urlSession = URLSession.shared
//        let download = urlSession.downloadTask(with: request) { (location, response, error) in
//            do{
//                let origin = location?.path as! String
//                print("\(String(describing: origin))")
//                let target = NSHomeDirectory() + "/Documents/tt.png"
//                let filemanager = FileManager.default
//                try  filemanager.copyItem(atPath: origin, toPath: target)
//                print("\(target)+\(filemanager.fileExists(atPath: target))")
//            }catch{
//                print("error")
//            }
//        }
//        download.resume()
        
        //PerformeSelector消息处理方法
        let app = IOSApp()
        if (app.responds(to: Selector(("printApp")))) {
            app.perform(Selector(("printApp")) )
        }
        else{
            print("error 1")
        }
      
        if (app.responds(to: Selector(("buyApp:")))) {
            app.perform(Selector(("buyApp:")) ,with: "asbflkashjf")
            app.perform(Selector(("buyApp:")), with: "lkwemrf", afterDelay: 4)
        }
        else{
            print("error 2")
        }
        
        //Timer 定时器
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.task( _:)), userInfo: "information", repeats: true)
        
    }
    @objc func task(_ timer: Timer) -> Void  {
        print("apple")
    }
    @objc func reachabilityChanged(note: Notification) {
        
        let reachability = note.object as! Reachability
        
        switch reachability.connection {
        case .wifi:
            print("Reachable via WiFi")
        case .cellular:
            print("Reachable via Cellular")
        case .none:
            print("Network not reachable")
        }
    }
    
    deinit {
        reachability.stopNotifier()
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

