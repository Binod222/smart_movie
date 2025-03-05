import 'package:bloc/bloc.dart';
import 'package:smart_movie/features/profile/data/repositories/profile_repository.dart';
import 'package:smart_movie/features/profile/presentation/view_model/profile_event.dart';
import 'package:smart_movie/features/profile/presentation/view_model/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository}) : super(ProfileInitial()) {
    on<FetchProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        final profile = await profileRepository.getProfile(event.userId);
        emit(ProfileLoaded(profile));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });
  }
}