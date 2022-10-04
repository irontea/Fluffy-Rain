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
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
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
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        return label
    }()
    let mainWeatherIcon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        return icon
    }()
    let sunIcon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        return icon
    }()
    let moonIcon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
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
        
        addSubview(mainView)
        mainView.addSubview(dayNameLabel)
        mainView.addSubview(mainWeatherIcon)
        mainView.addSubview(averageTemperatureLabel)
        mainView.addSubview(minTemperatureLabel)
        mainView.addSubview(maxTemperatureLabel)
        mainView.addSubview(sunIcon)
        mainView.addSubview(moonIcon)
        
        mainView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        dayNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(5)
        }
        mainWeatherIcon.snp.makeConstraints { make in
            make.top.equalTo(dayNameLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(28)
            make.height.equalTo(26)
        }
        averageTemperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(mainWeatherIcon.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        minTemperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(averageTemperatureLabel.snp.bottom)
            make.leading.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-14)
        }
        moonIcon.snp.makeConstraints { make in
            make.top.equalTo(averageTemperatureLabel.snp.bottom)
            make.leading.equalTo(minTemperatureLabel.snp.trailing).offset(2)
            make.bottom.equalToSuperview().offset(-14)
            make.width.equalTo(14)
            make.height.equalTo(13)
        }
        maxTemperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(averageTemperatureLabel.snp.bottom)
            make.bottom.equalToSuperview().offset(-14)
        }
        sunIcon.snp.makeConstraints { make in
            make.top.equalTo(averageTemperatureLabel.snp.bottom)
            make.leading.equalTo(maxTemperatureLabel.snp.trailing).offset(2)
            make.bottom.equalToSuperview().offset(-14)
            make.trailing.equalToSuperview().offset(-8)
            make.width.equalTo(14)
            make.height.equalTo(13)
        }
    }
}
