    import XCTest
    @testable import WAWeather

    final class WAWeatherTests: XCTestCase {
        func testExample() {
            
            do {
                let weather = try WAWeather(apiKey: "32751b60b3d045ea8f1153512210905", coordinates: (lat: 33.543682, lon: -86.779633))
                XCTAssertEqual(weather.data.location.name, "East Birmingham")
                
            } catch {
                print(error)
            }
        }
    }
