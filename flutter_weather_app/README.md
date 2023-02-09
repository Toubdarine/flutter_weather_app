# Flutter_Weather_App
This is a simple flutter app that fetches weather data from OpenWeatherMap API. The app has two screens: 
Home Screen  
Weather Data Screen.

# Home Screen
The Home Screen has the name of the app and a button to navigate to the Weather Data Screen.

# Weather Data Screen
The Weather Data Screen is the main screen of the app, where you can see the weather data of 5 cities. The screen starts with a progression bar, which shows the progress of 5 API calls, one every 10 seconds. The first API call is made right after the animation starts, and the others are made through the handler that is defined in the animation controller's listener.

After 60 seconds, the app displays a table of 5 lines, showing the name of a city and some weather data, such as sky state, temperature, and an icon for sky state. If all the API calls succeed, the table will be displayed. Otherwise, an error message will be displayed.

When the 60 seconds end, the progression bar becomes a 'Retry' button, allowing you to retry the API calls. In this screen, there is also a button in the top-left corner to navigate back to the Home Screen.

Requirements
1. Flutter SDK
2. A device or emulator to run the app
3. OpenWeatherMap API Key

# How to run the app

1. Clone the repository to your local machine.
2. Open the terminal in the root directory of the project.
3. Run the following command to install the dependencies:
flutter pub get

4. Create a file named .env in root directory of the flutter project and add the following 
OPEN_WEATHER_API_KEY='YOUR_API_KEY';



5. Run the following command to run the app:

flutter run
The app should now be running on your device/emulator.

# Troubleshooting
If you encounter any issues while running the app, please check if all the dependencies are installed and your API key is correct. If the issue persists, feel free to create an issue in the repository.

Run the following command to run the app:
Copy code
flutter run
The app should now be running on your device/emulator.
Troubleshooting
If you encounter any issues while running the app, please check if all the dependencies are installed and your API key is correct. If the issue persists, feel free to create an issue in the repository.
