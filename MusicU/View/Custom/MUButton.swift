//
//  MUButton.swift
//  MusicU
//
//  Created by mai ng on 6/9/21.
//

import UIKit

class MUButton: UIView {
  
    let button = UIButton(frame: .zero)
    let placeHolderImageView = UIImageView(frame: .zero)
    var action: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    
    convenience init(assert: UIImage, contentMode: UIView.ContentMode = .scaleAspectFit) {
        self.init(frame:.zero)
        placeHolderImageView.image = assert
        placeHolderImageView.contentMode = contentMode
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPressed() {
        action?()    }
    
    
    func configureUI() {
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        addSubview(placeHolderImageView)
        
        placeHolderImageView.translatesAutoresizingMaskIntoConstraints = false
        placeHolderImageView.topAnchor.constraint(equalTo: topAnchor ).isActive = true
        placeHolderImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        placeHolderImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        placeHolderImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: topAnchor ).isActive = true
        button.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
}
