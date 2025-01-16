import 'package:bloc_flutter/bloc/image_picker/imagepicker_state.dart';
import 'package:bloc_flutter/bloc/image_picker/imagepicket_event.dart';
import 'package:bloc_flutter/utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class Imagepickerbloc extends Bloc<ImagepicketEvent, ImagepickerState> {
  final ImagePickerUtils imagePickerUtils;
 Imagepickerbloc(this.imagePickerUtils) : super(ImagepickerState()){
  on<CameraCapture>(_cameraCapture);
  on<GalleryCapture>(_galleryCapture);
 }

 void _cameraCapture(CameraCapture event, Emitter<ImagepickerState> emit)async{
  final XFile? file = await imagePickerUtils.cameraCapture();
  emit(state.copyWith(file: file));
 }
  void _galleryCapture(GalleryCapture event, Emitter<ImagepickerState> emit)async{
  final XFile? file = await imagePickerUtils.galleryCapture();
  emit(state.copyWith(file: file));
 }
}