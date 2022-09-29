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
    let disposeBag = DisposeBag()
    private var textFieldForCity: UITextField = {
        let tf = UITextField()
        tf.borderStyle = UITextField.BorderStyle.line
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return tf
    }()
    private var acceptButton: UIButton = {
        let bt = UIButton()
        bt.backgroundColor = .red
        bt.setTitle("Accept", for: .normal)
        return bt
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupUI() {
        contentView.addSubview(textFieldForCity)
        contentView.addSubview(acceptButton)
        textFieldForCity.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview()
            
            make.bottom.equalToSuperview()
        }
        acceptButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalTo(textFieldForCity.snp.trailing)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func configure(viewModel: MainViewModelProtocol) {
        textFieldForCity.rx.text
            .orEmpty
            .bind(to: viewModel.city)
            .disposed(by: disposeBag)
        
        acceptButton.rx.tap
            .bind {
                viewModel.fetchWeather()
            }
            .disposed(by: disposeBag)
    }
    
}
