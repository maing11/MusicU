//
//  Artist.swift
//  MusicU
//
//  Created by mai ng on 5/28/21.
//

import Foundation

struct  Artist {
    let name: String
    let thumbnailUrl: String
//    let largeThumbnailUrl: String
    
    
    static func fetchAllArtist() -> [Artist] {
        return [Artist(name: "The Weeknd", thumbnailUrl: Temporary.artist1),
                Artist(name: "Taylor Swift", thumbnailUrl: Temporary.artist2),
                Artist(name: "Bruno Mars", thumbnailUrl: Temporary.artist3),
                Artist(name: "Justin Bieber", thumbnailUrl: Temporary.artist4),
                Artist(name: "Adele", thumbnailUrl: Temporary.artist5)]
          
    }
}
