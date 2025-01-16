import 'dart:io';

import 'package:bloc_flutter/bloc/image_picker/imagepicker_bloc.dart';
import 'package:bloc_flutter/bloc/image_picker/imagepicker_state.dart';
import 'package:bloc_flutter/bloc/image_picker/imagepicket_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Imagepickerbloc, ImagepickerState>(builder: (context, state){
        if(state.file == null){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  child: IconButton(onPressed: (){
                    context.read<Imagepickerbloc>().add(CameraCapture());
                  }, icon: Icon(Icons.camera)),
                ),
              ),
            ],
          );
        }else{
          return Image.file(File(state.file!.path.toString()));
        }
      }),
    );
  }
}