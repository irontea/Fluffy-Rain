//
//  MainTemperatureViewCell.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 20.09.2022.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class MainTemperatureTableViewCell: UITableViewCell {
    
    static let identifier = "MainTemperatureCell"
    private let disposeBag = DisposeBag()
    private let weatherDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .left
        label.text = " "
        return label
    }()
    private let mockView: UIView = {
        let mockView = UIView()
        mockView.backgroundColor = .black
        mockView.layer.cornerRadius = 50
        mockView.layer.masksToBounds = true
        return mockView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        
        addSubview(mockView)
        addSubview(weatherDescription)
        
        mockView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.centerX.equalToSuperview()
            make.height.equalTo(300)
            make.width.equalTo(300)
        }
        weatherDescription.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalTo(mockView.snp.bottom).offset(37)
            make.bottom.equalToSuperview().offset(-22)
        }
    }
    
    func configure(viewModel: TodayViewModelProtocol) {
        viewModel.currentWeather.subscribe { [weak self] weatherData in
            guard let self = self else {return}
            guard let weatherData = weatherData.event.element else {return}
            self.weatherDescription.text = weatherData.conditions
        }
        .disposed(by: disposeBag)
    }
    
    
    
}
