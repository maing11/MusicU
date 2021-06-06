//
//  MUThumbnailImageView.swift
//  MusicU
//
//  Created by mai ng on 6/4/21.
//

import UIKit



class MUThumbnailImageView: UIImageView {
    
    // MARK: Properties
    private let placeholderImage = UIImage(named: "placeholder")

    
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    convenience init(radius: CGFloat) {
        self.init(frame: .zero)
        layer.cornerRadius = radius
    }
}


// MARK: - Fileprivate Methods
fileprivate extension MUThumbnailImageView {
    
    func configure() {
        layer.cornerRadius = 15
        clipsToBounds = true
        image = placeholderImage
        contentMode = .scaleAspectFit
    }
}
