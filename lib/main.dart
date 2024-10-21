import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_bloc/bloc/image_bloc.dart';
import 'package:image_picker_bloc/utils/image_picker.dart';

import 'screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagePickerBloc(ImagePickerUtils()),
      child: MaterialApp(
        title: 'Image By Bloc',
        theme: ThemeData(useMaterial3: true),
        home: const HomePage(),
      ),
    );
  }
}
