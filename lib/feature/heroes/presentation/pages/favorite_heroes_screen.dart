import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ef_template/feature/heroes/presentation/bloc/bloc/favorite_bloc.dart';

class FavoriteHeroesScreen extends StatelessWidget {
  const FavoriteHeroesScreen({super.key});

   @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoriteBloc()..add(LoadFavoritesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Superhéroes Favoritos'),
        ),
        body: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is FavoritesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavoritesLoaded) {
              if (state.heroes.isEmpty) {
                return const Center(child: Text('No hay superhéroes favoritos.'));
              }
              return ListView.builder(
                itemCount: state.heroes.length,
                itemBuilder: (context, index) {
                  final hero = state.heroes[index];
                  return Card(
                    child: ListTile(
                      leading: hero.image.isNotEmpty
                          ? Image.network(hero.image, width: 50, height: 50)
                          : const Icon(Icons.person),
                      title: Text(hero.name),
                      subtitle: Text('Género: ${hero.gender}, Inteligencia: ${hero.intelligence}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () {
                          context.read<FavoriteBloc>().add(RemoveFavoriteEvent(hero.id));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${hero.name} eliminado de favoritos')),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            } else if (state is FavoritesError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Estado desconocido.'));
            }
          },
        ),
      ),
    );
  }
}