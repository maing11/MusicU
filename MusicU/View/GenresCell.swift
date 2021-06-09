//
//  GenresCell.swift
//  MusicU
//
//  Created by mai ng on 6/2/21.
//

import UIKit

class GenresCell: UICollectionViewCell {
    static let identifier = "GenresCellID"
    

    private let genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 20)
        
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = UIColor.BlueColor
        label.layer.cornerRadius = 12
        label.textAlignment = .center
        label.minimumScaleFactor = 0.9
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
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
        
        addSubview(genreLabel)
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        genreLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        genreLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        genreLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
      //        titleLabel.anchor(top: thumbnailImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)

    }

    func setup(genre: Genre) {
        genreLabel.text = genre.title
    }
}
