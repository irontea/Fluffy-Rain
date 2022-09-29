//
//  SevenDaysViewModel.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 27.09.2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol SevenDaysViewModelProtocol {
    var weatherForNextDays: PublishRelay<[WeatherByDay]> {get set}
}

class SevenDaysViewModel: SevenDaysViewModelProtocol {
    var weatherForNextDays = PublishRelay<[WeatherByDay]>()
}
