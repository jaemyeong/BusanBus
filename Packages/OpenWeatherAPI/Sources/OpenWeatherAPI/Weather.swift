import Foundation

import ErrorKit

public struct Weather {
    public var imageURL: URL
    
    public var temperature: Measurement<UnitTemperature>
    
    public init(imageURL: URL, temperature: Measurement<UnitTemperature>) {
        self.imageURL = imageURL
        self.temperature = temperature
    }
    
    public init(data: Data) throws {
        let jsonObject = try JSONSerialization.jsonObject(with: data)
        
        guard let jsonObject = jsonObject as? NSDictionary else {
            throw TypeCastingError()
        }
        
        guard let value = jsonObject.value(forKeyPath: "main.temp") else {
            throw NilError()
        }
        
        guard let value = value as? Double else {
            throw TypeCastingError()
        }
        
        self.temperature = Measurement(value: value, unit: .baseUnit())
        
        guard let value = jsonObject.mutableArrayValue(forKeyPath: "weather.icon").firstObject else {
            throw NilError()
        }
        
        guard let value = value as? String else {
            throw TypeCastingError()
        }
        
        guard let url = URL(string: "https://openweathermap.org/img/wn/\(value)@2x.png") else {
            throw InstantiateError()
        }
        
        self.imageURL = url
    }
}
