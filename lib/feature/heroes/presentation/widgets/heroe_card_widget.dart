import 'package:flutter/material.dart';
import 'package:flutter_ef_template/feature/heroes/data/local/heroe_dao.dart';
import 'package:flutter_ef_template/feature/heroes/domain/heroe.dart';

class HeroeCardWidget extends StatefulWidget {
  const HeroeCardWidget({
    super.key,
    required this.hero,
  });

  final Heroe hero;
  @override
  State<HeroeCardWidget> createState() => _HeroeCardWidgetState();
}

class _HeroeCardWidgetState extends State<HeroeCardWidget> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  Future<void> _checkFavoriteStatus() async {
    final favoriteStatus = await HeroeDao().isFavorite(widget.hero.id);
    setState(() {
      isFavorite = favoriteStatus;
    });
  }

  Future<void> _toggleFavorite() async {
    final context = this.context;
    if (isFavorite) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Para eliminar un favorito, ve a la pantalla de favoritos'),
          ),
        );
      }
    } else {
      await HeroeDao().insertFavorite(widget.hero);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${widget.hero.name} agregado a favoritos'),
          ),
        );
      }
    }
    await _checkFavoriteStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: widget.hero.image.isNotEmpty
            ? Image.network(
                widget.hero.image,
                width: 50,
                height: 50,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    'https://www.shutterstock.com/image-vector/image-not-found-failure-network-260nw-2330163829.jpg',
                    width: 50,
                    height: 50,
                  );
                },
              )
            : const Icon(Icons.person),
        title: Text(widget.hero.name),
        subtitle: Text(
            'Género: ${widget.hero.gender}, Inteligencia: ${widget.hero.intelligence}'),
        trailing: IconButton(
          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          color: isFavorite ? Colors.red : Colors.grey,
          onPressed: _toggleFavorite,
        ),
      ),
    );
  }
}
