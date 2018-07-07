//
//  PageControlViewController.swift
//  ScrollViewDemo
//
//  Created by 夏佰奎 on 2018/6/14.
//  Copyright © 2018年 夏佰奎. All rights reserved.
//

import UIKit

class PageControlViewController: UIViewController ,UIScrollViewDelegate{

    var scrollView = UIScrollView()
    var pageControl = UIPageControl()
    var isPageControlUsed = false
    override func viewDidLoad() {
        super.viewDidLoad()
        var screenFrame = UIScreen.main.bounds
        let screenW = screenFrame.size.width
        let screenH = screenFrame.size.height
        
        scrollView.frame = screenFrame
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: screenW * 2, height: screenH)
        scrollView.backgroundColor = UIColor.red
        scrollView.delegate = self
        
        let pcHeight :CGFloat = 50.0
        let pcRect = CGRect(x: 0, y: screenH - pcHeight, width: screenW, height: pcHeight)
        pageControl.frame = pcRect
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(PageControlViewController.pageChange(_ :)), for: UIControlEvents.valueChanged)
        
        let firstContriller = FirstSubViewController()
        screenFrame.origin.x = 0
        firstContriller.view.frame = screenFrame
        
        let secondController = SecondSubViewController()
        screenFrame.origin.x = screenFrame.size.width
        secondController.view.frame = screenFrame
        
        scrollView.addSubview(firstContriller.view)
        scrollView.addSubview(secondController.view)
        
        self.view.addSubview(scrollView)
        self.view.addSubview(pageControl)
 
    }
 
    @objc func pageChange(_ sender :AnyObject){
    let crtPage = (CGFloat)(pageControl.currentPage)
    var frame = scrollView.frame
    frame.origin.x = frame.size.width * crtPage
    frame.origin.y = 0
    
    scrollView.scrollRectToVisible(frame, animated: true)
    isPageControlUsed = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(!isPageControlUsed){
            let pageW = scrollView.frame.size.width
            let page = floor((scrollView.contentOffset.x - pageW/2)/pageW) + 1
            pageControl.currentPage = Int(page)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        isPageControlUsed = false
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
