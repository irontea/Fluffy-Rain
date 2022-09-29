//
//  ViewController.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 12.07.2022.
//

import UIKit


class MainViewController: UIViewController {
    
    private var viewModel: MainViewModelProtocol!
    private let locationManager = LocationManager()
    
    private var mainTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(MainTemperatureTableViewCell.self, forCellReuseIdentifier: MainTemperatureTableViewCell.identifier)
        tableView.register(SevenDaysTableViewCell.self, forCellReuseIdentifier: SevenDaysTableViewCell.identifier)
        tableView.register(ExtraMainTableViewCell.self, forCellReuseIdentifier: ExtraMainTableViewCell.identifier)
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel(locationManager: locationManager)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        setupUI()
        viewModel.setupViewModel()

    }
    
    func setupUI() {
        view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.mainTableView.tableFooterView = UIView(frame: CGRect.zero)
//    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.uiElemntCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: MainTemperatureTableViewCell.identifier, for: indexPath) as! MainTemperatureTableViewCell
            cell.configure(viewModel: viewModel)
            return cell
        case 1:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: SevenDaysTableViewCell.identifier, for: indexPath) as! SevenDaysTableViewCell
            cell.configure(viewModel: viewModel.sevenDaysViewModelViewModel as! SevenDaysViewModel)
            return cell
        case 2:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: ExtraMainTableViewCell.identifier, for: indexPath) as! ExtraMainTableViewCell
//            cell.configure(model: viewModel.sevenDaysViewModelViewModel)
            return cell
        default:
            return UITableViewCell()
        }
    }
  
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 500.0
        }
    
    
}
//extension MainViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//
//}

//    //    private var viewModel: MainViewModelProtocol!
//
//    private var viewmodel: MainViewModelProtocol!
//    private let disposeBag = DisposeBag()
//    private let locationManager = LocationManager()
//
//    private var textFieldForCity: UITextField = {
//        let tf = UITextField()
//        tf.borderStyle = UITextField.BorderStyle.line
//        tf.textColor = .black
//        tf.font = UIFont.systemFont(ofSize: 28, weight: .bold)
//        return tf
//    }()
//
//    private var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.register(DaysCollectionViewCell.self, forCellWithReuseIdentifier: DaysCollectionViewCell.identifier)
//        return cv
//    }()
//
//    private var acceptButton: UIButton = {
//        let bt = UIButton()
//        bt.backgroundColor = .red
//        bt.setTitle("Accept", for: .normal)
//        return bt
//    }()
//
//
//    private var tableViewForAnotherDays: UITableView = {
//        let tv = UITableView()
//        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        return tv
//    }()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        viewmodel = MainViewModel(locationManager: locationManager)
//
//        collectionView.dataSource = self
//        collectionView.delegate = self
//
//        view.addSubview(textFieldForCity)
//        view.addSubview(acceptButton)
//        view.addSubview(tableViewForAnotherDays)
//        view.addSubview(collectionView)
//        textFieldForCity.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(50)
//            make.leading.equalToSuperview()
//        }
//
//        acceptButton.snp.makeConstraints{ make in
//            make.top.equalToSuperview().offset(50)
//            make.leading.equalTo(textFieldForCity.snp.trailing)
//        }
//
//        collectionView.snp.makeConstraints { make in
//            make.top.equalTo(textFieldForCity.snp.bottom)
//            make.leading.equalTo(view.snp.leading)
//            make.trailing.equalTo(view.snp.trailing)
//            make.width.equalTo(view.snp.width)
//            make.height.equalTo(100)
//        }
//
//        tableViewForAnotherDays.snp.makeConstraints { make in
//            make.top.equalTo(collectionView.snp.bottom)
//            make.leading.equalTo(view.snp.leading)
//            make.trailing.equalTo(view.snp.trailing)
//            make.bottom.equalTo(view.snp.bottom)
//        }
//
//
//
//        viewmodel.setupViewModel()
//        tableViewForAnotherDays.rx.setDelegate(self).disposed(by: disposeBag)
//        bindTableView()
//        bindTextField()
//        bindAcceptButton()
//    }
//
//    private func bindTableView() {
//        viewmodel.weatherForNextDays
//            .bind(to: tableViewForAnotherDays.rx.items(cellIdentifier: "Cell")) {
//                (count, data, cell) in
//                cell.textLabel?.text = String(describing: data.temp)
//            }
//            .disposed(by: disposeBag)
//    }
//
//    private func bindTextField() {
//        textFieldForCity.rx.text
//            .orEmpty
//            .bind(to: viewmodel.city)
//            .disposed(by: disposeBag)
//    }
//
//    private func bindAcceptButton() {
//        acceptButton.rx.tap
//            .bind { [weak self] in
//                guard let self = self else {return}
//                self.viewmodel.fetchWeather()
//            }
//            .disposed(by: disposeBag)
//
//    }
//
//
//}

//extension MainViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//
//}
//
//extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource
//{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 70
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DaysCollectionViewCell.identifier, for: indexPath) as? DaysCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//        return cell
//    }
//}
