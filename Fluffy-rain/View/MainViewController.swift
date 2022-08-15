//
//  ViewController.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 12.07.2022.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {

//    private var viewModel: MainViewModelProtocol!

    private var viewmodel: MainViewModelProtocol!
    private let disposeBag = DisposeBag()
    
    var temperatureLabel: UILabel = {
       let tl = UILabel()
        tl.text = "123"
        tl.textColor = .black
        tl.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return tl
    }()
    
    var tableViewForAnotherDays: UITableView = {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewmodel = MainViewModel()

        view.addSubview(temperatureLabel)
        view.addSubview(tableViewForAnotherDays)
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
        }
        tableViewForAnotherDays.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        tableViewForAnotherDays.rx.setDelegate(self).disposed(by: disposeBag)
        viewmodel.fetchWeather()
        bindTableView()
        
        // Do any additional setup after loading the view.
    }
    
    private func bindTableView() {
        viewmodel.weatherForNextDays.bind(to: tableViewForAnotherDays.rx.items(cellIdentifier: "Cell")) {
            (count, data, cell) in
            cell.textLabel?.text = String(describing: data.temp)
            
        }.disposed(by: disposeBag)
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
