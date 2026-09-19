# Weather

A native iOS weather app built with SwiftUI. It lets you search for a city, save it to a favorites list, and view current conditions plus a multi-day/hourly forecast, all powered by the OpenWeatherMap API.

## Features

- **City search** – look up any city by name and add it to your list.
- **Favorites list** – saved cities are shown as cards with their high/low temperature, and can be reordered or removed (swipe-to-delete / Edit mode).
- **Forecast detail view** – tapping a city shows current temperature, an hourly forecast strip, sunrise/sunset times, humidity, wind speed/direction, and pressure.
- **Settings screen** – toggle Dark Mode and adjust how many cities are shown in the favorites list.
- **Light/Dark appearance** – the whole app respects a user-controlled dark mode switch, persisted with `@AppStorage`.
- **Custom themed background** – a gradient background built from asset-catalog colors (`AppBackground` / `AppTint`) used across every screen.

## Built With

- **Swift** & **SwiftUI** for the UI and app lifecycle (`@main` `App` struct)
- **Combine** (`ObservableObject` / `@Published`) for shared app state (`Weathers`, `DetailWeathers`, `Settings`)
- **URLSession** for networking and **Codable** for JSON decoding of API responses
- **[OpenWeatherMap API](https://openweathermap.org/api)** – the `Current Weather Data` and `5 Day / 3 Hour Forecast` endpoints
- Xcode project targeting **iOS 16.4+**

## Prerequisites

- macOS with **Xcode** (14 or later recommended, since the project's `PBXFileSystemSynchronizedRootGroup` format requires a recent Xcode)
- An iOS Simulator or physical device running **iOS 16.4+**
- An [OpenWeatherMap](https://openweathermap.org/api) API key (free tier works)

## Configuration

Network calls are made in `WeatherAppSwift/WeatherAppSwift/WeatherData/FetchWeather.swift`, which currently has an API key hardcoded in the `FetchData` struct:

```swift
struct FetchData {
    let apiKey = "..."
    ...
}
```

To run the app with your own account, sign up for a free API key at [openweathermap.org](https://openweathermap.org/api) and replace the `apiKey` value in that file. Keeping API keys out of source control (e.g. via an `.xcconfig` file or `Info.plist` entry ignored by git) is a natural next improvement.

## Installation & Running

```bash
brew install git
xcode-select --install
git clone https://github.com/ParsaEnayatiCE/weather.git
```

Then open `WeatherAppSwift/WeatherAppSwift.xcodeproj` in Xcode, select a simulator (or a connected device), and press **Run** (⌘R).

## Usage

1. Launch the app — you land on the **Favorite** tab.
2. Tap the **+** button to open search, type a city name, and tap the add icon to fetch and save its weather.
3. Tap a saved city to open its forecast detail screen (current conditions, hourly strip, sunrise/sunset, humidity, wind, pressure).
4. Swipe left or use **Edit** on the Favorite tab to remove a city.
5. Use the **Setting** tab to toggle Dark Mode or change how many cities are kept in the list.

## Project Structure

```
WeatherAppSwift/
├── WeatherAppSwift.xcodeproj
└── WeatherAppSwift/
    ├── Models/
    │   └── WeatherAppSwiftApp.swift   # @main App entry point, injects shared state
    ├── Weather/
    │   ├── Weather.swift              # Lightweight view models (cityWeather, CityDetailWeather, ...)
    │   └── Weathers.swift             # ObservableObject stores for favorites and forecast detail
    ├── WeatherData/
    │   ├── FetchWeather.swift         # OpenWeatherMap networking + JSON parsing
    │   ├── WeatherData.swift          # Codable model for the current-weather endpoint
    │   └── WeatherDatailData.swift    # Codable model for the forecast endpoint
    ├── Views/
    │   ├── RootView.swift             # Tab bar container (Favorite / Setting)
    │   ├── FavoriteView.swift         # Saved cities list
    │   ├── SearchView.swift / SearchCardView.swift  # City search + add flow
    │   ├── ForeCastView.swift         # Forecast detail screen
    │   ├── HourSummaryView.swift      # Hourly forecast card
    │   ├── CardView.swift             # Favorite-list city card
    │   ├── SettingView.swift          # Dark mode + list size settings
    │   └── BackgroundView.swift       # Shared gradient background
    └── Assets.xcassets/               # App icon and theme colors
```

## Implementation Notes

- App-wide state is shared through `EnvironmentObject`s (`Weathers`, `DetailWeathers`, `Settings`) injected at the root `WindowGroup`, rather than a single view model — a simple pattern that fits the app's small scope.
- Weather data is fetched with plain `URLSession` completion handlers and decoded with `Codable`, without any networking abstraction library.
- Dark mode preference is persisted with `@AppStorage("isDarkMode")`.
- The project uses Xcode's newer synchronized file group format (folder references sync automatically with the file system), which is why some source files exist in more than one path in the repository.
