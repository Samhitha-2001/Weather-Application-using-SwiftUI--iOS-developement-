This is a weather application, built using SwiftUI.

The app fetches weather and forecast data from openweather api. (https://openweathermap.org/api)

On launching the app for the first time, it asks permission to access the device location. On recieving the permission, the app fetches the weather and forecast data for the current location.

<p align="center">
  <img src="https://github.com/Samhitha-2001/Weather-Application-using-SwiftUI--iOS-developement-/blob/main/screenshots/First-screen.png" width="250" height="400" />
</p>

The location of my emulator is set to San Fransisco, hence the city name. 
The star icon on the top left corner of the screen is a button used to add a city to favourites list.
The screen shows various weather information bits.
The button at the bottom of the screen that says "Get Forecast" is used to fetch forecast data for the city loaded.

<p align="center">
  <img src="https://github.com/Samhitha-2001/Weather-Application-using-SwiftUI--iOS-developement-/blob/main/screenshots/forecast1.png" width="250" height="400" />
  <img src="https://github.com/Samhitha-2001/Weather-Application-using-SwiftUI--iOS-developement-/blob/main/screenshots/forecast2.png" width="250" height="400" />
</p>

The arrow at the top left of the screen helps us navigate back to our weather screen.
The icon at the top right corner of the weather screen is the Menu button, on pressing which the following can be seen.

<p align="center">
  <img src="https://github.com/Samhitha-2001/Weather-Application-using-SwiftUI--iOS-developement-/blob/main/screenshots/Menu.png" width="250" height="400" />
</p>

The menu button opens a sheet with three more buttons.
The first one that says Favourites takes us to the favourite screen, wherein all the favourited cities are present.

<p align="center">
  <img src="https://github.com/Samhitha-2001/Weather-Application-using-SwiftUI--iOS-developement-/blob/main/screenshots/Fav-cities.png" width="250" height="400" />
</p>

On clicking on any of the cities, the weather and forecast for that particular city is loaded.
Suppose I tap on Kolkata.

<p align="center">
  <img src="https://github.com/Samhitha-2001/Weather-Application-using-SwiftUI--iOS-developement-/blob/main/screenshots/Fav-city-tap.png" width="250" height="400" />
</p>

Let us reove Kolkata from favourite list. Clicking the star button on the top left removes it from the list.

<p align="center">
  <img src="https://github.com/Samhitha-2001/Weather-Application-using-SwiftUI--iOS-developement-/blob/main/screenshots/Unstar-fav-city.png" width="250" height="400" />
  -->
  <img src="https://github.com/Samhitha-2001/Weather-Application-using-SwiftUI--iOS-developement-/blob/main/screenshots/Unstared-city-removed-from-fav-cities.png" width="250" height="400" />
</p>

The next thing on the menu button sheet is the search option. 
Clicking on it opens a sheet wherein you can enter the name of the city you want to search.

<p align="center">
  <img src="https://github.com/Samhitha-2001/Weather-Application-using-SwiftUI--iOS-developement-/blob/main/screenshots/Search.png" width="250" height="400" />
  -->
  <img src="https://github.com/Samhitha-2001/Weather-Application-using-SwiftUI--iOS-developement-/blob/main/screenshots/Search-city.png" width="250" height="400" />
  -->
  <img src="https://github.com/Samhitha-2001/Weather-Application-using-SwiftUI--iOS-developement-/blob/main/screenshots/Search-result-loaded.png" width="250" height="400" />
</p>

The last one in the menu sheet is the current location, on clicking it the weather and forecast for the current location is loaded.
