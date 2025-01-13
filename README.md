# Marvel App

Marvel App is an application developed in SwiftUI that uses the public Marvel REST API to display detailed information about the Marvel universe. With it, you can explore a list of characters and discover the series they have participated in.

<div style="display: flex; justify-content: center; align-items: center;">
<img src="https://i.postimg.cc/85T0MGRh/home.png" alt="home view" width="250">
<img src="https://i.postimg.cc/sXK0JLmb/loadingview.png" alt="loading view" width="250">
<img src="https://i.postimg.cc/q7sFNq3J/series.png" alt="series view" width="250">
<img src="https://i.postimg.cc/4yd221Fy/splashview.png" alt="splashview" width="250">
<img src="https://i.postimg.cc/1zhTRw47/searchbar.png" alt="search bar" width="250">
<img src="https://i.postimg.cc/FHJ8QDFJ/errorview.png" alt="Descripción de la imagen" width="250">
</div>

## Features

- **Grid:** Organizes views in an orderly manner into rows and columns.
- **API REST:** The app interacts with a REST API to fetch information about characters and their series.
- **Testing:** The project includes unit and integration tests to ensure the correct functionality of key features.
- **MVVM:** The MVVM design pattern is used to organize the code, separating business logic (Model), user interface representation (View), and data handling (ViewModel).
- **Combine:** Implementation of Combine to handle data reactivity.
- **Async/Await:** Usage of async/await to make API requests efficiently.
- **Swift Packages:** Usage of ViewInspector to test views and subviews.
- **TipKit:** Implementation of TipKit to provide dynamic user tips within the app.
- **RootView:** Usage of states in the app to handle errors.



## Technologies

- SwiftUI
- Xcode
- Grid
- API REST
- Unit Testing
- MVVM
- Combine
- Async/Await
- Swift Packages
- TipKit

## Installation

1. Clone this repository:
   ```bash
   https://github.com/Heandy27/MarvelApp.git
   ```
2. Open the project in Xcode.
3. Run the project on a simulator or physical device.

## Usage

### Character List:
When the app starts, you will see a list of Marvel characters.

### Character Information:
Select a character to see information about the series they have participated in.

## Configuration

- If no heroes appear in the list when starting the app, make sure to configure the `hash`, `ts` and `apikey` parameters in the **NetworkHeroes.swift** file.
- If no information about the series appears when tapping on a hero, you also need to configure these parameters in the **NetworkSeries.swift** file.

**Note:** The values for `hash`, `ts` and `apikey` can be found in the ConstantsApp.swift file of the project.

### Examples:

**Configuration in CharactersNetwork.swift:**
```swift
let urlString = "\(ConstantsApp.CONS_API_URL)\(Endpoints.characters.rawValue)?apikey=\(ConstantsApp.PUBLIC_KEY)&hash=\(ConstantsApp.HASH)&ts=\(ConstantsApp.TS)"
```

**Configuration in SeriesNetwork.swift:**
```swift
let urlString = "\(ConstantsApp.CONS_API_URL)\(Endpoints.characters.rawValue)/\(id)/series?apikey=\(ConstantsApp.PUBLIC_KEY)&hash=\(ConstantsApp.HASH)&ts=\(ConstantsApp.TS)"
```

## Tests

To run the project tests, follow these steps:

1. Open the project in Xcode.
2. Press `Cmd + U` to run the tests.

<hr></hr>
Thank you for reviewing my app. If you want to know more about me or my work, you can find me on these social networks:<br></br>

[![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/heandy27/) 
[![GitHub](https://img.shields.io/badge/GitHub-%23121011.svg?logo=github&logoColor=white)](https://github.com/Heandy27)
