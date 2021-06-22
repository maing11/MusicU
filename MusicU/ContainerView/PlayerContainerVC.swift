//
//  PlayerContainerVC.swift
//  MusicU
//
//  Created by mai ng on 6/8/21.
//

import UIKit
import AVFoundation

protocol PlayerContainerDelegate: class {
    func buttonPressed(index: Int)
}



class PlayerContainerVC: UIViewController {
    
    private let slider = MUSlider(frame: .zero)
    
    private let sliderMinLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 11)
        label.textAlignment = .left
        label.textColor = .BlueColor
        label.text  = "Hi"
        
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.85
        label.lineBreakMode = .byTruncatingTail
        
        return label
    }()
    
    
    private let sliderMaxLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 11)
        label.textAlignment = .left
        label.textColor = .BlueColor
        label.text = "Ha"
        
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.85
        label.lineBreakMode = .byTruncatingTail
        
        return label
    }()
    
    private let playButton = MUButton(assert: Asserts.pause)
    
    
    private let forwardButton = MUButton(assert: Asserts.forward)
    private let rewindButton = MUButton(assert: Asserts.rewind)
    private let forward10Button = MUButton(assert: Asserts.forward10)
    private let rewind10Button = MUButton(assert: Asserts.rewind10)
    
    
    private let favourite = MUButton(assert: Asserts.favorite,contentMode: .scaleAspectFit)
    private let repeatbt = MUButton(assert: Asserts.repeatbt,contentMode: .scaleAspectFit)
    private let playlist = MUButton(assert: Asserts.playlist,contentMode: .scaleAspectFit)
    private let shuffle = MUButton(assert: Asserts.shuffle,contentMode: .scaleAspectFit)
    
    private var songs: [Song]!
    private var index: Int!
    
    var player: AVAudioPlayer!
    var playerContainerDelegate: PlayerContainerDelegate?

    
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(songs: [Song], index: Int) {
        self.init()
        self.songs = songs
        self.index = index
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIButton()
        configureUISlider()
        configureStackView()
        
        prepareSongSesstion(song: songs[index])
        configureSongPlayer()
        
        configureForwardButtonAction()
        configureRewindButtonAction()
        
        configureForward10()
        configureRewind10()
    }
    
    
    @objc func sliderChanged() {
        sliderMinLabel.text = Double(slider.value).getTimeFormat()
        
        player?.stop()
        player?.currentTime = TimeInterval(slider.value)
        player?.play()
        
    }
    @objc func updateSLider() {
        if player.isPlaying {
            sliderMinLabel.text = player.currentTime.getTimeFormat()
            slider.value = Float(Int(player.currentTime))
        }
    }
    
    
    
    func prepareSongSesstion(song: Song) {
        guard let urlString = Bundle.main.path(forResource: song.file.name, ofType: song.file.type) else {return}

        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            player.play()

                        
            do { try AVAudioSession.sharedInstance().setCategory(.playback) }
            catch let sessionError { print("Session Error: \(sessionError)") }
            
        } catch let playerError { print("Song Player Error: \(playerError)") }
    }

    func configureSongPlayer() {
        player.play()
        
        slider.maximumValue = Float(Int(player.duration))
        sliderMinLabel.text = player.currentTime.getTimeFormat()
        sliderMaxLabel.text = player.duration.getTimeFormat()
        true
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateSLider), userInfo: nil, repeats: true)
        
        playButton.action = {() in
            if self.player.isPlaying {
                self.playButton.placeHolderImageView.image = Asserts.play
                self.player.pause()
            } else {
                self.playButton.placeHolderImageView.image = Asserts.pause
                self.player.play()
            }
        }
    }
    
    func configureUISlider() {
        
        slider.minimumValue = 0
        slider.isContinuous = true
        slider.layer.cornerRadius = 30
        slider.tintColor = .BlueColor
        
        slider.setThumbImage(Asserts.sliderThumb, for: .normal)
        slider.setThumbImage(Asserts.sliderThumb, for: .highlighted)
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        
        view.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        slider.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        slider.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        slider.heightAnchor.constraint(equalToConstant: view.frame.width * 12 / 317).isActive = true


        view.addSubview(sliderMinLabel)
        sliderMinLabel.translatesAutoresizingMaskIntoConstraints = false
        sliderMinLabel.topAnchor.constraint(equalTo: slider.bottomAnchor,constant: 8).isActive = true
        sliderMinLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true


        view.addSubview(sliderMaxLabel)
        sliderMaxLabel.translatesAutoresizingMaskIntoConstraints = false
        sliderMaxLabel.topAnchor.constraint(equalTo: slider.bottomAnchor,constant: 8).isActive = true
        sliderMaxLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
    }
    
    func configureUIButton() {
        
        
        view.addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 30).isActive = true
        playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playButton.setDimensions(width: 70, height: 70)


        view.addSubview(forwardButton)
        forwardButton.translatesAutoresizingMaskIntoConstraints = false
        forwardButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        forwardButton.leftAnchor.constraint(equalTo: playButton.rightAnchor,constant: 25).isActive = true

        view.addSubview(rewindButton)
        rewindButton.translatesAutoresizingMaskIntoConstraints = false
        rewindButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        rewindButton.rightAnchor.constraint(equalTo: playButton.leftAnchor,constant: -25).isActive = true


        view.addSubview(rewind10Button)
        rewind10Button.translatesAutoresizingMaskIntoConstraints = false
        rewind10Button.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        rewind10Button.rightAnchor.constraint(equalTo: rewindButton.leftAnchor, constant: -30).isActive = true
        rewind10Button.setDimensions(width: 25, height: 25)

        view.addSubview(forward10Button)
        forward10Button.translatesAutoresizingMaskIntoConstraints = false
        forward10Button.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        forward10Button.leftAnchor.constraint(equalTo: forwardButton.rightAnchor, constant: 30).isActive = true
        forward10Button.setDimensions(width: 25, height: 25)

    }
    
    func configureStackView() {
        
        let value: CGFloat = 0.5
        favourite.alpha = value
        shuffle.alpha = value
        repeatbt.alpha = value
        playlist.alpha = value

        let stackViewButton = UIStackView(arrangedSubviews: [favourite, shuffle,repeatbt,playlist])
        stackViewButton.axis = .horizontal
        stackViewButton.distribution = .fillProportionally


        view.addSubview(stackViewButton)
        stackViewButton.translatesAutoresizingMaskIntoConstraints = false
        stackViewButton.topAnchor.constraint(equalTo: playButton.bottomAnchor,constant: 25).isActive = true
//        stackViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackViewButton.leftAnchor.constraint(equalTo: rewind10Button.leftAnchor).isActive = true
        stackViewButton.rightAnchor.constraint(equalTo:forward10Button.rightAnchor).isActive = true
        stackViewButton.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
    @objc func didTapButton() {
        
    }
    
    func configureForwardButtonAction() {
        forwardButton.action = { [self]() in
            if self.index == songs.count - 1 {
                self.index = 0
            } else {
                self.index = index + 1
            }
            playerContainerDelegate?.buttonPressed(index: index)
            playOtherSong()
            
        }
    }
    
    func configureRewindButtonAction() {
        rewindButton.action = {() in
            if self.index == 0 {
                self.index = self.songs.count - 1
            } else {
                self.index = self.index - 1
            }
            self.playerContainerDelegate?.buttonPressed(index: self.index)
            self.playOtherSong()
        }
    }
     
    
    func playOtherSong() {
        player.stop()
        prepareSongSesstion(song: songs[index])
        player.play()
    }
    
    
    func configureForward10() {
        forward10Button.action = { () in
            self.player.stop()
            var time = self.player.currentTime
            time = time + 10
            
            if time > self.player.duration {
                self.player.currentTime = self.player.duration
                self.slider.value = Float(self.player.duration)
                self.player.stop()
            } else {
                self.player.currentTime = time
            }
            self.player.play()
            self.slider.value = Float(Int(self.player.currentTime))
            self.sliderMinLabel.text = self.player.currentTime.getTimeFormat()
            
        }
    }
    
    
    func configureRewind10() {
        rewind10Button.action = { () in
            self.player.stop()
            var time = self.player.currentTime
            time = time - 10
            
            if time < 0 {
                self.player.currentTime  = 0
            } else {
                self.player.currentTime = time
            }
            self.player.play()
            self.slider.value = Float(Int(self.player.currentTime))
            self.sliderMinLabel.text = self.player.currentTime.getTimeFormat()
        }
    }
}

