import UIKit

class PieChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pieChartView = PieChart()
        pieChartView.frame = CGRect(x: 30, y: 150, width: view.frame.size.width, height: 300)
        pieChartView.segments = [
            Segment(color: .red, value: 57),
            Segment(color: .blue, value: 30),
            Segment(color: .green, value: 25),
            Segment(color: .yellow, value: 40),
            Segment(color: .orange, value: 20)
        ]
        view.addSubview(pieChartView)
    }
}
