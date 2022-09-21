//
//  Bai4ViewController.swift
//  CollectionView
//
//  Created by luong.tran on 21/09/2022.
//

import UIKit

final class Bai4ViewController: UIViewController {

   
    @IBOutlet weak var slideCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    private let slideCollName = String(describing: ImageCollectionViewCell.self)
    private let cellName = String(describing: CollectionTableViewCell.self)
    
    private let imagesSlide: [String] = ["avenger", "guardian", "xmen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        configCollectionView()
        configTableView()
    }
    
    private func configNavigation() {
        title = "Bài 4"
    }
    
    private func configCollectionView() {
        let slideNib = UINib(nibName: slideCollName, bundle: Bundle.main)
        slideCollectionView.register(slideNib, forCellWithReuseIdentifier: slideCollName)
        slideCollectionView.dataSource = self
        slideCollectionView.delegate = self
    }
    
    private func configTableView() {
        let nib = UINib(nibName: cellName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellName)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.reloadData()
    }
    
    private func moveCollectionToFrame(contentOffset : CGFloat) {
        let frame: CGRect = CGRect(x : contentOffset ,y : self.slideCollectionView.contentOffset.y ,width : self.slideCollectionView.frame.width,height : self.slideCollectionView.frame.height)
        self.slideCollectionView.scrollRectToVisible(frame, animated: true)
    }
    
    @IBAction func rightButtonTouchUpInside(_ sender: Any) {
        let collectionBounds = self.slideCollectionView.bounds
        let contentOffset = CGFloat(floor(self.slideCollectionView.contentOffset.x + collectionBounds.size.width))
        self.moveCollectionToFrame(contentOffset: contentOffset)
    }
    
    @IBAction func leftButtonTouchUpInside(_ sender: Any) {
        let collectionBounds = self.slideCollectionView.bounds
        let contentOffset = CGFloat(floor(self.slideCollectionView.contentOffset.x - collectionBounds.size.width))
        self.moveCollectionToFrame(contentOffset: contentOffset)
    }
}

extension Bai4ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesSlide.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = slideCollectionView.dequeueReusableCell(withReuseIdentifier: slideCollName, for: indexPath) as! ImageCollectionViewCell
        cell.updateCell(image: UIImage(named: imagesSlide[indexPath.row])!)
        return cell
    }
    
}

extension Bai4ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: slideCollectionView.bounds.size.width - 20, height: slideCollectionView.bounds.size.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}

extension Bai4ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "#Tag 1"
        case 1: return "#Tag 2"
        case 2: return "#Tag 3"
        case 3: return "#Tag 4"
        case 4: return "#Tag 5"
        default:
            return "Tag"
        }
    }
}
