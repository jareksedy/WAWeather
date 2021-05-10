# WAWeather

WAWeather fetches weather data from WeatherAPI.com. You need to have an API key to use this package. You can freely sign up and receive an API key at WeatherAPI.com.

## Usage

WAWeather needs an API key, GPS coordinates and number of days for a weather forecast.

```swift
let weather = try WAWeather(apiKey: "[insert_your_api_key_here]", coordinates: (lat: 43.23, lon: 76.95), days: 3)
print(weather.data.location.name)
```

Detailed description of weather data model is available at WeatherAPI.com.

## Installation

* Add  `.package(url: "https://github.com/jareksedy/WAWeather.git", from: "1.0.0")` to your `Package.swift` file's `dependencies`.
* Update your packages using `$ swift package update`.

## Contact me

Contact me at jareksedy@icloud.com
