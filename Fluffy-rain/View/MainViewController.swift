//
//  ViewController.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 12.07.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

//    private var viewModel: MainViewModelProtocol!

    
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
        tableViewForAnotherDays.dataSource = self
        tableViewForAnotherDays.delegate = self
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
        
        // Do any additional setup after loading the view.
    }    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Test"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
