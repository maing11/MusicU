//
//  Label.swift
//  MusicU
//
//  Created by mai ng on 6/5/21.
//

import Foundation
import UIKit

class Label: UILabel {
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    convenience init(fontSize: CGFloat, textColour: UIColor = .black, alignment: NSTextAlignment = .left) {
        self.init(frame: .zero)
        let traits = [UIFontDescriptor.TraitKey.weight: UIFont.Weight.bold]
        var descriptor = UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.family: "Poppins"])
        descriptor = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits: traits])

        font = UIFont(descriptor: descriptor, size: fontSize)
        textColor = textColour
        textAlignment = alignment
    }
}


// MARK: - Fileprivate Methods
fileprivate extension Label {
    
    func configure() {
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
    }
}
