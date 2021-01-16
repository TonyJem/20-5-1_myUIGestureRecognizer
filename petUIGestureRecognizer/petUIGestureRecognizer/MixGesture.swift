import UIKit

enum MixingGestureDirection {
    case left
    case right
    case underfined
}

class MixGesture: UIGestureRecognizer {
    let requiredMovement = 2
    let distanceForMixGesture: CGFloat = 35
    
    var mixingNumber = 0
    var mixingStartPoint: CGPoint = .zero
    var finalDirection: MixingGestureDirection = .underfined
    
    override func reset() {
        mixingNumber = 0
        mixingStartPoint = .zero
        finalDirection = .underfined
        
        if state == .possible {
            state = .failed
        }
    }
}
