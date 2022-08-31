//
//  ViewModel.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 22.07.2022.
//

import Foundation
import RxCocoa
import RxSwift
import CoreLocation

protocol MainViewModelProtocol: AnyObject {
    var city: BehaviorRelay<String?> {get set}
    var weatherForNextDays: PublishRelay<[WeatherByDay]> {get set}
    var currentWeather: PublishRelay<WeatherByDay> {get set}
    func fetchWeather()
    func setupViewModel()
}

class MainViewModel: MainViewModelProtocol {
    
    var city = BehaviorRelay<String?>(value: "")
    var weatherForNextDays = PublishRelay<[WeatherByDay]>()
    var currentWeather = PublishRelay<WeatherByDay>()
    var locationManager: LocationManager
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
    
    func fetchWeather()  {
        NetworkManager.shared.getWeatherData(for: city.value ?? "") { [weak self] result in
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
    
    private func firstInFetchWeather() {
        city.accept(locationManager.city)
        fetchWeather()
    }
       
    func setupViewModel() {
        locationManager.getCurrentLocation()
        locationManager.completion = firstInFetchWeather
    }
    
}
