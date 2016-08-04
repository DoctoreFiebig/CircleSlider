import UIKit

class CircleView: UIView {

    //Private Vars
    private var centerPoint: CGPoint!
    private var outerRadius: CGFloat!
    private var middleRadius: CGFloat!
    private var innerRadius: CGFloat!
    private var outerColor: UIColor = UIColor.redColor()
    private var middleColor: UIColor = UIColor.greenColor()
    private var innerColor: UIColor = UIColor.orangeColor()
    private var startPoint: CGFloat = -90
    
    //Public Vars --> Redraws the View when changed
    var endPoint_o: CGFloat = -90 {
        didSet {
            endPoint_o += startPoint
            setNeedsDisplay()
        }
    }
    var endPoint_m: CGFloat = -90 {
        didSet {
            endPoint_m += startPoint
            setNeedsDisplay()
        }
    }
    var endPoint_i: CGFloat = -90 {
        didSet {
            endPoint_i += startPoint
            setNeedsDisplay()
        }
    }
    var addPoint: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    //Get the center of the View and define the radius for the circles
    private func getCenterAndRadius() {
        centerPoint = CGPoint(x: bounds.midX, y: bounds.midY)
        outerRadius = (min(bounds.size.width, bounds.size.height) / 2) * 0.6
        middleRadius = outerRadius - 25
        innerRadius = middleRadius - 25
    }
    
    //Create UIBezierPaths for the outer, middle and inner circle
    private func drawOuterCircle() -> UIBezierPath {
        let path = UIBezierPath(arcCenter: centerPoint, radius: outerRadius, startAngle: rad(startPoint + addPoint), endAngle: rad(endPoint_o + addPoint), clockwise: true)
        path.lineWidth = 20
        path.lineCapStyle = .Round
        return path
    }
    private func drawMiddleCircle() -> UIBezierPath {
        let path = UIBezierPath(arcCenter: centerPoint, radius: middleRadius, startAngle: rad(startPoint + addPoint), endAngle: rad(endPoint_m + addPoint), clockwise: true)
        path.lineWidth = 20
        path.lineCapStyle = .Round
        return path
    }
    private func drawInnerCircle() -> UIBezierPath {
        let path = UIBezierPath(arcCenter: centerPoint, radius: innerRadius, startAngle: rad(startPoint + addPoint), endAngle: rad(endPoint_i + addPoint), clockwise: true)
        path.lineWidth = 20
        path.lineCapStyle = .Round
        return path
    }
    //Helpfunction to create radial from degree
    private func rad(n: CGFloat)->CGFloat {
        return CGFloat(n * CGFloat(M_PI) / 180)
    }
    
    //Draw to the view (is called by: setNeedsDisplay())
    override func drawRect(rect: CGRect) {
        getCenterAndRadius()
        
        outerColor.setStroke()
        drawOuterCircle().stroke()
        
        middleColor.setStroke()
        drawMiddleCircle().stroke()
        
        innerColor.setStroke()
        drawInnerCircle().stroke()
        
    }


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
