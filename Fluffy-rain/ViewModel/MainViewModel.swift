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
    var city: BehaviorRelay<String?> {get set}
    var weatherForNextDays: PublishRelay<[WeatherByDay]> {get set}
    var currentWeather: PublishRelay<WeatherByDay> {get set}
    
    func fetchWeather()
}

class MainViewModel: MainViewModelProtocol {
    
    var city = BehaviorRelay<String?>(value: "Moscow")
    var weatherForNextDays = PublishRelay<[WeatherByDay]>()
    var currentWeather = PublishRelay<WeatherByDay>()
    
    func fetchWeather() {
        NetworkLayer.shared.getWeatherData(for: city.value ?? "Moscow") { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let weatherData):
                guard let weatherData = weatherData else {return}
                self.weatherForNextDays.accept(weatherData.days)
                self.currentWeather.accept(weatherData.currentConditions)
            case .failure(let error):
                print(error)
            }
        }
    }
        
    
}
