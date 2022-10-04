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
    private let cityLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 37)
        label.textAlignment = .center
        return label
    }()
    private let weatherDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .left
        return label
    }()
    private let mockView: UIView = {
        let mockView = UIView()
        mockView.backgroundColor = .black
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
        let safeArea = layoutMarginsGuide
        
        addSubview(mockView)
        addSubview(weatherDescription)
        addSubview(cityLable)
        
        cityLable.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeArea.snp.top).offset(14)
        }
        mockView.snp.makeConstraints { make in
            make.top.equalTo(cityLable.snp.bottom).offset(18)
            make.centerX.equalToSuperview()
        }
        weatherDescription.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalTo(mockView).offset(37)
        }
    }
    
    func configure(viewModel: MainViewModelProtocol) {
        
    }
    
    
    
}
