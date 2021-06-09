//
//  File.swift
//  MusicU
//
//  Created by mai ng on 5/29/21.
//

import Foundation



enum FileType: String {
    case mp3 = "mp3"
    case acc = "acc"
    case wmv = "wmv"
}

struct File {
    let name: String
    let type: FileType.RawValue
}
