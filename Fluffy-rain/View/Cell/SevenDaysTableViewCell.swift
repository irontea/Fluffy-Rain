//
//  SevenDaysTableViewCell.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 20.09.2022.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SevenDaysTableViewCell: UITableViewCell {
    
    static let identifier = "SevenDaysCell"
    let disposeBag = DisposeBag()
    private var sevenDaysCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.itemSize = CGSize(width: 94, height: 114)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SevenDaysCollectionViewCell.self, forCellWithReuseIdentifier: SevenDaysCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupUI(){
        contentView.addSubview(sevenDaysCollectionView)
        sevenDaysCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(120)
            
        }
    }
    
    func configure(viewModel: SevenDaysViewModel) {
        viewModel.weatherForNextDays
            .bind(to: sevenDaysCollectionView.rx.items(cellIdentifier: SevenDaysCollectionViewCell.identifier, cellType: SevenDaysCollectionViewCell.self)) { (row, element, cell) in
                cell.maxTemperatureLabel.text = String(describing: element.tempmax ?? 0.0)
                cell.minTemperatureLabel.text = String(describing: element.tempmin ?? 0.0)
                cell.averageTemperatureLabel.text = String(describing: element.temp)
                cell.mainWeatherIcon.image = viewModel.getImage(iconName: element.icon)
                cell.averageTemperatureLabel.text = String(describing: element.temp)
                cell.sunIcon.image = UIImage(systemName: "sun.max")
                cell.moonIcon.image = UIImage(systemName: "moon")
                
                if row == 0 {
                    cell.dayNameLabel.text = "Today"
                } else {
                    cell.dayNameLabel.text = viewModel.dateFormatterFromDate.string(for: viewModel.dateFormatterFromString.date(from:element.datetime))
                }
            }
            .disposed(by: disposeBag)
    }
}

//extension SevenDaysTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return 70
//        }
//
//        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SevenDaysCollectionViewCell.identifier, for: indexPath) as? SevenDaysCollectionViewCell else {
//
//                return UICollectionViewCell()
//            }
//            cell.averageTemperatureLabel.text = "14"
//            cell.minTemperatureLabel.text = "10"
//            cell.maxTemperatureLabel.text = "10"
//            return cell
//        }




