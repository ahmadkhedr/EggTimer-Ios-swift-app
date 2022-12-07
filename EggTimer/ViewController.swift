
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft" : 5 * 60 , "Medium" : 7  * 60 , "Hard" : 12 * 60]
   var totalTime = 0
    var secondsPassed = 0
    var timer  = Timer()
    var player: AVAudioPlayer!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var progressBarTimer: UIProgressView!
    
    @IBAction func hardenSelected(_ sender: UIButton) {
        let currentTitle = sender.currentTitle!
        progressBarTimer.progress = 0.0
        secondsPassed = 0
        self.mainLabel.text = currentTitle
        timer.invalidate()
        totalTime = eggTimes[currentTitle]!
    
        timer =    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
         if self.secondsPassed < self.totalTime {
             self.secondsPassed += 1
                var percentageProgress = Float(self.secondsPassed) / Float(self.totalTime)
             
             self.progressBarTimer.progress = Float(percentageProgress)
                  
                  
               } else {
                   let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                      
                   self.player = try! AVAudioPlayer(contentsOf: url!)
                     player.play()
                   self.mainLabel.text = "Done"
                   Timer.invalidate()
               }
           }
       
    }
    
    
    func gethardevakue(hardenvalue : String){
        
        print(hardenvalue)
        
    }
    
}
