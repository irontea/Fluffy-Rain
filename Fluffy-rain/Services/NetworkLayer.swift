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
    
    func getWeatherData(for city: String) {
        AF.request("https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/\(city)/next7days?unitGroup=metric&key=QBGE9TPFEPU7EPGZPFNMSJDYU&contentType=json").validate().response { response in
            switch response.result {
            case .success(let data):
                do {
                    let weatherData = try JSONDecoder().decode(WeatherStruct.self, from: data!)
                    
                } catch let error {
                    print(String(describing: error))
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

