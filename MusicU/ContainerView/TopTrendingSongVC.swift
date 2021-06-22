//
//  TopTrendingSongVC.swift
//  MusicU
//
//  Created by mai ng on 6/21/21.
//

import UIKit


class TopTrendingSongVC: UIViewController, UICollectionViewDelegate {
    private let viewModel = TopTrendingViewModel()
    
    private var collecionView: UICollectionView!
    private var topTrendingSongs: [TopTrendingSong] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchtopTrendingSong()
    }
    
    func configureUI() {
        
        collecionView = UICollectionView(frame: .zero, collectionViewLayout: createFlowLayout())
        collecionView.dataSource = self
        collecionView.delegate = self
        collecionView.register(TrendingCell.self, forCellWithReuseIdentifier: TrendingCell.identifier)
        collecionView.backgroundColor = .systemBackground
        
        view.addSubview(collecionView)
        collecionView.translatesAutoresizingMaskIntoConstraints = false
        collecionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collecionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collecionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collecionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true


        
    }
    
    func createFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.minimumLineSpacing = 20.7
        return flowLayout
    }
    
    func fetchtopTrendingSong() {
        topTrendingSongs = TopTrendingSong.fetchTopTrendingSongs()
    }


}

extension TopTrendingSongVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        topTrendingSongs.count
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingCell.identifier, for: indexPath) as! TrendingCell
        
        cell.setUpUI(topTrendingSong: topTrendingSongs[indexPath.item])
        return cell
    }
    
    
}

extension TopTrendingSongVC:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 115)
    }
}
