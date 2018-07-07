//
//  ViewController.swift
//  UIIOS-7
//  AudioPlayer 音频播放
//  Created by Rocky on 2018/6/22.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import UIKit
import AudioToolbox//音频库 1
import AVFoundation//多媒体库 摄像机 录音机等 2 3
import MediaPlayer//视频播放库 4
import AVKit//ios 9.0
import AVFoundation

class ViewController: UIViewController {

    var audio: AVAudioPlayer = AVAudioPlayer()//音频
    var media: MPMoviePlayerController = MPMoviePlayerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //1.使用系统音频播放提示音
//        var sound:SystemSoundID = 0
//        let path = Bundle.main.path(forResource: "swimsuit", ofType: "mp3")
//        let soundUrl = URL(fileURLWithPath: path!)
//        AudioServicesCreateSystemSoundID(soundUrl as CFURL,&sound)
//        AudioServicesPlayAlertSound(sound)
        
        //2.使用AVAudioPlayer音频播放
//        let path = Bundle.main.path(forResource: "The xx-Intro", ofType: "mp3")
//        let soundUrl = URL(fileURLWithPath: path!)
//        do{
//            try audio = AVAudioPlayer(contentsOf: soundUrl)
//            audio.volume = 1.0
//            audio.numberOfLoops = 1//循环播放一次
//            audio.play()
//        }catch{
//            print("error player")
//        }
        
        //3.使用 AVAudioPlayer播放 并配置info.plist 添加支持背景播放 App plays audio or streams audio/video using AirPlay
//        let session = AVAudioSession.sharedInstance()
//        do{
//            try session.setActive(true)
//            try session.setCategory(AVAudioSessionCategoryPlayback)
//
//            let path = Bundle.main.path(forResource: "The xx-Intro", ofType: "mp3")
//            let soundUrl = URL(fileURLWithPath: path!)
//            try audio = AVAudioPlayer(contentsOf: soundUrl)
//            audio.prepareToPlay()
//            audio.volume = 1.0
//            audio.numberOfLoops = -1
//            audio.play()
//        }catch{
//            print("error player")
//        }
        //4 视频播放 MPMoviePlayerController
        let path = Bundle.main.path(forResource: "video", ofType: "mp4")
        let movieUrl = URL(fileURLWithPath: path!)

        self.media = MPMoviePlayerController(contentURL: movieUrl)
        media.controlStyle = MPMovieControlStyle.fullscreen
        media.view.frame = self.view.frame
        media.initialPlaybackTime = -1

        self.view.addSubview(media.view)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.movieAction( _ :)), name: .MPMoviePlayerPlaybackDidFinish, object: media)
        media.play()
        
        //5 视频播放 机遇AVPlayer error没有调试成功
        //定义一个视频文件路径
//        let filePath = Bundle.main.path(forResource: "video", ofType: "mp4")
//        let videoURL = URL(fileURLWithPath: filePath!)
//        //定义一个视频播放器，通过本地文件路径初始化
//        let player = AVPlayer(url: videoURL)
//        let playerViewController = AVPlayerViewController()
//        playerViewController.player = player
//        self.present(playerViewController, animated: true) {
//            playerViewController.player!.play()
//        }
    }
    
    @objc func movieAction( _ notify: Notification){
        print("movie ends")
        let player = notify.object
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.MPMoviePlayerPlaybackDidFinish, object: player)
    }
    
    @objc func playerListener(){
        print("player finished")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

