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
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel(locationManager: locationManager)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        setupUI()
        setupNavigationBar()
        viewModel.setupViewModel()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.mainTableView.tableFooterView = UIView(frame: CGRect.zero)
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
    
    func setupNavigationBar() {
        let appearence = UINavigationBarAppearance()
        let switchTimeButton = UIBarButtonItem(image: UIImage(systemName: "sun.max"), style: .plain, target: self, action: #selector(mockSearch))
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(mockSearch))
        
        appearence.configureWithDefaultBackground()
        appearence.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationItem.scrollEdgeAppearance = appearence
        navigationItem.standardAppearance = appearence
        self.navigationItem.leftBarButtonItem = switchTimeButton
        self.navigationItem.rightBarButtonItem = searchButton
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
