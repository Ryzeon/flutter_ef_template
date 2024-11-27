import 'package:flutter/material.dart';
import 'package:flutter_ef_template/shared/presentation/widget/route_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comics App',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true, 
        backgroundColor: Colors.deepPurple,
        elevation: 5,
        toolbarHeight: 80,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/comics.jpeg',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              const RouteButton(
                  text: "Consulta de Superhéroe por nombre", route: "/search"),
              const SizedBox(height: 20),
              const RouteButton(
                  text: "Listado de Superhéroes Favoritos",
                  route: "/favorites"),
            ],
          ),
        ),
      ),
    );
  }
}
