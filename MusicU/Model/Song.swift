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
    let album: String
    let thumbnailUrl: String
//    let numberOfPlays: Int
    let file: File
    
    
    static func fetchSongs() -> [Song] {
        return [
            
            Song(title: "Say So", artist: "Doja Cat", album: "Hot Pink", thumbnailUrl:Temporary.song1,file: File(name: "SaySo", type: FileType.mp3.rawValue)),
            
            
            Song(title: "Drivers License", artist: "Olivia", album: "Sour", thumbnailUrl:Temporary.song2,file: File(name: "DriversLicense", type: FileType.mp3.rawValue)),
            
            Song(title: "Perfect", artist: "Ed Sheeran", album: "÷", thumbnailUrl:Temporary.song3,file: File(name: "Perfect", type: FileType.mp3.rawValue)),
            
            
            Song(title: "Thank U, next", artist: "Ariana Grande", album: "Thank u, next", thumbnailUrl:Temporary.song4,file: File(name: "ThankUNext", type: FileType.mp3.rawValue)),
            
            Song(title: "Count On Me", artist: "DIVINE", album: "Doo-Wops & Hooligans", thumbnailUrl:Temporary.song5,file: File(name: "CountOnMe", type:  FileType.mp3.rawValue)),
            
            Song(title: "See You Again", artist: "Charlie Puth", album: "Furious 7: Original Motion Picture Soundtrack", thumbnailUrl: Temporary.song6, file: File(name: "SeeYouAgain", type:  FileType.mp3.rawValue))
        ]
    }
    
    
    static func fetchRecommendForYouSongs() -> [Song] {
            
//            Song(title: "Say So", artist: "Doja Cat", album: "Hot Pink", thumbnailUrl:Temporary.song1,file: File(name: "SaySo", type: FileType.mp3.rawValue)),
//
//
//            Song(title: "Drivers License", artist: "Olivia", album: "Sour", thumbnailUrl:Temporary.song2,file: File(name: "DriversLicense", type: FileType.mp3.rawValue)),
//
//            Song(title: "Perfect", artist: "Ed Sheeran", album: "÷", thumbnailUrl:Temporary.song3,file: File(name: "Perfect", type: FileType.mp3.rawValue)),
//
//
//            Song(title: "Thank U, next", artist: "Ariana Grande", album: "Thank u, next", thumbnailUrl:Temporary.song4,file: File(name: "ThankUNext", type: FileType.mp3.rawValue)),
//
//            Song(title: "Count On Me", artist: "DIVINE", album: "Doo-Wops & Hooligans", thumbnailUrl:Temporary.song5,file: File(name: "CountOnMe", type:  FileType.mp3.rawValue)),
//
//            Song(title: "See You Again", artist: "Charlie Puth", album: "Furious 7: Original Motion Picture Soundtrack", thumbnailUrl: Temporary.song6, file: File(name: "SeeYouAgain", type:  FileType.mp3.rawValue))
//        ]
        return [
            Song(title: "I'm a mess", artist: "Bebe Rexha", album: "Expectations", thumbnailUrl: Temporary.RCSong1, file: File(name:"ImAMess", type: FileType.mp3.rawValue)),
            Song(title: "Yummy", artist: "Justin Bieber", album: "Unknow", thumbnailUrl: Temporary.RCSong2, file: File(name: "Yummy", type: FileType.mp3.rawValue)),
            Song(title: "2002", artist: "Anne Marie", album: "Speak Your Mind", thumbnailUrl: Temporary.RCSong3, file: File(name: "2002", type: FileType.mp3.rawValue)),
            Song(title: "Havana", artist: "Camila Cabello", album: "Camila", thumbnailUrl: Temporary.RCSong4, file: File(name: "Havana", type: FileType.mp3.rawValue)),
            Song(title: "Memories", artist: "Adam Levine", album: "Unknow", thumbnailUrl: Temporary.RCSong5, file: File(name: "Memories", type: FileType.mp3.rawValue)),
        ]
        
    }
    
}

