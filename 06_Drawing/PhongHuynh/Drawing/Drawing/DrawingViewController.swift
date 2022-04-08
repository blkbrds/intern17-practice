import UIKit

class DrawingViewController: UIViewController {
    
    lazy var barChartView: Drawing = {
          let barChartView = Drawing()
          barChartView.frame = view.frame
          return barChartView
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barChartView.dataEntries =
            [
                BarEntry(score: 45, title: "Tue"),
                BarEntry(score: 35, title: "Wed"),
                BarEntry(score: 55, title: "Thu"),
                BarEntry(score: 3, title: "Fri"),
                BarEntry(score: 15, title: "Sat"),
                BarEntry(score: 35, title: "Sun"),
                BarEntry(score: 20, title: "Today")
            ]
        view.addSubview(barChartView)
        
        drawLine(start: CGPoint(x: 20, y: 50), end: CGPoint(x: 400, y: 50))
        drawLine(start: CGPoint(x: 20, y: 200), end: CGPoint(x: 400, y: 200))
        drawLine(start: CGPoint(x: 20, y: 350), end: CGPoint(x: 400, y: 350))
        drawLine(start: CGPoint(x: 20, y: 500), end: CGPoint(x: 400, y: 500))
    }
    
    func drawLine(start: CGPoint, end: CGPoint) {
           // PATH
           let path = UIBezierPath()
           path.move(to: start)
           path.addLine(to: end)
           path.close()
           
           //LAYER
           let shapeLayer = CAShapeLayer()
           shapeLayer.strokeColor = UIColor.blue.cgColor
           shapeLayer.lineWidth = 0.2
           shapeLayer.path = path.cgPath
           
           //ADD LAYER
           self.view.layer.addSublayer(shapeLayer)
       }
}
