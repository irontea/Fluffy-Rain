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
    
    func getImage(iconName: String) -> UIImage

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
        dateFormatter.dateFormat = "EE"
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter
    }()
    
    func getImage(iconName: String) -> UIImage {
            switch iconName {
            case IconEnums.snow.rawValue:
                return UIImage(systemName: "snowflake")!
            case IconEnums.rain.rawValue:
                return  UIImage(systemName: "cloud.rain")!
            case IconEnums.fog.rawValue:
                return  UIImage(systemName:"cloud.fog")!
            case IconEnums.wind.rawValue:
                return  UIImage(systemName:"wind" )!
            case IconEnums.cloudy.rawValue:
                return  UIImage(systemName: "cloud")!
            case IconEnums.partlyCloudyDay.rawValue:
                return  UIImage(systemName: "cloud.sun" )!
            case IconEnums.partlyCloudyNight.rawValue:
                return  UIImage(systemName:"cloud.moon" )!
            case IconEnums.clearDay.rawValue:
                return  UIImage(systemName: "sun.max")!
            case IconEnums.clearNight.rawValue:
                return  UIImage(systemName: "moon")!
            default: return UIImage()
            }
    }
    
}
