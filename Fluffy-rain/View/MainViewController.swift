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
    private let locationManager = LocationManager()
    
    private var textFieldForCity: UITextField = {
        let tf = UITextField()
        tf.borderStyle = UITextField.BorderStyle.line
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return tf
    }()
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(DaysCollectionViewCell.self, forCellWithReuseIdentifier: DaysCollectionViewCell.identifier)
        return cv
    }()
    
    private var acceptButton: UIButton = {
        let bt = UIButton()
        bt.backgroundColor = .red
        bt.setTitle("Accept", for: .normal)
        return bt
    }()
    
    
    private var tableViewForAnotherDays: UITableView = {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tv
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewmodel = MainViewModel(locationManager: locationManager)
        
        view.addSubview(textFieldForCity)
        view.addSubview(acceptButton)
        view.addSubview(tableViewForAnotherDays)
        view.addSubview(collectionView)
        textFieldForCity.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview()
        }
        
        acceptButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalTo(textFieldForCity.snp.trailing)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(textFieldForCity.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        tableViewForAnotherDays.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        
        
        viewmodel.setupViewModel()
        tableViewForAnotherDays.rx.setDelegate(self).disposed(by: disposeBag)
        bindTableView()
        bindTextField()
        bindAcceptButton()
    }
    
    private func bindTableView() {
        viewmodel.weatherForNextDays
            .bind(to: tableViewForAnotherDays.rx.items(cellIdentifier: "Cell")) {
                (count, data, cell) in
                cell.textLabel?.text = String(describing: data.temp)
            }
            .disposed(by: disposeBag)
    }
    
    private func bindTextField() {
        textFieldForCity.rx.text
            .orEmpty
            .bind(to: viewmodel.city)
            .disposed(by: disposeBag)
    }
    
    private func bindAcceptButton() {
        acceptButton.rx.tap
            .bind { [weak self] in
                guard let self = self else {return}
                self.viewmodel.fetchWeather()
            }
            .disposed(by: disposeBag)
            
    }
    
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
