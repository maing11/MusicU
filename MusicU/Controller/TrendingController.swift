//
//  TrendingController.swift
//  MusicU
//
//  Created by mai ng on 5/28/21.
//

import UIKit
import Foundation

class TrendingController: UIViewController {
    
    private let trendingSongContainer = UIView()
    private var songs: [Song]!
    private var index: Int!

    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)

        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.left

        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        label.lineBreakMode = .byTruncatingTail
        label.text = "Trending"

        return label
    }()
    
    
    private let topTrendingTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Optima-Bold", size: 25)

        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.left

        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        label.lineBreakMode = .byTruncatingTail
        label.text = "Top Trending - 2021"

        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    

    func configureUI() {
        view.backgroundColor = .BlueColor
        navigationController?.setNavigationBarHidden(true, animated: true)

        view.addSubviews( titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 23).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
      
        
        view.addSubview(topTrendingTitleLabel)
        topTrendingTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        topTrendingTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 30).isActive = true
        topTrendingTitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        topTrendingTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topTrendingTitleLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true

        view.addSubview(trendingSongContainer)
        trendingSongContainer.translatesAutoresizingMaskIntoConstraints = false
        trendingSongContainer.topAnchor.constraint(equalTo: topTrendingTitleLabel.bottomAnchor,constant: 20).isActive = true
        trendingSongContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        trendingSongContainer.rightAnchor.constraint(equalTo: topTrendingTitleLabel.rightAnchor).isActive = true
        trendingSongContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        addContainerVC(childVC: TopTrendingSongVC(), to:trendingSongContainer)
        }
    
    func addContainerVC(childVC: UIViewController, to containerView: UIView) {
        self.addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}


