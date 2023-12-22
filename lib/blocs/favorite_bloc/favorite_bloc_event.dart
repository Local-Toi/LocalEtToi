part of 'favorite_bloc_bloc.dart';

sealed class FavoriteBlocEvent extends Equatable {
  final String favorite;

  const FavoriteBlocEvent({
    required this.favorite,
  });

  @override
  List<Object> get props => [];
}

class FavoritesRequested extends FavoriteBlocEvent {
  const FavoritesRequested(
    String favorite,
  ) : super(favorite: favorite);
}
