import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
                
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:
            #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            secondsPassed += 1
            progressBar.progress = Float(percentageProgress)
            
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    
}
