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
    var dateFormatterFromString: DateFormatter {get}
    var dateFormatterFromDate: DateFormatter {get}

}

class SevenDaysViewModel: SevenDaysViewModelProtocol {
    var weatherForNextDays = PublishRelay<[WeatherByDay]>()
    var dateFormatterFromString: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
    var dateFormatterFromDate: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter
    }()
    
}
