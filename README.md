# WAWeather

WAWeather (WeatherApi.com Weather) fetches weather data from WeatherAPI.com. You need to have an API key to use this package. You can sign up and get an API key at WeatherAPI.com for free.

## Usage

WAWeather needs an API key, latitude and longitude coordinates of a location, number of days for a forecast (default is one). When currentOnly is set to true WAWeather fetches only current weather conditions for a given location. 

```swift
let weather = try WAWeather(apiKey: "[insert_your_api_key_here]", coordinates: (lat: 43.23, lon: 76.95), days: 3, currentOnly: false)
print(weather.data)
```

Detailed description of data model is available at WeatherAPI.com. See https://www.weatherapi.com/docs/ for reference.

## Installation

* Add  `.package(url: "https://github.com/jareksedy/WAWeather.git", from: "1.0.0")` to your `Package.swift` file's `dependencies`.
* Update your packages using `$ swift package update`.

## Contact me

Contact me at jareksedy@icloud.com
