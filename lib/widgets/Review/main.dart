import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'IFocus - Avaliação',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _ratingValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Avalie seu colega', style: TextStyle(fontSize: 30)),
            IconButton(
              icon: Icon(Icons.more_vert),
              color: Colors.black54,
              iconSize: 32,
              onPressed: () {
                print("Configurações");
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Quantas estrelas seu colega merece?',
                style: TextStyle(fontSize: 28),
              ),
              const SizedBox(height: 25),
              Container(
                color: Colors.white,
                height: 300.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150.0),
                          image: const DecorationImage(
                              image: NetworkImage('../img/2.png'))),
                      height: 250,
                      width: 250,
                    ), //foto
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 400,
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        "Nome Do Aluno Aqui",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  )
                ],
              ),

              // estrelas
              RatingBar(
                  initialRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ratingWidget: RatingWidget(
                      full: const Icon(Icons.star, color: Colors.orange),
                      half: const Icon(
                        Icons.star_half,
                        color: Colors.orange,
                      ),
                      empty: const Icon(
                        Icons.star_outline,
                        color: Colors.orange,
                      )),
                  onRatingUpdate: (value) {
                    setState(() {
                      _ratingValue = value;
                    });
                  }),
              const SizedBox(height: 25),

              //mostrando o resultado
              Container(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                child: Text(
                  _ratingValue != null ? _ratingValue.toString() : 'Avalie!',
                  style: const TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
              SizedBox(
                width: 300,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print("Enviado");
                      },
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.lightGreen,
                        elevation: 3,
                      ),
                      child: const Text("Enviar", style: TextStyle(fontSize: 30),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
