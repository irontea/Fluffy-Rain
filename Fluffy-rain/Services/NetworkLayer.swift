//
//  NetworkLayer.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 21.07.2022.
//

import Foundation
import Alamofire

class NetworkLayer {
    
    static let shared = NetworkLayer()
    
    private init() {
        
    }
    
    func getWeatherData() {
        AF.request("https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Moscow?unitGroup=metric&include=days%2Chours%2Ccurrent&key=QBGE9TPFEPU7EPGZPFNMSJDYU&contentType=json").response { response in
            switch response.result {
            case .success(let data):
                do {
                    let weatherData = try JSONDecoder().decode(WeatherStruct.self, from: data!)
                    print(weatherData)
                } catch let error {
                    print(String(describing: error))
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

