//
//  RecommendedCell.swift
//  MusicU
//
//  Created by mai ng on 5/30/21.
//

import UIKit



class RecommendedCell: UICollectionViewCell {
    
        static let identifier = "RecommendIDCell"


        private let thumbnailImageView: UIImageView = {
            var image = UIImageView(image: UIImage(named: "Blue_MusicNote"))
            image.layer.cornerRadius = 15
            image.clipsToBounds = true
            image.contentMode = .scaleToFill

            return image
        }()
    //        private let thumbnailImageView = MUThumbnailImageView(frame: .zero)
    //
        private let titleLabel: UILabel = {
            let label = UILabel()

            label.font = UIFont(name: "MalayalamSangamMN-Bold", size: 15)
            label.textAlignment = .center
            label.textColor = .black
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

            thumbnailImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor,width: 0, height:  self.frame.width)

            addSubview(titleLabel)
            titleLabel.anchor(top: thumbnailImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
          //        titleLabel.anchor(top: thumbnailImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)

        }

        func setup<T>(item: T, cellType: RowCellType) {

            guard let song = item as? Song else {return}
            thumbnailImageView.image = UIImage(named: song.thumbnailUrl)
            titleLabel.text = song.title
        }
    }
