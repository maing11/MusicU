//
//  TrendingCell.swift
//  MusicU
//
//  Created by mai ng on 6/20/21.
//

import Foundation
import UIKit


class TrendingCell: UICollectionViewCell {
    static let identifier = "RowCell"
    
    private let trendingContainer = UIView()
    private let trendingLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "MalayalamSangamMN-Bold", size: 16)
    label.textAlignment = .left
    label.textColor = .black
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.85
    label.lineBreakMode = .byTruncatingTail
    label.text = "ijy"

    return label
}()
    
    private let thumbnailImageView: UIImageView = {
        var image = UIImageView(image: UIImage(named: "Blue_MusicNote"))
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.contentMode = .scaleToFill

        return image
    }()
    
   
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        label.textAlignment = .left
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.85
        label.lineBreakMode = .byTruncatingTail

        return label
    }()
    
    
    private let artistLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 16)
        label.textAlignment = .left
        label.textColor = .black
        label.alpha = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.85
        label.lineBreakMode = .byTruncatingTail

        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        
        addSubview(thumbnailImageView)
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        thumbnailImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalToConstant: self.frame.height).isActive = true
        
        trendingContainer.backgroundColor = UIColor.BlueColor
        trendingContainer.layer.cornerRadius = 11


        addSubview(trendingContainer)
        trendingContainer.translatesAutoresizingMaskIntoConstraints = false
        trendingContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        trendingContainer.leftAnchor.constraint(equalTo: thumbnailImageView.rightAnchor,constant: 20).isActive = true
        trendingContainer.heightAnchor.constraint(equalToConstant: 24).isActive = true
        trendingContainer.widthAnchor.constraint(equalToConstant: 43).isActive = true

        trendingContainer.addSubview(trendingLabel)
        trendingLabel.translatesAutoresizingMaskIntoConstraints = false
        trendingLabel.centerXAnchor.constraint(equalTo: trendingContainer.centerXAnchor).isActive = true
        trendingLabel.centerYAnchor.constraint(equalTo: trendingContainer.centerYAnchor).isActive = true
        trendingLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
        trendingLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        
      
    
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: trendingContainer.bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: thumbnailImageView.rightAnchor,constant: 12).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 29).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 176).isActive = true

        
        addSubview(artistLabel)
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        artistLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        artistLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        artistLabel.heightAnchor.constraint(equalToConstant: 32)
    }
    
    
    func setUpUI(topTrendingSong: TopTrendingSong) {
        thumbnailImageView.image = UIImage(named: topTrendingSong.song.thumbnailUrl)
        titleLabel.text = topTrendingSong.song.title
        artistLabel.text = topTrendingSong.song.artist
        trendingLabel.text = "#0\(topTrendingSong.rank)"
    }

}
