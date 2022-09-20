//
//  ExtraMainTableViewCell.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 20.09.2022.
//

import UIKit

class ExtraMainTableViewCell: UITableViewCell {

    static let identifier = "ExtraMainTemperatureCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
