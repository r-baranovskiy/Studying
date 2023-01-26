
import Foundation

struct WeatherModel {
    let cityName: String
    let cityConditionID: Int
    let cityTemp: Double
    
    var tempatureString: String {
        return String(format: "%.f", cityTemp)
    }
    
    var conditionName: String {
        switch cityConditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            break
        }
        return "snowflake.slash"
    }
    
}
