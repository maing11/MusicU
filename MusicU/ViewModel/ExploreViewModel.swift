//
//  ExploreViewModel.swift
//  MusicU
//
//  Created by mai ng on 5/29/21.
//

import Foundation


class ExploreViewModel {
    
    enum sectionType: Int {
        case recentlyPlayed = 0
        case recommendedForYou = 1
        case getInspired = 2
        case popularArtists = 3
        case genres = 4
        
    }
    
    
    struct Section {
        var sectionType: sectionType
        var index: Int
    }
    
    
    lazy var sections: [Section] = {
        var data = [Section]()
        
        let recentlyPlayedSection = Section(sectionType: .recentlyPlayed, index: 0)
        let recommendedForYouSection = Section(sectionType: .recommendedForYou, index: 1)
        let getInspiredSection = Section(sectionType: .getInspired, index: 2)
        let popularArtists = Section(sectionType: .popularArtists, index: 3)
        let genreSection = Section(sectionType: .genres, index: 4)

        
        
        data.append(recentlyPlayedSection)
        data.append(recommendedForYouSection)
        data.append(getInspiredSection)
        data.append(popularArtists)
        data.append(genreSection)
       
        return data
    }()
    
}
