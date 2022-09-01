//
//  DaysCollectionViewCell.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 01.09.2022.
//

import UIKit
import SnapKit

class DaysCollectionViewCell: UICollectionViewCell {
    static let identifier = "DaysCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
