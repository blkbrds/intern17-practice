//
//  Bai4ViewController.swift
//  CollectionView
//
//  Created by luong.tran on 21/09/2022.
//

import UIKit

final class Bai4ViewController: UIViewController {
   
    @IBOutlet private weak var slideCollectionView: UICollectionView!
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: Bai4ViewModel?
    
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
        let slideNib = UINib(nibName: Define.slideCollName, bundle: Bundle.main)
        slideCollectionView.register(slideNib, forCellWithReuseIdentifier: Define.slideCollName)
        slideCollectionView.dataSource = self
        slideCollectionView.delegate = self
    }
    
    private func configTableView() {
        let nib = UINib(nibName: Define.cellName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Define.cellName)
        tableView.dataSource = self
        tableView.delegate = self
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfItemsInSection(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = viewModel,
              let cell = slideCollectionView.dequeueReusableCell(withReuseIdentifier: Define.slideCollName, for: indexPath) as? ImageCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.viewModel = viewModel.viewModelForItem(at: indexPath)
        return cell
    }
    
}

extension Bai4ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: slideCollectionView.bounds.size.width - 20, height: slideCollectionView.bounds.size.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Define.insetSection
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Define.cellName, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Define.tableHeightRow
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Tag \(section + 1)"
    }
}

extension Bai4ViewController {
    private struct Define {
        static var slideCollName: String = String(describing: ImageCollectionViewCell.self)
        static var cellName: String = String(describing: CollectionTableViewCell.self)
        static var insetSection: UIEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        static var tableHeightRow: CGFloat = 120
    }
}
