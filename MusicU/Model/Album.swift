//
//  Album.swift
//  MusicU
//
//  Created by mai ng on 5/28/21.
//

import Foundation


struct Album {
    let title: String
    let artist: String
    let thumbnailUrl: String
    
    static func fetchAlbums() -> [Album] {
        return [
            Album(title: "Future Nostalgia", artist: "Dua Lipa" , thumbnailUrl: Temporary.album1),
            Album(title: "Lover", artist: "Taylor Swift", thumbnailUrl: Temporary.album2),
            Album(title: "Map Of The Soul 7", artist: "BTS", thumbnailUrl: Temporary.album3),
            Album(title: "Camila", artist: "Camila Cabello", thumbnailUrl: Temporary.album4),
            Album(title: "Home Coming", artist: "Beyonce", thumbnailUrl: Temporary.album5)

        ]
    }

    
}
