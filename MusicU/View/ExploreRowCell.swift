//
//  ExploreRowCell.swift
//  MusicU
//
//  Created by mai ng on 5/30/21.
//

import Foundation
import UIKit
//
class ExploreRowCell: UICollectionViewCell {

    static let identifier = "RowCell"

    private var collectionView: UICollectionView!
            

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.left

        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        label.lineBreakMode = .byTruncatingTail

        return label
    }()

    private var recentlyPlayedSongs = [Song]()
    private var recommendedForYouSongs = [Song]()
    private var albums = [Album]()
    private var artists = [Artist]()
    private var genre = [Genre]()
    private var cellType: RowCellType!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        fetchData()
        setUpCollectioView()
        configureUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.minimumLineSpacing = 10
        return flowLayout
    }
    
    func setUpCollectioView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.clipsToBounds = true
        
    
        collectionView.register(RecentlyPlayedCell.self, forCellWithReuseIdentifier: RecentlyPlayedCell.identifier)
        
        collectionView.register(RecommendedCell.self, forCellWithReuseIdentifier: RecommendedCell.identifier)

        collectionView.register(GetInspiredCell.self, forCellWithReuseIdentifier: GetInspiredCell.identifier)

        collectionView.register(PopularArtistCell.self, forCellWithReuseIdentifier: PopularArtistCell.identifier)
        
        collectionView.register(GenresCell.self, forCellWithReuseIdentifier: GenresCell.identifier)



    }
    
//    func navigateTo(viewController: UIViewController) {
//        viewController.modalPresentationStyle = .overCurrentContext
//        self.window?.rootViewController?.present(viewController, animated: true, completion: nil)
//    }
  
//        anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 18, left: 0, bottom: 0, right: 0))

    

  
    
    func fetchData() {
        recentlyPlayedSongs = Song.fetchSongs()
        recommendedForYouSongs = Song.fetchRecommendForYouSongs()
        albums = Album.fetchAlbums()
        artists = Artist.fetchAllArtist()
        genre = Genre.fetchGenres()

    }
    
    func setup(cellType: RowCellType) {
           self.cellType = cellType
           titleLabel.text = cellType.rawValue
       }
    
    
    private func configureUI() {
        addSubviews(titleLabel)
//        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right:  rightAnchor,width: 0, height: 20)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor ).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true


        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 18).isActive = true
//        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo:rightAnchor),
            collectionView.topAnchor.constraint(equalTo:titleLabel.bottomAnchor,constant: 18),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 0)
             ])
    }
  
    
}

extension ExploreRowCell {
    
    
    func goToPlayerVC(with songs: [Song], index: Int) {
        
        let controller = PlayerViewController(songs: songs, index: index)
        controller.modalPresentationStyle = .overCurrentContext
        self.window?.rootViewController?.present(controller, animated: true, completion: nil)

    }



func navigate(viewController: UIViewController) {
    viewController.modalPresentationStyle = .overCurrentContext
    self.window?.rootViewController?.present(viewController, animated: true, completion: nil)
}

}
 


// UICollectionView DataSource

extension ExploreRowCell: UICollectionViewDataSource {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch cellType {
            case .recentlyPlayed:
            return recentlyPlayedSongs.count
                
        case .recommendedForYou:
            return recommendedForYouSongs.count
            
        case .getInspired:
            return albums.count
            
        case .popularArtists:
            return artists.count
            
        case .genres:
            return genre.count
      
        case .none:
            return 0


    }
}
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            switch cellType {
            case .recentlyPlayed:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentlyPlayedCell.identifier, for: indexPath) as! RecentlyPlayedCell
                cell.setup(song:recentlyPlayedSongs[indexPath.item])
                return cell
                
            case .recommendedForYou:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedCell.identifier, for: indexPath) as! RecommendedCell
                cell.setup(song: recommendedForYouSongs[indexPath.item])
                return cell
                
            case .getInspired:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GetInspiredCell.identifier, for: indexPath) as! GetInspiredCell
                cell.setup(album: albums[indexPath.item])
                return cell
                
            case .popularArtists:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularArtistCell.identifier, for: indexPath) as! PopularArtistCell
                cell.setup(artist: artists[indexPath.item])
                return cell
                
            case .genres:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenresCell.identifier, for: indexPath) as! GenresCell
                cell.setup(genre: genre[indexPath.row])
                return cell
               
            case .none:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentlyPlayedCell.identifier, for: indexPath) as! RecentlyPlayedCell
                cell.setup(song:recentlyPlayedSongs[indexPath.item])
                return cell
            }
        }
    
    }
    

    extension ExploreRowCell: UICollectionViewDelegateFlowLayout{
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
                switch cellType {
            case .recentlyPlayed:
                return CGSize(width: 114.5, height: 140)
            case .recommendedForYou:
                return CGSize(width: 180, height: 232)
            case .getInspired:
                return CGSize(width: 180, height: 236)
            case .popularArtists:
                return CGSize(width: 114.5, height: 140)
            case .genres:
                return CGSize(width: 148, height: 70)

            case .none:
                return CGSize(width: 0, height: 0)
            }
        }
    }
   

extension ExploreRowCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch cellType {
        case .recentlyPlayed:
            goToPlayerVC(with: recentlyPlayedSongs, index: indexPath.item)
            
        case .recommendedForYou:
            goToPlayerVC(with: recommendedForYouSongs, index: indexPath.item)
            
        case .popularArtists:
            goToPlayerVC(with: recentlyPlayedSongs, index: indexPath.item)
           
        default: break
        }
    }
}
    

