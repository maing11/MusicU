//
//  Genre.swift
//  MusicU
//
//  Created by mai ng on 5/28/21.
//

import Foundation

struct  Genre {
    let title: String
    
    static func fetchGenres() -> [Genre] {
        return [
            Genre(title: "Pop"),
            Genre(title: "Country"),
            Genre(title: "Rock"),
            Genre(title: "Jazz")]
    }
    
}
