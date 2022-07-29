//
//  SectionHeaderView.swift
//  TestITFactory
//
//  Created by Shaxzod Azamatjonov on 29/07/22.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    static let identifier = "SectionHeaderView"
    let headerTitle = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews(){
        self.addSubview(headerTitle)
        headerTitle.text = "Title"
        headerTitle.font = .systemFont(ofSize: 20, weight: .bold)
        headerTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
        }
    }
    
    func updateTitle(_ title: String){
        headerTitle.text = title
    }
}
