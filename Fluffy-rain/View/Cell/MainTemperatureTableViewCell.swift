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

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {

    }
    
    func configure(viewModel: MainViewModelProtocol) {

    }
    
    @objc func ch(){
        print("Moscow")
    }
    
}
