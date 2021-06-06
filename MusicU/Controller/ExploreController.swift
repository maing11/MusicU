//
//  ExploreController.swift
//  MusicU
//
//  Created by mai ng on 5/28/21.
//

import Foundation
import UIKit

class ExploreController: UIViewController {

    private var viewModel = ExploreViewModel()
    
    
    private var collectionView: UICollectionView!
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)

        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.left

        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        label.lineBreakMode = .byTruncatingTail
        label.text = "Explore"

        return label
    }()
    
    func createFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 28, right: 16)
        return flowLayout
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        
    }
    
    func configureUI() {
        view.backgroundColor = .BlueColor
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: createFlowLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .yellow
        collectionView.register(ExploreRowCell.self, forCellWithReuseIdentifier: ExploreRowCell.identifier)
////
        view.addSubviews( titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 23).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
//
//        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 23, paddindLeft: 16,paddingBottom: 0, paddingRight: 0, width: 0, height: 44)
////
//        (top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padding: .init(top: 23, left: 16, bottom: 16, right: 0), size: .init(width: 0, height: 44))

        view.addSubviews( collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            collectionView.topAnchor.constraint(equalTo:titleLabel.bottomAnchor,constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
             ])
//            (top: titleLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 100, right: 0))
            
        
    }

}

//
extension ExploreController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreRowCell.identifier, for: indexPath) as! ExploreRowCell
   //        cell.backgroundColor = .systemPink
   //                return cell
        switch viewModel.sections[indexPath.section].sectionType {
        case .recentlyPlayed:
            cell.setup(cellType: .recentlyPlayed)
        case .recommendedForYou:
            cell.setup(cellType: .recommendedForYou)
        case .getInspired:
            cell.setup(cellType: .getInspired)
        case .popularArtists:
            cell.setup(cellType: .popularArtists)
        case .genres:
            cell.setup(cellType: .genres)

        }
        return cell

    }
    
}

extension ExploreController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        let width = UIScreen.main.bounds.size.width - (flowLayout.sectionInset.left + flowLayout.sectionInset.right)
        let padding: CGFloat = 0
        
        switch viewModel.sections[indexPath.section].sectionType {
        case .recentlyPlayed:
            return CGSize(width: width, height: 180 + padding)
        case .recommendedForYou:
            return CGSize(width: width, height: 272 + padding)
        case .getInspired:
            return CGSize(width: width, height: 276 + padding)
        case .popularArtists:
            return CGSize(width: width, height: 180 + padding)
        case .genres:
            return CGSize(width: width, height: 110 + padding)
        }
}
}

