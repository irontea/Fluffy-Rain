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
//    private let city = ""
    private let disposeBag = DisposeBag()
    private let mainTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(MainTemperatureTableViewCell.self, forCellReuseIdentifier: MainTemperatureTableViewCell.identifier)
        tableView.register(SevenDaysTableViewCell.self, forCellReuseIdentifier: SevenDaysTableViewCell.identifier)
        tableView.register(ExtraMainTableViewCell.self, forCellReuseIdentifier: ExtraMainTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
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
    private let backgroundView: UIView = {
        let backgroundView = UIView()
        return backgroundView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel(locationManager: locationManager)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        setupTableViewUI()
        setupNavigationBar()
        setupSearchCityUI()
        setupBinding()
        viewModel.setupViewModel()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.mainTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    private func setupTableViewUI() {
        view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
   private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        let switchTimeButton = UIBarButtonItem(image: UIImage(systemName: "sun.max"), style: .plain, target: self, action: #selector(mockSearch))
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(mockSearch))
        
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), .font: UIFont.systemFont(ofSize: 18, weight: .semibold)]
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.leftBarButtonItem = switchTimeButton
        self.navigationItem.rightBarButtonItem = searchButton
//        self.navigationItem.title = viewModel.city.value ?? ""
    }
    
    private func setupSearchCityUI(){
        let safeArea = view.layoutMarginsGuide

        view.addSubview(backgroundView)
        backgroundView.addSubview(textFieldForCity)
        backgroundView.addSubview(acceptButton)
        
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(30)
        }
        textFieldForCity.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.top)
            make.leading.equalTo(backgroundView.snp.leading)
            make.height.equalTo(25)
            make.width.equalTo(backgroundView.snp.width).multipliedBy(0.75)
        }
        acceptButton.snp.makeConstraints{ make in
            make.top.equalTo(backgroundView.snp.top)
            make.leading.equalTo(textFieldForCity.snp.trailing)
            make.trailing.equalTo(backgroundView.snp.trailing)
            make.height.equalTo(25)
            make.width.equalTo(backgroundView.snp.width).multipliedBy(0.25)
            
        }
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
    }
    
    @objc func mockSearch(){}
    
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
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 500.0
    }
    
}
