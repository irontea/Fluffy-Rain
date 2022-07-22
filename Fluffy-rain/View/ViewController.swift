//
//  ViewController.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 12.07.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkLayer.shared.getWeatherData(for: "Moscow")
    }    
}

