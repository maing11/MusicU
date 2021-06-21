//
//  PlayerViewController.swift
//  MusicU
//
//  Created by mai ng on 6/8/21.
//

import UIKit

class PlayerViewController: UIViewController {
    
    private let songContainer = UIView()
    private let playContainer = UIView()
    private var songs: [Song]!
    private var index: Int!
    
    private let collapseButton: UIButton = {
        let bt = UIButton(frame: .zero)
        bt.setImage(Asserts.collapse, for: .normal)
        bt.addTarget(self, action: #selector(press), for: .touchUpInside)
        
        return bt
        
    }()
    
    private let optionButton: UIButton = {
        let bt = UIButton(frame:.zero)
        bt.setImage(Asserts.option, for: .normal)
        bt.addTarget(self, action: #selector(showOption), for: .touchUpInside)
        return bt
    }()
    
    
    private let nowPlayingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "Marion-Bold", size: 13)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.85
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byTruncatingTail
        label.text = "NOW PLAYING FROM"
        label.alpha = 0.5
        
        return label
        
    }()
    
    private lazy var SongContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
        
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(songs: [Song], index: Int) {
        self.init()
        self.songs = songs
        self.index = index
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        
    }
    
    @objc func press() {
    print("me ....me")
        
    }

    @objc func showOption() {
        print("Hello")
    }
    

     @objc func dismissButton() {
        self.dismiss(animated: true)
        
    }
    
    func configureUI() {
         
        
        
        view.addSubview(collapseButton)
        collapseButton.translatesAutoresizingMaskIntoConstraints = false
        collapseButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 29).isActive = true
        collapseButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 69).isActive = true
        collapseButton.heightAnchor.constraint(equalToConstant: 20/2).isActive = true
        collapseButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        collapseButton.addTarget(self, action: #selector(dismissButton), for: .touchUpInside)

        
        view.addSubview(optionButton)
        optionButton.translatesAutoresizingMaskIntoConstraints = false
        optionButton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -25).isActive = true
        optionButton.topAnchor.constraint(equalTo: collapseButton.topAnchor,constant: -5).isActive = true
        optionButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        optionButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        view .addSubview(nowPlayingLabel)
        nowPlayingLabel.translatesAutoresizingMaskIntoConstraints = false
        nowPlayingLabel.topAnchor.constraint(equalTo: collapseButton.topAnchor).isActive = true
        nowPlayingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nowPlayingLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
        nowPlayingLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true


        view.addSubview(songContainer)
        songContainer.translatesAutoresizingMaskIntoConstraints = false
        songContainer.topAnchor.constraint(equalTo: nowPlayingLabel.bottomAnchor, constant: 0).isActive = true
        songContainer.leftAnchor.constraint(equalTo: collapseButton.leftAnchor).isActive = true
        songContainer.rightAnchor.constraint(equalTo: optionButton.rightAnchor).isActive = true
        songContainer.heightAnchor.constraint(equalTo:  songContainer.widthAnchor,multiplier: 451/317).isActive = true
        

        view.addSubview(playContainer)
        playContainer.translatesAutoresizingMaskIntoConstraints = false
        playContainer.topAnchor.constraint(equalTo: songContainer.bottomAnchor, constant: 20).isActive = true
        playContainer.leftAnchor.constraint(equalTo: songContainer.leftAnchor).isActive = true
        playContainer.rightAnchor.constraint(equalTo: songContainer.rightAnchor).isActive = true
        playContainer.heightAnchor.constraint(equalTo: playContainer.widthAnchor,multiplier: 197/317).isActive = true
        
        let playContainerVC = PlayerContainerVC(songs: songs, index: index)

        let songContainerVC = SongContainerVC(songs: songs, index: index, controller: playContainerVC)
        
        addContainerVC(childVC: songContainerVC, to:songContainer)
        addContainerVC(childVC: playContainerVC, to: playContainer)
//        self.addChild(songContainerVC)
//        view.addSubview(songContainerVC.view)
//        songContainerVC.view.frame = view.bounds
//        songContainerVC.didMove(toParent: self)
        
        
    
    }
    
    func addContainerVC(childVC: UIViewController, to containerView: UIView) {
        self.addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
}
