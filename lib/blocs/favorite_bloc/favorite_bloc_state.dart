part of 'favorite_bloc_bloc.dart';

sealed class FavoriteBlocState extends Equatable {
  const FavoriteBlocState();
  
  @override
  List<Object> get props => [];
}

final class FavoriteBlocInitial extends FavoriteBlocState {}
