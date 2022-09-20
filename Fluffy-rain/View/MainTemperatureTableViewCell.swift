//
//  MainTemperatureViewCell.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 20.09.2022.
//

import UIKit

class MainTemperatureTableViewCell: UITableViewCell {

    static let identifier = "MainTemperatureCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
