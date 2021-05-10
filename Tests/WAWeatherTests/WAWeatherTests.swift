    import XCTest
    @testable import WAWeather

    final class WAWeatherTests: XCTestCase {
        func testExample() {
            
            do {
                let weather = try WAWeather(apiKey: "32751b60b3d045ea8f1153512210905", coordinates: (lat: 45.0, lon: 45.0), days: 1)
                XCTAssertEqual(weather.data.location.lat, 45.0)
                XCTAssertEqual(weather.data.location.lon, 45.0)
                
            } catch {
                print(error)
            }
        }
    }
