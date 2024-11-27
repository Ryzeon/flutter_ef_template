part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteState {}

class FavoritesInitial extends FavoriteState {}

class FavoritesLoading extends FavoriteState {}

class FavoritesLoaded extends FavoriteState {
  final List<Heroe> heroes;

  FavoritesLoaded(this.heroes);
}

class FavoritesError extends FavoriteState {
  final String message;

  FavoritesError(this.message);
}