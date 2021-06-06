//
//  Extension.swift
//  MusicU
//
//  Created by mai ng on 5/30/21.
//

import UIKit
struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

extension UIView {
    
    
   

    func addSubviews(_ views: UIView...) {
        for view in views {addSubview(view) }
    }

    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddindLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddindLeft).isActive = true
        }
        if let bottom = bottom {
            topAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }

        if let width = width  {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }

    }
//
//    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
//
//        translatesAutoresizingMaskIntoConstraints = false
//        var anchoredConstraints = AnchoredConstraints()
//
//        if let top = top {
//            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
//        }
//
//        if let leading = leading {
//            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
//        }
//
//        if let bottom = bottom {
//            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
//        }
//
//        if let trailing = trailing {
//            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
//        }
//
//        if size.width != 0 {
//            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
//        }
//
//        if size.height != 0 {
//            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
//        }
//
//        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }
//
//        return anchoredConstraints
//    }

    func setDimensions(width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
//    func addConstraintsToFillView(_ view: UIView) {
//        translatesAutoresizingMaskIntoConstraints = false
//        anchor(top: view.topAnchor, left: view.leftAnchor,
//               bottom: view.bottomAnchor, right: view.rightAnchor)
//    }
}


extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
}
 
    static let BlueColor = UIColor.rgb(red: 29, green: 161, blue: 242)
}
