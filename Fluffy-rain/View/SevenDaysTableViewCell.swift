//
//  SevenDaysTableViewCell.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 20.09.2022.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SevenDaysTableViewCell: UITableViewCell {
    
    
    static let identifier = "SevenDaysCell"
    
    
    private var sevenDaysCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DaysCollectionViewCell.self, forCellWithReuseIdentifier: DaysCollectionViewCell.identifier)
        return collectionView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        sevenDaysCollectionView.dataSource = self
        sevenDaysCollectionView.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    func setupUI(){
        contentView.addSubview(sevenDaysCollectionView)
        sevenDaysCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
        
    }
    
}

extension SevenDaysTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 70
        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DaysCollectionViewCell.identifier, for: indexPath) as? DaysCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
    
}

