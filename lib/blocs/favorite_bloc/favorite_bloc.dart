import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favorites_repository/favorite_repository.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository _favoriteRepository;

  FavoriteBloc({
    required FavoriteRepository favoriteRepository,
  })  : _favoriteRepository = favoriteRepository,
        super(FavoriteBlocInitial()) {
    on<FavoriteEvent>((event, emit) async {
      if (event is FavoriteAdded) {
        await _favoriteRepository.addFavorite(event.favorite);
      } else if (event is FavoriteRemoved) {
        await _favoriteRepository.removeFavorite(event.favorite);
      }
    });

    on<FavoritesRequested>((event, emit) async {
      try {
        final favorites = await _favoriteRepository.getFavorites();
        emit(FavoritesLoadSuccess(
          favorites,
        ));
      } catch (e) {
        emit(FavoritesLoadFailure());
      }
    });
  }
}
