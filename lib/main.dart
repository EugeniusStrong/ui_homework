import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

const Color kPrimaryColor = Colors.red;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            'Whether forecast',
          ),
          centerTitle: true,
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _searchCity(),
            _cityDetail(),
            const SizedBox(
              height: 40,
            ),
            _temperatureDetail(),
            const SizedBox(
              height: 40,
            ),
            _weatherDetail(),
            const SizedBox(
              height: 60,
            ),
            const Text(
              '7-DAY WEATHER FORECAST',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            const BodyListView()
          ],
        ),
      ),
    ),
  );
}

Row _searchCity() {
  return const Row(
    children: [
      Icon(
        Icons.search,
        color: Colors.white,
        size: 25,
      ),
      Text(
        'Enter City Name',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ],
  );
}

Column _cityDetail() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 40,
      ),
      Text(
        'Lipetskaya Oblast,RU',
        style: TextStyle(fontSize: 36, color: Colors.white),
      ),
      Padding(padding: EdgeInsets.only(bottom: 10)),
      Text(
        'Friday,  April 28, 2023',
        style: TextStyle(fontSize: 20, color: Colors.white),
      )
    ],
  );
}

Row _temperatureDetail() {
  return const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.wb_sunny,
          color: Colors.white,
          size: 80,
        ),
        SizedBox(
          width: 100,
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              '16 °C',
              style: TextStyle(color: Colors.white, fontSize: 50),
            )
          ],
        ),
        Row(
          children: [
            Text(
              'CLEAR',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        )
      ],
    ),
  ]);
}

Row _weatherDetail() {
  return const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
    Column(
      children: [
        Icon(
          Icons.air,
          size: 30,
          color: Colors.white,
        ),
        Text(
          '12',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        Text(
          'km/hr',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
    Column(
      children: [
        Icon(
          Icons.cloudy_snowing,
          size: 30,
          color: Colors.white,
        ),
        Text(
          '6',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        Text(
          '%',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
    Column(
      children: [
        Icon(
          Icons.water_drop,
          size: 30,
          color: Colors.white,
        ),
        Text(
          '56',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        Text(
          '%',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
  ]);
}

class BodyListView extends StatelessWidget {
  const BodyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildListView();
  }
}

enum DaysWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

const double cardHeight = 130;
const double cardItemExtent = 250;

Widget _buildListView() {
  const days = DaysWeek.values;

  return SizedBox(
    height: cardHeight,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemExtent: cardItemExtent,
      itemCount: days.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.red[300],
          child: ListTile(
            contentPadding: const EdgeInsets.all(20),
            title: Text(
              days[index].name,
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
            subtitle: const Text(
              '15 °C',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            trailing: const Icon(
              Icons.wb_sunny,
              color: Colors.white,
              size: 60,
            ),
          ),
        );
      },
    ),
  );
}
