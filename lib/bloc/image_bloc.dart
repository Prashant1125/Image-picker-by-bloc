// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_bloc/bloc/image_event.dart';
import 'package:image_picker_bloc/bloc/image_state.dart';
import 'package:image_picker_bloc/utils/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerStates> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerStates()) {
    on<CameraCapture>(cameraCapture);
    on<GalleryImagePicker>(galleryImagePicker);
  }

  void cameraCapture(
      CameraCapture event, Emitter<ImagePickerStates> states) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void galleryImagePicker(
      GalleryImagePicker event, Emitter<ImagePickerStates> states) async {
    XFile? file = await imagePickerUtils.pickImageGallery();
    emit(state.copyWith(file: file));
  }
}
