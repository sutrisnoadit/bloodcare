import 'package:get/get.dart';
class Ambulance {
  final String name;
  final String hospitalName;
  final String address;
  final String imageUrl;

  Ambulance({
    required this.name,
    required this.hospitalName,
    required this.address,
    required this.imageUrl,
  });
}
class AmbulanceController extends GetxController {
  var selectedCountry = 'Bangladesh'.obs;
  var selectedCity = 'Dhaka'.obs;
  var ambulances = <Ambulance>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAmbulances();
  }

  void setCountry(String country) {
    selectedCountry.value = country;
    fetchAmbulances();
  }

  void setCity(String city) {
    selectedCity.value = city;
    fetchAmbulances();
  }

  void fetchAmbulances() {
    // Simulated data - In real app, this would be an API call
    ambulances.value = [
      Ambulance(
        name: 'Ambulance name',
        hospitalName: 'Hospital name',
        address: '2118 Thornridge Cir. Syracuse',
        imageUrl: 'asset/ambulance.jpg',
      ),
      Ambulance(
        name: 'Ambulance name',
        hospitalName: 'Hospital name',
        address: '2464 Royal Ln.',
        imageUrl: 'asset/ambulance.jpg',
      ),
      Ambulance(
        name: 'Ambulance name',
        hospitalName: 'Hospital name',
        address: '6391 Elgin St',
        imageUrl: 'asset/ambulance.jpg',
      ),
    ];
  }
}