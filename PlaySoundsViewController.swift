//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Imane BOUAMAMA on 2021/08/20.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var recordedAudioURL : URL!
    
    @IBOutlet var snailButton: UIButton!
    
    @IBOutlet var chipmunkButton: UIButton!
    
    @IBOutlet var rabbitButton: UIButton!
    
    @IBOutlet var vaderButton: UIButton!
    
    @IBOutlet var echoButton: UIButton!
    
    @IBOutlet var reverbButton: UIButton!
    
    @IBOutlet var stopButton: UIButton!
    
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear( animated )
        configureUI(.notPlaying)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    

    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
            case .slow:
                playSound(rate: 0.5)
            case .fast:
                playSound(rate: 1.5)
            case .chipmunk:
                playSound(pitch: 1000)
            case .vader:
                playSound(pitch: -1000)
            case .echo:
                playSound(echo: true)
            case .reverb:
                playSound(reverb: true)
            }
            configureUI(.playing)
    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }

}
