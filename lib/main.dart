import 'package:bloc_flutter/bloc/counter/counter_bloc.dart';
import 'package:bloc_flutter/bloc/image_picker/imagepicker_bloc.dart';
import 'package:bloc_flutter/bloc/switch/switch_bloc.dart';
import 'package:bloc_flutter/utils/image_picker_utils.dart';
import 'package:bloc_flutter/view/image_picker/image_picker_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
         BlocProvider(
          create: (context) => Imagepickerbloc(ImagePickerUtils()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ImagePickerScreen()
      ),
    );
  }
}
