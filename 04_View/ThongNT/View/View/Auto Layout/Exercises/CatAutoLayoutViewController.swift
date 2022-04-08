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
    private let newsArray = DumbData.news
    private var verticalSpace: CGFloat = 0
    private var newsIndex: Int = 1
    
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
        newsArray.forEach { news in
            addNews(news, verticalMove: verticalSpace)
            verticalSpace += scrollView.bounds.width
        }
        contentViewWidthConstraint.constant = CGFloat( scrollView.bounds.width * CGFloat(newsArray.count))
    }
    
    private func showIndexOfPageNumber() {
        newsIndex = Int(scrollView.contentOffset.x / scrollView.bounds.width + 1)
        if newsIndex < 1 {
            newsIndex = 1
        }
        if newsIndex > newsArray.count {
            newsIndex = newsArray.count
        }
        indexOfNewsLabel.text = "\(newsIndex)/\(newsArray.count)"
    }
    
    private func setTextOfNews(with index: Int) {
        var indexOfNews = index <= newsArray.count ? index : newsArray.count
        indexOfNews -= 1
        contentLabel.text = newsArray[indexOfNews].content
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
        setTextOfNews(with: newsIndex)
    }
}
