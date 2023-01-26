protocol WeatherManagerProtocol: AnyObject {
    func didUpdateWeather(_ weatherManager: WeatherManager, weatherModel: WeatherModel)
    func didFailWithError(error: Error)
}

import Foundation
import CoreLocation

struct WeatherManager {
    
    weak var delegate: WeatherManagerProtocol?
    
    private let apiKey = "ff68ae03099570aa5e32dfa96426ad4d"
    private let units = "metric"
        
    func fetchWeather(cityName: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&lang=ru&units=\(units)&appid=\(apiKey)"
        performRequest(urlString: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&lang=ru&units=\(units)"
        performRequest(urlString: urlString)
    }
    
    private func performRequest(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                delegate?.didFailWithError(error: error!)
            } else {
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        DispatchQueue.main.async {
                            delegate?.didUpdateWeather(self, weatherModel: weather)
                        }
                    }
                }
            }
        }
        task.resume()
    }
    
    private func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weather = WeatherModel(cityName: decodedData.name, cityConditionID: decodedData.weather[0].id, cityTemp: decodedData.main.temp)
            return weather
        } catch let error {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
