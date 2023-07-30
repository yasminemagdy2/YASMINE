part of 'albums_cubit.dart';

@immutable
abstract class AlbumsState {}

class AlbumsInitial extends AlbumsState {}

class AlbumsLoading extends AlbumsState {}

class AlbumsSuccess extends AlbumsState {}

class AlbumsError extends AlbumsState {}
