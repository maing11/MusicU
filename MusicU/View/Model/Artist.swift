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
    let largeThumbnailUrl: String
    
    
    static func fetchAllArtist() -> [Artist] {
        return [
            Artist(name: "Wiz Khalifa", thumbnailUrl: Temporary.artist1, largeThumbnailUrl: Temporary.artistLarge1),
            Artist(name: "Ed Sheeran", thumbnailUrl: Temporary.artist2, largeThumbnailUrl:Temporary.artistLarge1),
            Artist(name: "Bruno Mars", thumbnailUrl: Temporary.artist3, largeThumbnailUrl:Temporary.artistLarge1),
            Artist(name: "Pink Sweats", thumbnailUrl: Temporary.artist4, largeThumbnailUrl: Temporary.artistLarge1),
            Artist(name: "Olivia Rodrigo", thumbnailUrl: Temporary.artist5, largeThumbnailUrl: Temporary.artistLarge1),
            Artist(name: "Doja Cat", thumbnailUrl: Temporary.artist2, largeThumbnailUrl: Temporary.artistLarge1)
            ]
    }
}
