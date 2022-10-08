//
//  ExtraMainTableViewCell.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 20.09.2022.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

class ExtraMainTableViewCell: UITableViewCell {
    
    static let identifier = "ExtraMainTemperatureCell"
    private let disposeBag = DisposeBag()
    private let extraInfoView: UIView = {
       let extraInfoView = UIView()
        extraInfoView.backgroundColor = .lightGray
        extraInfoView.layer.masksToBounds = true
        extraInfoView.layer.cornerRadius = 10
        return extraInfoView
    }()
    private let pressureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.text = "Pressure"
        label.textAlignment = .center
        return label
    }()
    private let pressureValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.text = "10"
        label.textAlignment = .center
        return label
    }()
    private let windLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        label.text = "Wind"
        return label
    }()
    private let windValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.text = "10"
        label.textAlignment = .center
        return label
    }()
    private let sunriseLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        label.text = "Sunrise"
        return label
    }()
    private let sunriseValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.text = "10"
        label.textAlignment = .center
        return label
    }()
    private let sunsetLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        label.text = "Sunset"
        return label
    }()
    private let sunsetValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.text = "10"
        label.textAlignment = .center
        return label
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    

    private func setupUI() {
        contentView.addSubview(extraInfoView)
        extraInfoView.addSubview(pressureLabel)
        extraInfoView.addSubview(windLabel)
        extraInfoView.addSubview(sunsetLabel)
        extraInfoView.addSubview(sunriseLabel)
        extraInfoView.addSubview(pressureValueLabel)
        extraInfoView.addSubview(windValueLabel)
        extraInfoView.addSubview(sunsetValueLabel)
        extraInfoView.addSubview(sunriseValueLabel)
        
        extraInfoView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview()
            make.height.equalTo(300)
        }
        
        sunriseLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        sunriseValueLabel.snp.makeConstraints { make in
            make.top.equalTo(sunriseLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        pressureLabel.snp.makeConstraints { make in
            make.top.equalTo(sunriseValueLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        pressureValueLabel.snp.makeConstraints { make in
            make.top.equalTo(pressureLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        sunsetLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        sunsetValueLabel.snp.makeConstraints { make in
            make.top.equalTo(sunsetLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        windLabel.snp.makeConstraints { make in
            make.top.equalTo(sunsetValueLabel.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        windValueLabel.snp.makeConstraints { make in
            make.top.equalTo(windLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
        

    func configure(viewModel: TodayViewModelProtocol) {
        
    }
    
}
