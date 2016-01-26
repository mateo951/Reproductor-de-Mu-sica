//
//  ViewController.swift
//  Reproductor de Música
//
//  Created by Mateo Villagomez on 1/25/16.
//  Copyright © 2016 Mateo Villgomez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let popSound = NSBundle.mainBundle().URLForResource("Sorry", withExtension: "mp3")
    let rockSound = NSBundle.mainBundle().URLForResource("It's My Life", withExtension: "mp3")
    let jazzSound = NSBundle.mainBundle().URLForResource("Jazz", withExtension: "mp3")
    let classicSound = NSBundle.mainBundle().URLForResource("Pachelbel Canon", withExtension: "mp3")
    let countrySound = NSBundle.mainBundle().URLForResource("Home", withExtension: "mp3")
  
    var reproductor: AVAudioPlayer = AVAudioPlayer()
    
    var currentTime: NSTimeInterval = NSTimeInterval()
    
    @IBOutlet weak var songTitleText: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func volumeAdjuster(sender: UISlider) {
        reproductor.volume = slider.value
    }
    @IBOutlet weak var songImage: UIImageView!
    
    @IBOutlet weak var segmentedConttrol: UISegmentedControl!
   
    @IBAction func playSegmented() {
    
        switch segmentedConttrol.selectedSegmentIndex {
            
            case 0:
                do {
                    try reproductor = AVAudioPlayer(contentsOfURL: popSound!)
                    } catch { "No se pudo reproducir el archivo"}
                    songImage.image = UIImage(named: "JB.png")
                    songTitleText.text = "Sorry - Justin Bieber"
                    reproductor.play()
                    if reproductor.playing == true {
                        playButton.hidden = true
                        pauseButton.hidden = false
            }
            case 1:
                do {
                    try reproductor = AVAudioPlayer(contentsOfURL: rockSound!)
                    } catch { "No se pudo reproducir el archivo"}
                    songImage.image = UIImage(named: "bon jovi.jpg")
                    songTitleText.text = "It's my life - Bon Jovi"
                    reproductor.play()
                    if reproductor.playing == true {
                        playButton.hidden = true
                        pauseButton.hidden = false
            }
            case 2:
                do {
                    try reproductor = AVAudioPlayer(contentsOfURL: jazzSound!)
                    } catch { "No se pudo reproducir el archivo"}
                    songImage.image = UIImage(named: "jazz.jpg")
                    songTitleText.text = "Kind of Blue - Miles Davis"
                    reproductor.play()
                    if reproductor.playing == true {
                        playButton.hidden = true
                        pauseButton.hidden = false
            }
            case 3:
                do {
                    try reproductor = AVAudioPlayer(contentsOfURL: classicSound!)
                    } catch { "No se pudo reproducir el archivo"}
                    songImage.image = UIImage(named: "Classic.jpg")
                    songTitleText.text = "D major - Pachelbel Canon"
                    reproductor.play()
                if reproductor.playing == true {
                        playButton.hidden = true
                        pauseButton.hidden = false
            }
            case 4:
                    do {
                        try reproductor = AVAudioPlayer(contentsOfURL: countrySound!)
                    } catch { "No se pudo reproducir el archivo"}
                    songImage.image = UIImage(named: "PH.jpg")
                    songTitleText.text = "Home - Phillip Phillips"
                    reproductor.play()
                    if reproductor.playing == true {
                        playButton.hidden = true
                        pauseButton.hidden = false
                    }
                    
            default:
            break;
        }
    }
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBAction func shuffle(sender: UIButton) {
        do {
            // Array of URLPaths
            let array = [popSound, rockSound, jazzSound, classicSound, countrySound]
            // Randomizing array's index
            let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
            // Giving images and labels to each song
            if randomIndex == 0 {
                songImage.image = UIImage(named: "JB.png")
                songTitleText.text = "Sorry - Justin Bieber"
                self.segmentedConttrol.selectedSegmentIndex = 0
            } else if randomIndex == 1 {
                songImage.image = UIImage(named: "bon jovi.jpg")
                songTitleText.text = "It's my life - Bon Jovi"
                self.segmentedConttrol.selectedSegmentIndex = 1
            } else if randomIndex == 2 {
                songImage.image = UIImage(named: "jazz.jpg")
                songTitleText.text = "Kind of Blue - Miles Davis"
                self.segmentedConttrol.selectedSegmentIndex = 2
            } else if randomIndex == 3 {
                songImage.image = UIImage(named: "Classic.jpg")
                songTitleText.text = "D major - Pachelbel Canon"
                self.segmentedConttrol.selectedSegmentIndex = 3
            } else {
                songImage.image = UIImage(named: "PH.jpg")
                songTitleText.text = "Home - Phillip Phillips"
                self.segmentedConttrol.selectedSegmentIndex = 4
            }
            // Shuffling file's reproduction
            try reproductor = AVAudioPlayer(contentsOfURL: (array[randomIndex]!) as NSURL)
            reproductor.play()
            if reproductor.playing == true {
                playButton.hidden = true
                pauseButton.hidden = false
            }
        } catch {"No se pudo reproducir el archivo"}
    }
     
    @IBAction func play() {
        if self.currentTime.isZero == true {
            do {
                try self.reproductor = AVAudioPlayer(contentsOfURL:  popSound!)
            } catch { "No se pudo reproducir el archivo"}
            self.songImage.image = UIImage(named: "JB.png")
            self.songTitleText.text = "Sorry - Justin Bieber"
            self.reproductor.play()
        }
        pauseButton.hidden = false
        playButton.hidden = true
        
    }
    @IBAction func pause() {
        reproductor.pause()
        playButton.hidden = false
        pauseButton.hidden = true
        
        
    }
    @IBAction func stop() {
        reproductor.stop()
        reproductor.currentTime = 0.0
        pauseButton.hidden = true
        playButton.hidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   }

/* var reproductorRock: AVAudioPlayer = AVAudioPlayer()
var reproductorJazz: AVAudioPlayer = AVAudioPlayer()
var reproductorClassic: AVAudioPlayer = AVAudioPlayer()
var reproductorCountry: AVAudioPlayer = AVAudioPlayer()
*/

