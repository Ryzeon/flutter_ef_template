import 'package:bloc/bloc.dart';
import 'package:flutter_ef_template/feature/heroes/data/local/heroe_dao.dart';
import 'package:flutter_ef_template/feature/heroes/domain/heroe.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  
  FavoriteBloc() : super(FavoritesInitial()) {
    on<LoadFavoritesEvent>((event, emit) async {
      emit(FavoritesLoading());
      try {
        final heroes = await HeroeDao().getAll();
        emit(FavoritesLoaded(heroes));
      } catch (e) {
        emit(FavoritesError('Error al cargar los favoritos.'));
      }
    });

    on<RemoveFavoriteEvent>((event, emit) async {
      if (state is FavoritesLoaded) {
        try {
          await HeroeDao().deleteFavorite(event.heroId);
          final updatedHeroes = (state as FavoritesLoaded).heroes
              .where((hero) => hero.id != event.heroId)
              .toList();
          emit(FavoritesLoaded(updatedHeroes));
        } catch (e) {
          emit(FavoritesError('Error al eliminar el héroe.'));
        }
      }
    });
  }
}