//
//  FastingCollection.swift
//  TestITFactory
//
//  Created by Shaxzod Azamatjonov on 29/07/22.
//

import Foundation
import UIKit

class FastingCollection: BaseCollectionCell<Items> {
    var currentSelected: Int?
    var delegate: AvailabilitySelection?
    let viewModel = MainViewModel()
    lazy var collectionView: UICollectionView = {
        let lay = UICollectionViewFlowLayout()
        lay.scrollDirection = .horizontal
        lay.minimumLineSpacing = 10
        lay.minimumInteritemSpacing = 10
        
        let cl = UICollectionView(frame: .zero, collectionViewLayout: lay)
        cl.delegate = self
        cl.dataSource = self
        cl.showsHorizontalScrollIndicator = false
        cl.allowsMultipleSelection = true
        cl.register(MainCell.self, forCellWithReuseIdentifier: MainCell.reuseIdentifier)
        cl.backgroundColor = .clear
        return cl
    }()
    override func initViews() {
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        DispatchQueue.main.async {
            self.viewModel.index = 1
        }
        viewModel.reloadCollection = { [unowned self] in
            self.collectionView.reloadData()
        }
    }
    
}

extension FastingCollection: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getItemsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.reuseIdentifier, for: indexPath) as! MainCell
        cell.updateUI(with: viewModel.getItem(i: indexPath.item))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width) / 2 , height: 300)
    }

    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if let available = delegate?.isAvailable() {
            return available
        }
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        if let selectedItems = collectionView.indexPathsForSelectedItems {
               if selectedItems.contains(indexPath) {
                   delegate?.decreaseCount()
                   return true
               }
           }
        return false
    }
}
