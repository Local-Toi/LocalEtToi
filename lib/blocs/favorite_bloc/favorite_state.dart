part of 'favorite_bloc.dart';

sealed class FavoriteBlocState extends Equatable {
  const FavoriteBlocState();
  @override
  List<Object> get props => [];
}

final class FavoriteBlocInitial extends FavoriteState {}

class FavoriteAdded {
  final String favorite;

  const FavoriteAdded(this.favorite);
}

class FavoriteRemoved {
  final String favorite;

  const FavoriteRemoved(this.favorite);
}

class FavoritesLoadSuccess extends FavoriteState {
  final List<String> favorites;

  const FavoritesLoadSuccess(
    this.favorites,
  );

  @override
  List<Object> get props => [favorites];
}

class FavoritesLoadFailure extends FavoriteState {
  final String? message;

  const FavoritesLoadFailure({this.message});
}
