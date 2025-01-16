import 'package:equatable/equatable.dart';

abstract class ImagepicketEvent extends Equatable {
  const ImagepicketEvent();
 @override
  List<Object> get props => [];
}
class CameraCapture extends ImagepicketEvent{}
class GalleryCapture extends ImagepicketEvent{}