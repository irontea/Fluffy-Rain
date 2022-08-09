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
    private var currentWeather: WeatherByDay?
    private var weatherForNextDays: [WeatherByDay]?
    

    func fetchWeather() {
        NetworkLayer.shared.getWeatherData(for: city) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let weatherData):
                self.currentWeather = weatherData?.currentConditions
                self.weatherForNextDays = weatherData?.days
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getDaysCount() -> Int {
        return weatherForNextDays?.count ?? 0
    }
    
    func getCurrentTemperature() -> String {
        guard let currentWeather = currentWeather else {return ""}
        return String(describing: currentWeather.temp)
    }

    
}
