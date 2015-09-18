//
//  ViewController.swift
//  Back to Bach Music
//
//  Created by TangWeichang on 8/19/15.
//  Copyright © 2015 TangWeichang. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    @IBAction func play(sender: AnyObject) {
        player.play()
    }
    @IBOutlet var volumeSlider: UISlider!
    
    @IBAction func adjustVolume(sender: AnyObject) {
        player.volume = volumeSlider.value
    }
    
    // progressSlider should be called scrubSlider
    @IBOutlet var progressSlider: UISlider!
    
    
    @IBAction func adjustProgress(sender: AnyObject) {
        player.currentTime = NSTimeInterval(progressSlider.value)
    }
    @IBAction func pause(sender: AnyObject) {
        player.pause()
    }
    
    @IBAction func stop(sender: AnyObject) {
        player.pause()
        let audioPath = NSBundle.mainBundle().pathForResource("back", ofType: "mp3")!
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
        } catch {
            print("Error")
        }

    }
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    func updateProgressSlider() {
        progressSlider.value = Float(player.currentTime)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let audioPath = NSBundle.mainBundle().pathForResource("back", ofType: "mp3")!
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            progressSlider.maximumValue = Float(player.duration)
        } catch {
            print("Error")
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateProgressSlider"), userInfo:nil , repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

