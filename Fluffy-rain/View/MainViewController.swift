//
//  ViewController.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 12.07.2022.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class MainViewController: UIViewController {
    
    private var viewModel: MainViewModelProtocol!
    private let locationManager = LocationManager()
    private let disposeBag = DisposeBag()
    private let mainTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(MainTemperatureTableViewCell.self, forCellReuseIdentifier: MainTemperatureTableViewCell.identifier)
        tableView.register(SevenDaysTableViewCell.self, forCellReuseIdentifier: SevenDaysTableViewCell.identifier)
        tableView.register(ExtraMainTableViewCell.self, forCellReuseIdentifier: ExtraMainTableViewCell.identifier)
        return tableView
    }()
    private let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    private let searchView: UIView = {
        let searchView = UIView()
        searchView.backgroundColor = .yellow
        searchView.layer.cornerRadius = 10
        searchView.layer.masksToBounds = true
        return searchView
    }()
    private let textFieldForCity: UITextField = {
        let tf = UITextField()
        tf.borderStyle = UITextField.BorderStyle.line
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        tf.backgroundColor = .white
        return tf
    }()
    private let acceptButton: UIButton = {
        let bt = UIButton()
        bt.backgroundColor = .red
        bt.setTitle("Accept", for: .normal)
        return bt
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 37)
        label.textAlignment = .center
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel = MainViewModel(locationManager: locationManager)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.separatorStyle = .none
        setupUI()
        setupToolBarUI()
        setupBinding()
        viewModel.setupViewModel()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.mainTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    private func setupUI() {
        
        let safeArea = view.layoutMarginsGuide
        
        view.addSubview(mainTableView)
        view.addSubview(cityLabel)
        view.addSubview(searchView)
        searchView.addSubview(textFieldForCity)
        searchView.addSubview(acceptButton)
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top)
            make.centerX.equalToSuperview()
        }
        mainTableView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(cityLabel.snp.bottom)
            make.bottom.equalToSuperview()
        }
        searchView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(safeArea.snp.bottom)
            make.height.equalTo(50)
        }
        textFieldForCity.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(5)
            make.width.equalToSuperview().multipliedBy(0.75)
        }
        acceptButton.snp.makeConstraints { make in
            make.leading.equalTo(textFieldForCity.snp.trailing)
            make.centerY.equalToSuperview()
            make.height.equalTo(textFieldForCity.snp.height)
            make.trailing.equalToSuperview().offset(-5)
            make.width.equalToSuperview().multipliedBy(0.25)
        }
    }
    
    private func setupToolBarUI() {
        let appearance = UIToolbarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.clear
        appearance.backgroundEffect = UIBlurEffect(style: .light)
        self.navigationController?.toolbar.standardAppearance = appearance
        self.navigationController?.toolbar.scrollEdgeAppearance = appearance
        self.navigationController?.toolbar.compactAppearance = appearance
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.isToolbarHidden = false
        
        var items = [UIBarButtonItem]()
        items.append( UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil) )
        items.append(add)
        self.toolbarItems = items
    }
    
    private func setupBinding(){
        textFieldForCity.rx.text
            .orEmpty
            .bind(to: viewModel.city)
            .disposed(by: disposeBag)
        
        acceptButton.rx.tap
            .bind {[weak self] in
                guard let self = self else {return}
                self.viewModel.fetchWeather()
            }
            .disposed(by: disposeBag)
        
        add.rx.tap
            .bind {[weak self] in
                guard let self = self else {return}
                self.viewModel.showSearch.accept(!self.viewModel.showSearch.value)
            }
            .disposed(by: disposeBag)
        
        viewModel.showSearch
            .asObservable()
            .subscribe { [weak self] show in
                guard let self = self else {return}
                if show.element! {
                    self.searchView.isHidden = false
                    self.searchView.alpha = 1
                } else {
                    self.searchView.isHidden = true
                    self.searchView.alpha = 0
                }
            }
            .disposed(by: disposeBag)
        
        viewModel.city
            .bind(to: cityLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.uiElemntCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: MainTemperatureTableViewCell.identifier, for: indexPath) as! MainTemperatureTableViewCell
            
            cell.configure(viewModel: viewModel.todayViewModelViewModel)
            return cell
        case 1:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: SevenDaysTableViewCell.identifier, for: indexPath) as! SevenDaysTableViewCell
            cell.configure(viewModel: viewModel.sevenDaysViewModelViewModel)
            return cell
        case 2:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: ExtraMainTableViewCell.identifier, for: indexPath) as! ExtraMainTableViewCell
            cell.configure(viewModel: viewModel.todayViewModelViewModel)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    
}
