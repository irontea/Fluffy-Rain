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
    var sevenDaysViewModelViewModel: SevenDaysViewModelProtocol {get set}
    var todayViewModelViewModel: TodayViewModelProtocol {get set}
    var uiElemntCount: Int {get}
    var showSearch: BehaviorRelay<Bool> {get set}
    
    func fetchWeather()
    func setupViewModel()
    func showSearchView()
}

class MainViewModel: MainViewModelProtocol {
    
    var uiElemntCount: Int = 3
    var city = BehaviorRelay<String?>(value: "")
    var sevenDaysViewModelViewModel: SevenDaysViewModelProtocol = SevenDaysViewModel()
    var todayViewModelViewModel: TodayViewModelProtocol = TodayViewModel()
    var locationManager: LocationManager
    var showSearch = BehaviorRelay<Bool>(value: false)
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
    
    func fetchWeather()  {
        NetworkManager.shared.getWeatherData(for: city.value ?? "") { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let weatherData):
                guard let weatherData = weatherData else {return}
                self.sevenDaysViewModelViewModel.weatherForNextDays.accept(weatherData.days)
                self.todayViewModelViewModel.currentWeather.accept(weatherData.currentConditions)
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
    
    func showSearchView(){
        
    }
    
}
