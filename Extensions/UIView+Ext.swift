//
//  UIView+Ext.swift
//  MusicU
//
//  Created by mai ng on 6/9/21.
//

import Foundation


extension Double {
    func getTimeFormat() -> String {
        let minutes = Int(self) / 60
        let seconds = Int(self) % 60 < 10 ? "0\(Int(self) % 60)" : "\(Int(self) % 60)"
        return "\(minutes):\(seconds)"
    }
}
