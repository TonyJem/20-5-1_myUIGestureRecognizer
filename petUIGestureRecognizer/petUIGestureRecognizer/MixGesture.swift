import UIKit

enum MixingGestureDirection {
    case left
    case right
    case underfined
}

class MixGesture: UIGestureRecognizer {
    let requiredMovements = 2
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        guard let touch = touches.first else { return }
        mixingStartPoint = touch.location(in: view)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        guard let touch = touches.first else { return }
        
        let mixingLocation = touch.location(in: view)
        let horizontalDifference = mixingLocation.x - mixingStartPoint.x
        
        if abs(horizontalDifference) < CGFloat(distanceForMixGesture) {
            return
        }
        
}
