//
//  PopularArtistCell.swift
//  MusicU
//
//  Created by mai ng on 6/2/21.
//

import UIKit

class PopularArtistCell: UICollectionViewCell {
    static let identifier = "PopularArtistCellID"
    
    private let thumbnailImageView: UIImageView = {
        var image = UIImageView()
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill

        return image
    }()

    private let artistLabel: UILabel = {
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
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        thumbnailImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        thumbnailImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        
//        thumbnailImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor,width: 0, height:  self.frame.width)

        addSubview(artistLabel)
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor,constant: 8).isActive = true
        artistLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        artistLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        artistLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

  
    }

    func setup(artist: Artist) {
        thumbnailImageView.image = UIImage(named: artist.thumbnailUrl)
        artistLabel.text = artist.name
    }
}
