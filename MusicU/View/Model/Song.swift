//
//  Song.swift
//  MusicU
//
//  Created by mai ng on 5/28/21.
//

import Foundation

struct Song {
    let title: String
    let artist: String
//    let album: String
    let thumbnailUrl: String
//    let numberOfPlays: Int
    let file: File
    
    
    static func fetchSongs() -> [Song] {
        return [

            Song(title: "See You Again", artist: "Charlie Puth", thumbnailUrl: Temporary.song1, file: File(name: "SeeYouAgain", type: FileType.mp3.rawValue)),
            
            Song(title: "Drivers License", artist: "Olivia", thumbnailUrl:Temporary.song2,file: File(name: "DriversLicense", type: FileType.mp3.rawValue)),
            
            Song(title: "Thank You, next", artist: "Ariana Grande", thumbnailUrl:Temporary.song3,file: File(name: "ThankUNext", type: FileType.mp3.rawValue)),
            
            Song(title: "Perfect", artist: "Ed Sheeran", thumbnailUrl:Temporary.song4,file: File(name: "Perfect", type: FileType.mp3.rawValue)),
            
            Song(title: "Count On Me", artist: "DIVINE", thumbnailUrl:Temporary.song5,file: File(name: "CountOnMe", type: FileType.mp3.rawValue)),
            
            Song(title: "Say So", artist: "Doja Cat", thumbnailUrl:Temporary.song6,file: File(name: "SaySo", type: FileType.mp3.rawValue))
        ]
    }
    
}
