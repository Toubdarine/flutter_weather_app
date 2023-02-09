class WeatherDataModel {
  String id;
  String cityName;
  double temperature;
  String skyState;
  String iconCod;
  WeatherDataModel(
      {required this.id,
      required this.cityName,
      required this.temperature,
      required this.skyState,
      required this.iconCod});

// toJson method is unnecessary in this project  but generally
//fromJson factory and the toJson method are best practice to manipulate, send, and recieve data
// i won't use WeatherDataModel.fromJson  but in real project  it should be well defined
  factory WeatherDataModel.fromJson(dynamic data) {
    return WeatherDataModel(
        id: data['id'],
        cityName: data['cityName'],
        temperature: data['temperature'],
        skyState: data['skyState'],
        iconCod: data['icon']);
  }
}
