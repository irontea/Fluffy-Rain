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
        //        mainTableView.isUserInteractionEnabled = false
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
        view.addSubview(textFieldForCity)
        view.addSubview(acceptButton)
        
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
        textFieldForCity.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.bottom.equalTo(safeArea.snp.bottom)
        }
        acceptButton.snp.makeConstraints { make in
            make.leading.equalTo(textFieldForCity.snp.trailing)
            make.bottom.equalTo(safeArea.snp.bottom)
            make.trailing.equalToSuperview()
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
                self.textFieldForCity.isHidden = !self.textFieldForCity.isHidden
                self.acceptButton.isHidden = !self.acceptButton.isHidden
                self.acceptButton.alpha = self.acceptButton.alpha == 0 ? 1 : 0
                self.textFieldForCity.alpha = self.textFieldForCity.alpha == 0 ? 1 : 0
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
