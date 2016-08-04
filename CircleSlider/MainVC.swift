import UIKit

class MainVC: UIViewController {

    //Outlets
    @IBOutlet weak var circleView: CircleView!
    
    //Vars
    var i: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    //Slider-handling --> change the endpoints for the 3 sliders
    @IBAction func outerChanged(sender: UISlider) {
        circleView.endPoint_o = CGFloat(sender.value)
    }
    @IBAction func middleChanged(sender: UISlider) {
        circleView.endPoint_m = CGFloat(sender.value)
    }
    @IBAction func innerChanged(sender: UISlider) {
        circleView.endPoint_i = CGFloat(sender.value)
    }
    
    
    //Animate the drawing using NSTimer
    @IBAction func playClicked(sender: UIButton) {
        NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(MainVC.timerFire(_:)), userInfo: nil, repeats: true)
    }
    func timerFire(sender: NSTimer) {
        if i < 360 {
            circleView.addPoint = i
            i = i + 1
        }
        else {
            sender.invalidate()
        }
    }
    
    
    
}
