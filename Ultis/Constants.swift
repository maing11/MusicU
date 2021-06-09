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
    static let song6 = "song_6"

    
    
    static let RCSong1 = "RC_song1"
    static let RCSong2 = "RC_song2"
    static let RCSong3 = "RC_song3"
    static let RCSong4 = "RC_song4"
    static let RCSong5 = "RC_song5"

    
    static let album1 = "album1"
    static let album2 = "album2"
    static let album3 = "album3"
    static let album4 = "album4"
    static let album5 = "album5"
    
    static let artist1 = "Artist_1"
    static let artist2 = "Artist_2"
    static let artist3 = "Artist_3"
    static let artist4 = "Artist_4"
    static let artist5 = "Artist_5"

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

enum Asserts {
    static let collapse = UIImage(named: "expand_arrow")!
    static let option = UIImage(named: "more_horid")
    static let forward = UIImage(named: "Fast_forward")
    static let rewind  = UIImage(named: "Fast_rewind")
    static let forward10 = UIImage(named: "forward_10")
    static let rewind10 = UIImage(named: "rewind_10")
    static let play = UIImage(named: "play_blue")
    static let pause = UIImage(named: "pause_blue")
    static let favorite = UIImage(named: "Favorite")
    static let repeatbt = UIImage(named: "repeat")
    static let playlist = UIImage(named: "addPlayList")
    static let shuffle = UIImage(named: "shuffleic")
    }
