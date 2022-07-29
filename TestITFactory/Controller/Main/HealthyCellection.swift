//
//  HealthyCellection.swift
//  TestITFactory
//
//  Created by Shaxzod Azamatjonov on 29/07/22.
//

import UIKit

class HealthyCollection: BaseCollectionCell<Items> {
    
    var currentSelected: Int?
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
            self.viewModel.index = 2
        }
        viewModel.reloadCollection = { [unowned self] in
            self.collectionView.reloadData()
        }
    }
    
}

extension HealthyCollection: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getItemsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.reuseIdentifier, for: indexPath) as! MainCell
        cell.updateUI(with: viewModel.getItem(i: indexPath.item))
        cell.setBackground(isSelected: currentSelected == indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width) / 2 , height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentSelected = indexPath.item
        self.collectionView.reloadData()
    }
}
