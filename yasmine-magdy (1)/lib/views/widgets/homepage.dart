import 'package:flutter/material.dart';
import 'package:helloworld/views/cubit/albums_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocProvider(
            create: (context) => AlbumsCubit(),
            child: BlocConsumer<AlbumsCubit, AlbumsState>(
              listener: (context, state) {
                if (state is AlbumsLoading) {
                  print("Loading");
                }
              },
              builder: (context, state) {
                return state is AlbumsLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : state is AlbumsSuccess
                        ? ListView.builder(
                            itemCount:
                                context.watch<AlbumsCubit>().albums.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(context
                                        .watch<AlbumsCubit>()
                                        .albums[index]
                                        .title ??
                                    "--"),
                              );
                            },
                          )
                        : Center(
                            child: Text("Error"),
                          );
              },
            )));
  }
}
