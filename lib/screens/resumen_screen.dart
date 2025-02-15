import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key, required this.canchaDetails});

  final CanchasModels canchaDetails;

  @override
  Widget build(BuildContext context) {
    final getWeather = Provider.of<WeatherProvider>(context).weatherData;
    getWeather.isEmpty
        ? Provider.of<WeatherProvider>(context).fetchWeatherData()
        : null;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            width: size.width,
            height: size.height * 0.3,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    canchaDetails.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 64, 163, 68),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: IconButton(
                    icon: const Icon(Icons.favorite_border,
                        color: Colors.white, size: 30),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: SizedBox(
              width: size.width,
              height: size.height * 0.7,
              child:  SingleChildScrollView(
                child: Column(
                  children: [
                    ReserveDetails(
                      reserveDetails: true, reserveDetailsCanchaSelected: canchaDetails,
                       weather: getWeather[0]['clouds'].toString(),
                    ),
                    ResumeCard(reserveDetailsCanchaSelected: canchaDetails,),
                    PayCard(reserveDetailsCanchaSelected: canchaDetails,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
