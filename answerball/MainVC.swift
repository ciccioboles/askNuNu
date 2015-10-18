//
//  MainVC.swift
//  answerball
//
//  Created by dev on 7/7/15.
//  Copyright (c) 2015 ciccio boles. All rights reserved.
//

import UIKit
import AVFoundation
class MainVC: UIViewController, AVAudioPlayerDelegate   {
    
    
    var audioPlayer : AVAudioPlayer?
    
    
    func playSound(sound: Sound) {
        let dispatchQueue =
        dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        dispatch_async(dispatchQueue, {[weak self] in
            let mainBundle = NSBundle.mainBundle()
            
            /* Find the location of our file to feed to the audio player */
            let filePath = mainBundle.pathForResource(sound.fileName, ofType:sound.fileExtension)
            
            if let path = filePath{
                let fileData = NSData(contentsOfFile: path)
                
                var error:NSError?
                
                do {
                    /* Start the audio player */
                    self!.audioPlayer = try AVAudioPlayer(data: fileData!)
                } catch let error1 as NSError {
                    error = error1
                    self!.audioPlayer = nil
                } catch {
                    fatalError()
                }
                
                /* Did we get an instance of AVAudioPlayer? */
                if let player = self!.audioPlayer{
                    /* Set the delegate and start playing */
                    player.delegate = self
                    if player.prepareToPlay() && player.play(){
                        /* Successfully started playing */
                    } else {
                        /* Failed to play */
                    }
                } else {
                    /* Failed to instantiate AVAudioPlayer */
                }
            }
            
            })
        
    }

    
    
    
    
    
    
    @IBOutlet weak var answerText: UILabel!
    
    var answers = [
        "I don't know my friend",
        "absolutely",
        "ask again later",
        "yeah right",
        "take a hike",
        "sure",
        "I guess so",
        "why not",
        "totally",
        "no way",
        "for sure",
        "YES",
        "NO",
        "OK",
        "absolutely not",
    ]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        getAnswerTapped(UIEvent)
        
    }
    
    @IBAction func getAnswerTapped(sender: AnyObject) {
        

        
        answerText.text = getAnswer()
        answerText.hidden = false
        playSound(bark)
     
        
    }
    
    
    func getAnswer() ->String {
        let random = Int(arc4random_uniform(UInt32(answers.count)))
        
        let result = answers[random]
        return result
            }

}
