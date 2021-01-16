import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var purpleView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var orangeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mixingGesture = MixGesture(target: self, action: #selector(handleMixing))
        mixingGesture.delegate = self
        blueView.addGestureRecognizer(mixingGesture)
        
    }
    
    @objc func handleMixing(_ gesture: MixGesture){
    
        let orangeViewX = orangeView.frame.minX
        let orangeViewY = orangeView.frame.minY
        let orangeViewWidth = orangeView.frame.width
        let orangeViewHeight = orangeView.frame.height
        
        orangeView.frame = CGRect(x: orangeViewX,
                                  y: orangeViewY,
                                  width: orangeViewWidth,
                                  height: orangeViewHeight)
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
        
        let purpleViewFrame = purpleView.frame
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
            if Int(purpleViewFrame.origin.y) == value {
                purpleView.isHidden = true
            }
        }
    }
}
