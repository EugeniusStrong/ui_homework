import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
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
            const Padding(padding: EdgeInsets.only(bottom: 40)),
            _temperatureDetail(),
            const Padding(padding: EdgeInsets.only(bottom: 40)),
            _weatherDetail(),
            const Padding(padding: EdgeInsets.only(bottom: 60)),
            const Text(
              '7-DAY WEATHER FORECAST',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            const BodyListView()
          ],
        ),
      ),
    ),
  );
}

Row _searchCity() {
  return Row(
    children: const [
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
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      Padding(padding: EdgeInsets.all(16)),
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
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
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
          children: const [
            Text(
              '16 °C',
              style: TextStyle(color: Colors.white, fontSize: 50),
            )
          ],
        ),
        Row(
          children: const [
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
  return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
    Column(
      children: const [
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
      children: const [
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
      children: const [
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
    return _myListView();
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

Widget _myListView() {
  const days = DaysWeek.values;

  return SizedBox(
    height: 130,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: 250,
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
        }),
  );
}
