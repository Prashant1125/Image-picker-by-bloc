import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_bloc/bloc/image_bloc.dart';
import 'package:image_picker_bloc/bloc/image_event.dart';
import 'package:image_picker_bloc/bloc/image_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal.shade100,
          title: const Text('Image By Bloc'),
        ),
        body: BlocBuilder<ImagePickerBloc, ImagePickerStates>(
            builder: (context, state) {
          if (state.file == null) {
            return Builder(builder: (context) {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: IconButton(
                        onPressed: () {
                          context.read<ImagePickerBloc>().add(CameraCapture());
                        },
                        icon: const Icon(Icons.camera_alt),
                        iconSize: 50,
                      ),
                    ),
                    CircleAvatar(
                      radius: 50,
                      child: IconButton(
                        onPressed: () {
                          context
                              .read<ImagePickerBloc>()
                              .add(GalleryImagePicker());
                        },
                        icon: const Icon(Icons.photo),
                        iconSize: 50,
                      ),
                    ),
                  ],
                ),
              );
            });
          } else {
            return Image.file(File(state.file!.path.toString()));
          }
        }));
  }
}
