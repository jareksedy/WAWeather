//
//  Created by Jarek Šedý on 16.05.2021.
//

import Foundation

public class WAWeather {
    public let data: WAWeatherData
    
    public struct WAWeatherData: Codable {
        public let location: Location
        public let current: Current
        public let forecast: Forecast
        
        public struct Location: Codable {
            public let name: String
            public let region: String?
            public let country: String
            public let lat: Double
            public let lon: Double
            public let tz_id: String
            public let localtime_epoch: Double
            public let localtime: String
        }
        
        public struct Current: Codable {
            public let last_updated_epoch: Double
            public let last_updated: String
            public let temp_c: Double
            public let temp_f: Double
            public let is_day: Int
            public let condition: Condition
            public let wind_mph: Double
            public let wind_kph: Double
            public let wind_degree: Int
            public let wind_dir: String
            public let pressure_mb: Double
            public let pressure_in: Double
            public let precip_mm: Double
            public let precip_in: Double
            public let humidity: Int
            public let cloud: Int
            public let feelslike_c: Double
            public let feelslike_f: Double
            public let vis_km: Double
            public let vis_miles: Double
            public let uv: Double
            public let gust_mph: Double
            public let gust_kph: Double
            public let air_quality: AirQuality
            
            public struct AirQuality: Codable {
                public let co: Double
                public let no2: Double
                public let o3: Double
                public let so2: Double
                public let pm2_5: Double
                public let pm10: Double
                public let us_epa_index: Int
                public let gb_defra_index: Int
                
                enum CodingKeys : String, CodingKey {
                    case us_epa_index = "us-epa-index"
                    case gb_defra_index = "gb-defra-index"
                    case co, no2, o3, so2, pm2_5, pm10
                }
            }
        }
        
        public struct Forecast: Codable {
            public let forecastday: [Forecastday]
            
            public struct Forecastday: Codable {
                public let date: String
                public let date_epoch: Double
                public let day: Day
                public let astro: Astro
                public let hour: [Hour]
                
                public struct Day: Codable {
                    public let maxtemp_c: Double
                    public let maxtemp_f: Double
                    public let mintemp_c: Double
                    public let mintemp_f: Double
                    public let avgtemp_c: Double
                    public let avgtemp_f: Double
                    public let maxwind_mph: Double
                    public let maxwind_kph: Double
                    public let totalprecip_mm: Double
                    public let totalprecip_in: Double
                    public let avgvis_km: Double
                    public let avgvis_miles: Double
                    public let avghumidity: Double
                    public let daily_will_it_rain: Int
                    public let daily_chance_of_rain: String
                    public let daily_will_it_snow: Int
                    public let daily_chance_of_snow: String
                    public let condition: Condition
                    public let uv: Double
                }
                
                public struct Astro: Codable {
                    public let sunrise: String
                    public let sunset: String
                    public let moonrise: String
                    public let moonset: String
                    public let moon_phase: String
                    public let moon_illumination: String
                }
                
                public struct Hour: Codable {
                    public let time_epoch: Double
                    public let time: String
                    public let temp_c: Double
                    public let temp_f: Double
                    public let is_day: Int
                    public let condition: Condition
                    public let wind_mph: Double
                    public let wind_kph: Double
                    public let wind_degree: Int
                    public let wind_dir: String
                    public let pressure_mb: Double
                    public let pressure_in: Double
                    public let precip_mm: Double
                    public let precip_in: Double
                    public let humidity: Int
                    public let cloud: Int
                    public let feelslike_c: Double
                    public let feelslike_f: Double
                    public let windchill_c: Double
                    public let windchill_f: Double
                    public let heatindex_c: Double
                    public let heatindex_f: Double
                    public let dewpoint_c: Double
                    public let dewpoint_f: Double
                    public let will_it_rain: Int
                    public let chance_of_rain: String
                    public let will_it_snow: Int
                    public let chance_of_snow: String
                    public let vis_km: Double
                    public let vis_miles: Double
                    public let gust_mph: Double
                    public let gust_kph: Double
                    public let uv: Double
                }
            }
        }
        
        public struct Condition: Codable {
            public let text: String
            public let icon: String
            public let code: Int
        }
    }
    
    public init (apiKey: String, coordinates: (lat: Double, lon: Double), days: Int) throws {
        do { let url = "https://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(coordinates.lat),\(coordinates.lon)&days=\(days)&aqi=yes&alerts=no"
            do { let data = try Data(contentsOf: URL(string: url)!)
                do { self.data = try JSONDecoder().decode(WAWeatherData.self, from: data)
                } catch { throw error }
            } catch { throw error }
        } catch {throw error }
    }
}
