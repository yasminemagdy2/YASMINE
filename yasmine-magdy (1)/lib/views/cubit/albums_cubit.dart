import 'package:flutter/material.dart';
import 'package:helloworld/services/albumsS.dart';
import 'package:helloworld/models/albums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'albums_state.dart';

class AlbumsCubit extends Cubit<AlbumsState> {
  AlbumsCubit() : super(AlbumsInitial()) {
    getAlbums();
  }
  List<Albums> albums = [];

  getAlbums() async {
    try {
      emit(AlbumsLoading());
      albums = await AlbumsS().getAlbums();
      emit(AlbumsSuccess());
    } catch (e) {
      print(e.toString());
      emit(AlbumsError());
    }
  }
}
