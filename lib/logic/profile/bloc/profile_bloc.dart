import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yunicorn_empulse/core/navigation/navigation_services.dart';
import 'package:yunicorn_empulse/routes/app_routes.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      
    });
    on<ClickOnImagePickerEvent>(clickOnImagePickerEvent);
  }


  FutureOr<void> clickOnImagePickerEvent(ClickOnImagePickerEvent event, Emitter<ProfileState> emit) async {
    final imagePicker = ImagePicker();
    XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if(pickedImage == null){
      return;
    }
    emit(ProfileInitial(pickedImage: pickedImage));
  }
}
