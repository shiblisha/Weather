import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather_bloc.dart';
import 'package:weather/weathermodel.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

bool clicked = false;
late Weathermodel weathermodel;
TextEditingController city = TextEditingController();

class _WeatherState extends State<Weather> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey,
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 10),
        child: Column(
          children: [
            clicked == false
                ? Row(
                    children: [
                      GestureDetector(
                          onTap: () => setState(() {
                                clicked = !clicked;
                              }),
                          child: Icon(Icons.add)),
                      Padding(
                        padding: EdgeInsets.only(left: 90),
                        child: Text(
                          "Thennala",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 100),
                        child: Icon(Icons.settings),
                      )
                    ],
                  )
                : Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Container(
                        height: 30,
                        width: 560,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[700]),
                        child: TextFormField(
                          controller: city,
                          onFieldSubmitted: (value) {
                            BlocProvider.of<WeatherBloc>(context)
                                .add(Fetchweather(city: city.text));
                          },
                        )),
                  ),
            Padding(
              padding: EdgeInsets.only(top: 150, left: 100),
              child: Column(
                children: [
                  Row(children: [
                    BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (context, state) {
                        if (state is WeathergblocLoaded) {
                          weathermodel = BlocProvider.of<WeatherBloc>(context)
                              .trendingMoviesModel;

                           return Text(
                            weathermodel.temp.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w100, fontSize: 150),
                          );
                        }

                        if (state is WeatherblocLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Container();
                      },
                    ),
                    Column(
                      children: [
                        Text(
                          "°C",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 90,
                        )
                      ],
                    ),
                  ])
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 100),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 260, top: 90),
                    child: Text(
                      "More Details >",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.sunny),
                      Text(
                        "Today.Clear",
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 180),
                        child: Text("33°/ 22°", style: TextStyle(fontSize: 15)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.sunny),
                      Text(
                        "Today.Clear",
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 180),
                        child: Text("33°/ 22°", style: TextStyle(fontSize: 15)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.sunny),
                      Text(
                        "Today.Clear",
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 180),
                        child: Text("33°/ 22°", style: TextStyle(fontSize: 15)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
