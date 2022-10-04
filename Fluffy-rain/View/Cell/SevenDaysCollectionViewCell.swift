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
    let mainView:UIView = {
       let mainView = UIView()
        mainView.backgroundColor = .yellow
        
        return mainView
    }()
    let averageTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    let maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    let minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    let dayNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    let mainWeatherIcon: UIImageView = {
        let icon = UIImageView()
        return icon
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupUI() {
        layer.cornerRadius = 30
        
        addSubview(mainView)
        mainView.addSubview(dayNameLabel)
        mainView.addSubview(mainWeatherIcon)
        addSubview(averageTemperatureLabel)
        addSubview(minTemperatureLabel)
        addSubview(maxTemperatureLabel)
        mainView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        dayNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        mainWeatherIcon.snp.makeConstraints { make in
            make.top.equalTo(dayNameLabel.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
//        averageTemperatureLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview()
//        }
//
//        minTemperatureLabel.snp.makeConstraints { make in
//            make.leading.equalToSuperview()
//            make.top.equalTo(averageTemperatureLabel.snp.bottom)
//            make.bottom.equalToSuperview()
//        }
//
//        maxTemperatureLabel.snp.makeConstraints { make in
//            make.leading.equalTo(minTemperatureLabel.snp.trailing).offset(8)
//            make.trailing.equalToSuperview()
//            make.top.equalTo(averageTemperatureLabel.snp.bottom)
//            make.bottom.equalToSuperview()
//
//        }
    }
}
