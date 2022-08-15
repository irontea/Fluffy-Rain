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
    var weatherForNextDays: PublishRelay<[WeatherByDay]> {get set}
    var currentWeather: PublishRelay<WeatherByDay> {get set}
//    var selectedWeatherForNextDays:Observable<[WeatherByDay]> {get}
    
    func fetchWeather()
}

class MainViewModel: MainViewModelProtocol {
    
    
    
    var weatherForNextDays = PublishRelay<[WeatherByDay]>()
    var currentWeather = PublishRelay<WeatherByDay>()
//    var selectedWeatherForNextDays: Observable<[WeatherByDay]> {
//        return weatherForNextDays.asObservable()
//    }
    var city: String = "moscow"


    

    func fetchWeather() {
        NetworkLayer.shared.getWeatherData(for: city) { [weak self] result in
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
