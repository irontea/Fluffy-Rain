//
//  ViewModel.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 22.07.2022.
//

import Foundation
import RxCocoa
import RxSwift

protocol MainViewModelProtocol: AnyObject {
    var city: String {get set}
    func fetchWeather()
}

class MainViewModel: MainViewModelProtocol {
    
    var city: String = ""
    private var weatherForCity: WeatherStruct?

    

    func fetchWeather() {
        NetworkLayer.shared.getWeatherData(for: city) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let weatherData):
                self.weatherForCity = weatherData
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getDaysCount() -> Int {
        return weatherForCity?.days.count ?? 0
    }
    
    func getCurrentTemperature() -> String {
        guard let currentWeather = weatherForCity?.currentConditions else {return ""}
        return String(describing: currentWeather.temp)
    }

    
}
