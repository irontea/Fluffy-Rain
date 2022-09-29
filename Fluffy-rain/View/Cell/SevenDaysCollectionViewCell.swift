//
//  DaysCollectionViewCell.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 01.09.2022.
//

import UIKit
import SnapKit

class SevenDaysCollectionViewCell: UICollectionViewCell {
    static let identifier = "DaysCell"
    
     var averageTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
     var maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
     var minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupUI() {
        addSubview(averageTemperatureLabel)
        addSubview(minTemperatureLabel)
        addSubview(maxTemperatureLabel)
        
        averageTemperatureLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        minTemperatureLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(averageTemperatureLabel.snp.bottom)
            make.bottom.equalToSuperview()
        }
        
        maxTemperatureLabel.snp.makeConstraints { make in
            make.leading.equalTo(minTemperatureLabel.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
            make.top.equalTo(averageTemperatureLabel.snp.bottom)
            make.bottom.equalToSuperview()
            
        }
    }
}
