//
//  MainTemperatureViewCell.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 20.09.2022.
//

import UIKit

class MainTemperatureTableViewCell: UITableViewCell {

    static let identifier = "MainTemperatureCell"

    private var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "ARARAR"
        label.font = UIFont.systemFont(ofSize: 100)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    func setupUI() {
        addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
    }
    
}
