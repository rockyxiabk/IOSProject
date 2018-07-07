//
//  ViewController.swift
//  IOSUI-3
//
//  Created by Rocky on 2018/6/21.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        //webview
//        let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: 320, height: 460))
//        let url = URL(string: "http://192.168.0.96")
//        let request = URLRequest(url: url!)
//
//        webView.loadRequest(request)
//        self.view.addSubview(webView)
        
        //mapView
        let map = MKMapView(frame: self.view.bounds)
        map.showsUserLocation = true
        map.mapType = MKMapType.satellite
        //设置一个地理位置
        let coordinate2D = CLLocationCoordinate2D(latitude: 39.91, longitude: 116.39)
        let zoomlevel = 0.02//缩放比例
        
        let region = MKCoordinateRegionMake(coordinate2D, MKCoordinateSpanMake(zoomlevel, zoomlevel))
        map.setRegion(region, animated: true)
        
        let objectA = MKPointAnnotation()
        objectA.coordinate = coordinate2D
        objectA.title = "imperial Place"//注释的标题内容
        objectA.subtitle = "Chain‘s beijing Place"//注释的字标题内容
        map.addAnnotation(objectA)
        self.view.addSubview(map)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

