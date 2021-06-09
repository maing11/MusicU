//
//  SongContainerVC.swift
//  MusicU
//
//  Created by mai ng on 6/8/21.
//

import UIKit
//import Foundation


class SongContainerVC: UIViewController {
    
    private var songs: [Song]!
    private var index: Int!
    private var playerContainerVC: PlayerContainerVC!
    
    
    let albumtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 17)
        label.textAlignment = .center
        label.textColor = .BlueColor
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.85
        label.lineBreakMode = .byTruncatingTail
        label.text = "Justin"
        
        return label
    }()
    
    private var thumbnailImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
            image.layer.cornerRadius = 15
            image.clipsToBounds = true
            image.contentMode = .scaleToFill
        image.backgroundColor = .black

            return image
        }()
    
    let songTitleLabel: UILabel = {
        let label = UILabel()
       
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Helvetica", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        label.text = "HIHIHIHHI"
        return label
    }()
    
    let artistLabel: UILabel = {
        let label = UILabel()
       
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.textColor = .BlueColor
        label.font = UIFont(name: "Helvetica", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        label.text = "My baby"
        return label
    }()
  

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        configureUI()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    convenience init(songs: [Song], index: Int, controller: PlayerContainerVC) {
//        self.init()
//        self.index = index
//        self.playerContainerVC = controller
//        self.songs = songs
//    }
    
    
    
    func configureUI() {
        view.addSubview(albumtitleLabel)
        albumtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        albumtitleLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        albumtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(thumbnailImageView)
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.topAnchor.constraint(equalTo: albumtitleLabel.bottomAnchor,constant: 29).isActive = true
        thumbnailImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalToConstant: view.frame.width - 60).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalToConstant: view.frame.width - 60).isActive = true
        
        
        view.addSubview(songTitleLabel)
        songTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        songTitleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 30).isActive = true
        songTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(artistLabel)
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.topAnchor.constraint(equalTo: songTitleLabel.bottomAnchor, constant: 3).isActive = true
        artistLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
    
//    func setup(with song: Song?) {
//
//
//
//    }
    
    
}
