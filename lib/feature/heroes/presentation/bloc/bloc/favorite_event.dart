part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent {}

class LoadFavoritesEvent extends FavoriteEvent {}

class RemoveFavoriteEvent extends FavoriteEvent {
  final String heroId;

  RemoveFavoriteEvent(this.heroId);
}