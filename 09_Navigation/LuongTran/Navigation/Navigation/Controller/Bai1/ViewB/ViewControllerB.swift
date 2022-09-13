//
//  ViewControllerB.swift
//  Navigation
//
//  Created by luong.tran on 12/09/2022.
//

import UIKit

final class ViewControllerB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "View B"
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        let viewC = ViewControllerC()
        navigationController?.pushViewController(viewC, animated: true)
    }
    @IBAction func prevButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
