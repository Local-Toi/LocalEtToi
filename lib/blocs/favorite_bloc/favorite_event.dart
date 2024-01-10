part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  final String favorite;

  const FavoriteEvent({
    required this.favorite,
  });

  @override
  List<Object> get props => [];
}

class FavoritesRequested extends FavoriteEvent {
  const FavoritesRequested(
    String favorite,
  ) : super(favorite: favorite);
}
