//
//  MainCell.swift
//  TestITFactory
//
//  Created by Shaxzod Azamatjonov on 29/07/22.
//

import UIKit
import SnapKit
import Kingfisher

class MainCell: BaseCollectionCell<Items> {
    let itemImage = UIImageView()
    let itemDesc = UILabel()
    
    override func initViews() {
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        self.addSubview(itemImage)
        self.addSubview(itemDesc)
        self.backgroundColor = .white
        itemImage.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        itemDesc.numberOfLines = 0
        itemDesc.textAlignment = .center
        itemDesc.snp.makeConstraints { make in
            make.top.equalTo(itemImage.snp.bottom)
            make.left.right.equalToSuperview().inset(10)
        }
    }
    override func updateUI(with model: Items) {
        itemDesc.text = model.description
        let url = URL(string: model.image)
        itemImage.kf.indicatorType = .activity
        itemImage.kf.setImage(with: url)
    }
    

    override var isSelected: Bool {
        didSet {
                self.layer.borderWidth = isSelected ? 3 : 0
                self.layer.borderColor = UIColor.blue.cgColor
        }
    }
}
