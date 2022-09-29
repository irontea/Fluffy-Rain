//
//  ExtraMainTableViewCell.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 20.09.2022.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

class ExtraMainTableViewCell: UITableViewCell {
    
    static let identifier = "ExtraMainTemperatureCell"
    
    private let disposeBag = DisposeBag()
    
    //TODO: Переделай UI
//
//    private var extraMainTableView: UITableView = {
//        let tv = UITableView()
//        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        return tv
//    }()
//
//    private func setupUI() {
//       addSubview(extraMainTableView)
//        extraMainTableView.snp.makeConstraints { make in
//            make.leading.equalToSuperview()
//            make.trailing.equalToSuperview()
//            make.bottom.equalToSuperview()
//            make.top.equalToSuperview()
//            make.height.equalTo(500)
//        }
//
//
//    }
//
//    func configure(viewModel: TodayViewModel) {
////        viewModel..bind(to: extraMainTableView.rx.items(cellIdentifier: "Cell")) {
////            (count, data, cell) in
////            cell.textLabel?.text = String(describing: data.temp)
////        }
////        .disposed(by: disposeBag)
//    }
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        extraMainTableView.rx.setDelegate(self).disposed(by: disposeBag)
//        setupUI()
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//
//}
//
//extension ExtraMainTableViewCell: UITableViewDelegate {
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        10
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = extraMainTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
////        cell.textLabel?.text = "BOBA"
////
////        return cell
////    }
//
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 400.0
//        }
//

}
