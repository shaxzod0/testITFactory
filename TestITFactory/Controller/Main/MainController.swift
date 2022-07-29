//
//  MainController.swift
//  TestITFactory
//
//  Created by Shaxzod Azamatjonov on 29/07/22.
//

import UIKit

class MainController: BaseViewController {
    let viewModel = MainViewModel()
    lazy var collectionView: UICollectionView = {
        let l = UICollectionViewFlowLayout()
        l.scrollDirection = .vertical
        l.minimumLineSpacing = 0
        l.minimumInteritemSpacing = 0
        let cl = UICollectionView(frame: .zero, collectionViewLayout: l)
        cl.delegate = self
        cl.dataSource = self
        cl.register(MainCell.self, forCellWithReuseIdentifier: MainCell.reuseIdentifier)
        cl.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.identifier)
        cl.register(ExCollectionViewCell.self, forCellWithReuseIdentifier: ExCollectionViewCell.reuseIdentifier)
        cl.register(FastingCollection.self, forCellWithReuseIdentifier: FastingCollection.reuseIdentifier)
        cl.register(HealthyCollection.self, forCellWithReuseIdentifier: HealthyCollection.reuseIdentifier)
        cl.backgroundColor = .clear
        return cl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
}


extension MainController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    private func initViews() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        viewModel.reloadCollection = { [unowned self] in
            self.isLoading = false
            self.collectionView.reloadData()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.getCategoryCount()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.identifier, for: indexPath) as! SectionHeaderView
        header.headerTitle.text = viewModel.getCategoryName(i: indexPath.item).title_name
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExCollectionViewCell.reuseIdentifier, for: indexPath) as! ExCollectionViewCell
            return cell
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FastingCollection.reuseIdentifier, for: indexPath) as! FastingCollection
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HealthyCollection.reuseIdentifier, for: indexPath) as! HealthyCollection
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExCollectionViewCell.reuseIdentifier, for: indexPath) as! ExCollectionViewCell
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 20
        return CGSize(width: width, height: 350)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
