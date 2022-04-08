//
//  CatAutoLayoutViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/6/22.
//

import UIKit

struct News {
    var image: String
    var content: String
}

final class CatAutoLayoutViewController: UIViewController {
    
    //MARK: - IBOutlet private variables
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var indexOfNewsLabel: UILabel!
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var contentViewWidthConstraint: NSLayoutConstraint!
    
    //MARK: - Private variables
    private let arrayOfNews = DumbData.news
    private var verticalMove: CGFloat = 0
    private var indexOfNews: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    //MARK: - Private functions
    private func setupUI() {
        view.subviews
            .compactMap { $0 as? UIButton }
            .forEach { configButton($0) }
        addLotsOfNews()
        showIndexOfPageNumber()
        scrollView.delegate = self
    }
    
    private func configButton(_ button: UIButton) {
        button.backgroundColor = .systemTeal
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.1
    }
    
    private func addNews(_ news: News, verticalMove: CGFloat) {
        let frame = CGRect(x: verticalMove,
                           y: 0,
                           width: scrollView.bounds.width,
                           height: contentView.bounds.height)
        
        let imageView = UIImageView(image: UIImage(named: news.image))
        imageView.contentMode = .scaleAspectFill
        imageView.frame = frame
        imageView.backgroundColor = .systemGray
        contentView.addSubview(imageView)
        print( """
                ===================
                vertical: \(verticalMove)
                frame: \(frame)
                contentView x : \(contentView.bounds.width)
                \(scrollView.contentSize)
                ===================
                """)
    }
    
    private func addLotsOfNews() {
        arrayOfNews.forEach { (news) in
            addNews(news, verticalMove: verticalMove)
            verticalMove += scrollView.bounds.width
        }
        contentViewWidthConstraint.constant = CGFloat( scrollView.bounds.width * CGFloat(arrayOfNews.count))
//        scrollView.contentSize = CGSize(width: scrollView.bounds.width * 10, height: contentView.bounds.height)
    }
    
    private func showIndexOfPageNumber() {
        indexOfNews = Int(scrollView.contentOffset.x / scrollView.bounds.width + 1)
        if indexOfNews < 1 {
            indexOfNews = 1
        }
        if indexOfNews > arrayOfNews.count {
            indexOfNews = arrayOfNews.count
        }
        indexOfNewsLabel.text = "\(indexOfNews)/\(arrayOfNews.count)"
    }
    
    private func setTextOfNews(with index: Int) {
        let indexOfNews = index <= arrayOfNews.count ? index : arrayOfNews.count
        contentLabel.text = arrayOfNews[indexOfNews].content
    }
    
    //MARK: - IBAction private functions
    @IBAction private func clickOnForwardAndBackwardButton(_ sender: UIButton) {
        switch sender.tag {
        // Case 0 is backward to previous picture
        case 0:
            break
        // Case 1 is forward to next picture
        case 1:
            break
        default:
            return
        }
    }
}

extension CatAutoLayoutViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        showIndexOfPageNumber()
        setTextOfNews(with: indexOfNews)
    }
}
