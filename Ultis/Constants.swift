//
//  Constants.swift
//  MusicU
//
//  Created by mai ng on 5/28/21.
//

import Foundation
import UIKit

enum Titles {
    // MARK: Tab Bar
    static let explore = "Explore"
    static let trending = "Trending"
    static let search = "Search"
    static let library = "Library"
    static let settings = "Settings"
    
    // MARK: Explore Scene
    static let popular = "Popular"
    static let albums = "Albums"
    static let artist = "ARTIST"
    
    // MARK: Trending Scene
    static let topTrending = "Top Trending - 2021"
    
    // MARK: Music Player Scene
    static let nowPlaying = "NOW PLAYING FROM"
}

enum Temporary {
    static let song1 = "song_1"
    static let song2 = "song_2"
    static let song3 = "song_3"
    static let song4 = "song_4"
    static let song5 = "song_5"
    static let song6 = "placeholder"

    
    
    static let largeSong1 = "large_song_1"
    static let largeSong2 = "large_song_2"
    static let largeSong3 = "large_song_3"
    static let largeSong4 = "large_song_4"
    
    static let album1 = "album_1"
    static let album2 = "album_2"
    static let album3 = "album_3"
    static let album4 = "album_4"
    
    
    static let artist1 = "artisrt_1"
    static let artist2 = "artisrt_2"
    static let artist3 = "artisrt_3"
    static let artist4 = "artisrt_4"
    static let artist5 = "artisrt_5"

    static let artistLarge1 = "artist_thumbnail_1"

    
}

enum RowCellType: String {
    case recentlyPlayed = "Recently Played"
    case recommendedForYou = "Recommend For You"
    case getInspired = "Get Inspired "
    case popularArtists = "Popular Artists"
    case genres = "Genres"

}


enum UnknowImaged {
    static let placeholder  = UIImage(named: "Blue_MusicNote")
    
}
