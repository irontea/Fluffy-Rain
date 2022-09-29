//
//  TodayViewModel.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 27.09.2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol TodayViewModelProtocol {
    var currentWeather: PublishRelay<WeatherByDay> {get set}
}

class TodayViewModel: TodayViewModelProtocol {
    var currentWeather = PublishRelay<WeatherByDay>()
}
