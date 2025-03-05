// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smart_movie/features/profile/presentation/view_model/profile_bloc.dart';
// import 'package:smart_movie/features/profile/presentation/view_model/profile_event.dart';
// import 'package:smart_movie/features/profile/presentation/view_model/profile_state.dart';
// import 'package:smart_movie/features/profile/presentation/widgets/profile_info.dart';
// import 'package:smart_movie/features/profile/presentation/widgets/profile_picture.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   _ProfileViewState createState() => _ProfileViewState();
// }

// class _ProfileViewState extends State<ProfilePage> {
//   @override
//   void initState() {
//     super.initState();
//     context
//         .read<ProfileBloc>()
//         .add(FetchProfile(userId: "123")); // Replace with actual user ID
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Profile")),
//       body: BlocBuilder<ProfileBloc, ProfileState>(
//         builder: (context, state) {
//           if (state is ProfileLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is ProfileLoaded) {
//             return Column(
//               children: [
//                 ProfilePicture(imageUrl: state.profile.profilePicture),
//                 SizedBox(height: 20),
//                 ProfileInfo(
//                     name: state.profile.name, email: state.profile.email),
//               ],
//             );
//           } else if (state is ProfileError) {
//             return Center(child: Text(state.message));
//           } else {
//             return Center(child: Text("No profile data available"));
//           }
//         },
//       ),
//     );
//   }
// }
