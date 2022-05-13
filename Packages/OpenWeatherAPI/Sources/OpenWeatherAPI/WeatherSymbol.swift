import Foundation

public enum WeatherSymbol: String {
    case clearSky = "01"
    
    case fewClouds = "02"
    
    case scatteredClouds = "03"
    
    case brokenClouds = "04"
    
    case showerRain = "09"
    
    case rain = "10"
    
    case thunderstorm = "11"
    
    case snow = "13"
    
    case mist = "50"
    
    public var systemName: String {
        switch self {
        case .clearSky:
            return "sun.min"
        case .fewClouds:
            return ""
        case .scatteredClouds:
            return ""
        case .brokenClouds:
            return ""
        case .showerRain:
            return ""
        case .rain:
            return ""
        case .thunderstorm:
            return ""
        case .snow:
            return ""
        case .mist:
            return ""
        }
    }
}
