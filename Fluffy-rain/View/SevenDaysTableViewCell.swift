//
//  SevenDaysTableViewCell.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 20.09.2022.
//

import UIKit

class SevenDaysTableViewCell: UITableViewCell {
    
    
    static let identifier = "SevenDaysCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
