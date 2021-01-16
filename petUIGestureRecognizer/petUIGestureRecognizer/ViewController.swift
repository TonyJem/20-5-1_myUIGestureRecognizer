import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var purpleView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var orangeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func panAction(_ gesture: UIPanGestureRecognizer) {
        
        let blueViewFrame = blueView.frame
        let orangeViewFrame = orangeView.frame
        
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view else { return }
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y
        )
        
        gesture.setTranslation(.zero, in: view)
        guard gesture.state == .ended else { return }
        
        for value in Int(orangeViewFrame.minY)...Int(orangeViewFrame.maxY) {
            if Int(blueViewFrame.origin.y) == value {
                blueView.isHidden = true
            }
        }
        
    }
    
    @IBAction func purpleViewPanAction(_ gesture: UIPanGestureRecognizer) {
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view else { return }
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y
        )
        
        gesture.setTranslation(.zero, in: view)
        guard gesture.state == .ended else { return }
    }
}
