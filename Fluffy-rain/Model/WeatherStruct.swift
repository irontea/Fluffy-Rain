//
//  WeatherStruct.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 21.07.2022.
//

import Foundation

struct WeatherStruct: Codable {
    let days: [WeatherByDay]
    let currentConditions: WeatherByDay
}

struct WeatherByDay: Codable {
    let datetime: String
    let temp: Double
    let tempmax: Double?
    let tempmin: Double?
    let feelslike: Double
    let sunrise: String?
    let sunset: String?
    let icon: String
    let hours: [WeatherByDay]?
    let conditions: String
    let description: String?
    let visibility: Double
    let pressure: Double
    let windspeed: Double
}

/*
 MARK: Погода по дням
 "datetime": "2022-08-04",
 "datetimeEpoch": 1659560400,
 "tempmax": 26.4,
 "tempmin": 15.4,
 "temp": 20.6,
 "feelslikemax": 26.4,
 "feelslikemin": 15.4,
 "feelslike": 20.6,
 "dew": 13.4,
 "humidity": 65.4,
 "precip": 0.0,
 "precipprob": 28.6,
 "precipcover": 0.0,
 "preciptype": null,
 "snow": 0.0,
 "snowdepth": 0.0,
 "windgust": 38.5,
 "windspeed": 19.1,
 "winddir": 340.4,
 "pressure": 1012.9,
 "cloudcover": 29.9,
 "visibility": 24.1,
 "solarradiation": 261.8,
 "solarenergy": 23.0,
 "uvindex": 7.0,
 "severerisk": 10.0,
 "sunrise": "04:39:54",
 "sunriseEpoch": 1659577194,
 "sunset": "20:30:12",
 "sunsetEpoch": 1659634212,
 "moonphase": 0.2,
 "conditions": "Partially cloudy",
 "description": "Becoming cloudy in the afternoon.",
 "icon": "partly-cloudy-day",
 "stations": null,
 "source": "fcst",
 "hours": []
 */


/*
 MARK: Текущая погода
 "currentConditions": {
 "datetime": "20:25:47",
 "datetimeEpoch": 1658424347,
 "temp": 17.8,
 "feelslike": 17.8,
 "humidity": 74.9,
 "dew": 13.3,
 "precip": 0.1,
 "precipprob": null,
 "snow": 0.0,
 "snowdepth": 0.0,
 "preciptype": null,
 "windgust": 54.0,
 "windspeed": 24.4,
 "winddir": 29.0,
 "pressure": 1009.5,
 "visibility": 9.1,
 "cloudcover": 54.1,
 "solarradiation": 102.0,
 "solarenergy": 0.4,
 "uvindex": 1.0,
 "conditions": "Rain, Partially cloudy",
 "icon": "rain",
 "stations": [
 "UUWW",
 "UUEE",
 "E8051"
 ],
 "sunrise": "04:15:05",
 "sunriseEpoch": 1658366105,
 "sunset": "20:55:50",
 "sunsetEpoch": 1658426150,
 "moonphase": 0.8
 */

/*
 MARK: Погода по часам
 "datetime": "23:00:00",
 "datetimeEpoch": 1659643200,
 "temp": 17.7,
 "feelslike": 17.7,
 "humidity": 68.21,
 "dew": 11.8,
 "precip": 0.0,
 "precipprob": 19.0,
 "snow": 0.0,
 "snowdepth": 0.0,
 "preciptype": null,
 "windgust": 32.9,
 "windspeed": 12.8,
 "winddir": 335.3,
 "pressure": 1014.0,
 "visibility": 24.1,
 "cloudcover": 3.5,
 "solarradiation": 23.7,
 "solarenergy": 0.1,
 "uvindex": 0.0,
 "severerisk": 10.0,
 "conditions": "Clear",
 "icon": "clear-night",
 "stations": null,
 "source": "fcst"
 */

