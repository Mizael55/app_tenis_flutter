import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../screens/screens.dart';

class CanchasCard extends StatelessWidget {
  const CanchasCard({super.key, required this.canchasList});

  final List<CanchasModels> canchasList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final getWeather = Provider.of<WeatherProvider>(context).weatherData;
    getWeather.isEmpty
        ? Provider.of<WeatherProvider>(context).fetchWeatherData()
        : null;

    return getWeather.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
            width: size.width,
            height: size.height * 0.6,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text('Canchas',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        )),
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.5,
                    margin: const EdgeInsets.only(top: 16),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: canchasList.length,
                      itemBuilder: (context, index) {
                        final cancha = canchasList[index];
                        return Container(
                          width: size.width * 0.7,
                          height: size.height * 0.3,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: size.width,
                                height: size.height * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(cancha.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      cancha.title,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/img/pronostico.jpg',
                                          width: 20,
                                          height: 20,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '${getWeather[0]['clouds']}%',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                        DateTime.now()
                                            .toString()
                                            .substring(0, 10),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 16)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                        cancha.available
                                            ? 'Disponible'
                                            : 'No disponible',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 16)),
                                    const SizedBox(width: 2),
                                    const CircleAvatar(
                                      radius: 4,
                                      backgroundColor: Colors.blue,
                                    ),
                                    const SizedBox(width: 2),
                                    const Icon(
                                      Icons.access_time,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 1),
                                    !cancha.available
                                        ? const Text('Horario',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16))
                                        : Flexible(
                                            child: Text(
                                                '${cancha.starthour} - ${cancha.endhour}',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16)),
                                          ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: cancha.available
                                    ? () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ReserveScreen(
                                              weather: getWeather[0]['clouds']
                                                  .toString(),
                                              canchaDetails: cancha,
                                            ),
                                          ),
                                        );
                                      }
                                    : null,
                                child: Container(
                                  width: size.width * 0.5,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.1,
                                      vertical: size.height * 0.01),
                                  margin: const EdgeInsets.only(top: 40),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: cancha.available
                                        ? const Color.fromARGB(255, 92, 141, 9)
                                        : Colors.grey,
                                  ),
                                  child: const Center(
                                      child: Text('Reservar',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
