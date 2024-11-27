import 'package:flutter/material.dart';
import 'package:flutter_ef_template/core/shared_helper.dart';
import 'package:flutter_ef_template/feature/heroes/data/repository/heroe_repository.dart';
import 'package:flutter_ef_template/feature/heroes/domain/heroe.dart';
import 'package:flutter_ef_template/feature/heroes/presentation/widgets/heroe_card_widget.dart';

class SearchHeroeScreen extends StatefulWidget {
  const SearchHeroeScreen({super.key});

  @override
  State<SearchHeroeScreen> createState() => _SearchHeroeScreenState();
}

class _SearchHeroeScreenState extends State<SearchHeroeScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Heroe> _heroes = [];
  int _resultCount = 0;

  Future<void> _searchHeroes(String name) async {
    final currentContext = context;

    try {
      final List<Heroe> heroes =
          await HeroeRepository().searchHeroes(name: name);

      setState(() {
        _heroes = heroes;
        _resultCount = heroes.length;
      });

      SharedHelper().setValue('resultCount', _resultCount);
    } catch (e) {
      if (currentContext.mounted) {
        ScaffoldMessenger.of(currentContext).showSnackBar(
          SnackBar(content: Text( '$e'.replaceAll('Exception: ', ""))),
        );
      }
    }
  }

  Future<void> _loadCount() async {
    final int resultCount = await SharedHelper().getValue('resultCount');
    setState(() {
      _resultCount = resultCount;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de Superhéroe'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nombre del Superhéroe',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _searchHeroes(_controller.text);
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),

            Text('Resultados encontrados: $_resultCount'),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: _heroes.length,
                itemBuilder: (context, index) {
                  final hero = _heroes[index];
                  return HeroeCardWidget(hero: hero);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}