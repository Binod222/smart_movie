import 'package:bloc/bloc.dart';
import 'package:smart_movie/features/profilescreen/presentation/view_model/profilescreen/profilescreen_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
      : super(const ProfileState(
          name: 'John Doe',
          email: 'johndoe@example.com',
          profilePicture: 'assets/images/default_profile.png',
        ));

  void updateName(String newName) {
    emit(state.copyWith(name: newName));
  }

  void updateEmail(String newEmail) {
    emit(state.copyWith(email: newEmail));
  }

  void updateProfilePicture(String newPicture) {
    emit(state.copyWith(profilePicture: newPicture));
  }

  // Add methods for fetching or saving the profile if necessary
}
