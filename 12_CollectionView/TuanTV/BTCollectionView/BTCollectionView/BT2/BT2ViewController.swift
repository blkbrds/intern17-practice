//
//  BT2ViewController.swift
//  BTCollectionView
//
//  Created by Tuan Tran V. VN.Danang on 5/27/22.
//

import UIKit

final class BT2ViewController: UIViewController {
    
    private var data: [UIImageView] = []
    //MARK: -IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getDummyDatas()
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
          layout.delegate = self
        }
    }
    
    private func setupView() {
        print("hahaha")
        let nib = UINib(nibName: "ImageCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
    }
    
    private func getDummyDatas() {
        for i in 1...30 {
            let width: CGFloat = 100
            let height: CGFloat = CGFloat.random(in: 60...200)
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
            data.append(imageView)
        }
    }
}

extension BT2ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCell
        cell.image.image = data[indexPath.row].image
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("---", CGSize(width: data[indexPath.row].frame.width, height: data[indexPath.row].frame.height))
        return CGSize(width: data[indexPath.row].frame.width, height: data[indexPath.row].frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 5
        }
}

extension BT2ViewController: PinterestLayoutDelegate {
  func collectionView(
      _ collectionView: UICollectionView,
      heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    return data[indexPath.row].frame.height
  }
}
