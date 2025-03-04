import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_movie/features/auth/presentation/view/login_screen.dart';
import 'package:smart_movie/features/auth/presentation/view_model/signup/register_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

// class _RegisterViewState extends State<RegisterView> {
//   bool _obscureText = true;
//   final userNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   String? _errorMessage;
//   File? _img;

//   // Request camera and storage permission
//   Future<void> checkPermissions() async {
//     await Permission.camera.request();
//     await Permission.storage.request();
//   }

//   // Open dialog to choose camera or gallery
//   void _showImagePickerDialog() {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       builder: (context) {
//         return Wrap(
//           children: [
//             ListTile(
//               leading: const Icon(Icons.camera),
//               title: const Text('Camera'),
//               onTap: () {
//                 Navigator.pop(context);
//                 _browseImage(ImageSource.camera);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.photo),
//               title: const Text('Gallery'),
//               onTap: () {
//                 Navigator.pop(context);
//                 _browseImage(ImageSource.gallery);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // Pick image from camera or gallery
//   Future<void> _browseImage(ImageSource imageSource) async {
//     try {
//       final image = await ImagePicker().pickImage(source: imageSource);
//       if (image != null) {
//         setState(() {
//           _img = File(image.path);
//           context.read<RegisterBloc>().add(LoadImage(file: _img!));
//         });
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xFF1D3557),
//                 Color(0xFF457B9D),
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//           child: Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // **Profile Photo Upload Section**
//                   GestureDetector(
//                     onTap: _showImagePickerDialog,
//                     child: CircleAvatar(
//                       radius: 60,
//                       backgroundColor: Colors.white,
//                       backgroundImage: _img != null ? FileImage(_img!) : null,
//                       child: _img == null
//                           ? const Icon(Icons.camera_alt,
//                               size: 50, color: Colors.grey)
//                           : null,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     'Create an Account',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 30),

//                   // Full Name Field
//                   TextFormField(
//                     controller: userNameController,
//                     decoration: _inputDecoration('Enter Username'),
//                     style: const TextStyle(color: Colors.white),
//                     validator: (value) =>
//                         value!.isEmpty ? 'Username is required' : null,
//                   ),
//                   const SizedBox(height: 20),

//                   // Email Field
//                   TextFormField(
//                     controller: emailController,
//                     decoration: _inputDecoration('Enter Your Email'),
//                     style: const TextStyle(color: Colors.white),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Email is required';
//                       } else if (!RegExp(
//                               r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                           .hasMatch(value)) {
//                         return 'Enter a valid email address';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 20),

//                   // Password Field with Visibility Toggle
//                   TextFormField(
//                     controller: passwordController,
//                     obscureText: _obscureText,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.transparent,
//                       hintText: 'Create Password',
//                       hintStyle: const TextStyle(color: Colors.white),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _obscureText
//                               ? Icons.visibility_off
//                               : Icons.visibility,
//                           color: Colors.white,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _obscureText = !_obscureText;
//                           });
//                         },
//                       ),
//                     ),
//                     style: const TextStyle(color: Colors.white),
//                     validator: (value) =>
//                         value!.isEmpty ? 'Password is required' : null,
//                   ),
//                   const SizedBox(height: 30),

//                   // Register Button
//                   ElevatedButton(
//                     onPressed: () {
//                       if (formKey.currentState?.validate() ?? false) {
//                         final registerState =
//                             context.read<RegisterBloc>().state;
//                         final imageName = registerState.imageName;
//                         context.read<RegisterBloc>().add(
//                               RegisterUserEvent(
//                                 context: context,
//                                 fullName: userNameController.text,
//                                 email: emailController.text,
//                                 password: passwordController.text,
//                                 avatar: imageName,
//                               ),
//                             );

//                         // Clear fields after submission
//                         userNameController.clear();
//                         emailController.clear();
//                         passwordController.clear();

//                         // Navigate to login page after successful registration
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const LoginPage()),
//                         );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       foregroundColor: Colors.blue,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 100, vertical: 15),
//                     ),
//                     child: const Text('Register'),
//                   ),
//                   const SizedBox(height: 20),

//                   // Display Error Message (if any)
//                   if (_errorMessage != null)
//                     Text(
//                       _errorMessage!,
//                       style: const TextStyle(
//                         color: Colors.red,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   const SizedBox(height: 20),

//                   // Already have an account Row
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Already have an account? ",
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const LoginPage()),
//                           );
//                         },
//                         child: const Text(
//                           "Login",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   InputDecoration _inputDecoration(String hintText) {
//     return InputDecoration(
//       filled: true,
//       fillColor: Colors.transparent,
//       hintText: hintText,
//       hintStyle: const TextStyle(color: Colors.white),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//     );
//   }
// }

class _RegisterViewState extends State<RegisterView> {
  bool _obscureText = true;
  bool _obscureConfirmPassword = true;
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController(); // New controller
  final formKey = GlobalKey<FormState>();

  String? _errorMessage;
  File? _img;

  // Request camera and storage permission
  Future<void> checkPermissions() async {
    await Permission.camera.request();
    await Permission.storage.request();
  }

  // Open dialog to choose camera or gallery
  void _showImagePickerDialog() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _browseImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _browseImage(ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );
  }

  // Pick image from camera or gallery
  Future<void> _browseImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
          context.read<RegisterBloc>().add(LoadImage(file: _img!));
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1D3557),
                Color(0xFF457B9D),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // **Profile Photo Upload Section**
                  GestureDetector(
                    onTap: _showImagePickerDialog,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      backgroundImage: _img != null ? FileImage(_img!) : null,
                      child: _img == null
                          ? const Icon(Icons.camera_alt,
                              size: 50, color: Colors.grey)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Full Name Field
                  TextFormField(
                    controller: userNameController,
                    decoration: _inputDecoration('Enter Username'),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) =>
                        value!.isEmpty ? 'Username is required' : null,
                  ),
                  const SizedBox(height: 20),

                  // Email Field
                  TextFormField(
                    controller: emailController,
                    decoration: _inputDecoration('Enter Your Email'),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Password Field with Visibility Toggle
                  TextFormField(
                    controller: passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: 'Create Password',
                      hintStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) =>
                        value!.isEmpty ? 'Password is required' : null,
                  ),
                  const SizedBox(height: 20),

                  // Confirm Password Field with Visibility Toggle
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: 'Confirm Password',
                      hintStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please confirm your password';
                      } else if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),

                  // Register Button
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        final registerState =
                            context.read<RegisterBloc>().state;
                        final imageName = registerState.imageName;
                        context.read<RegisterBloc>().add(
                              RegisterUserEvent(
                                context: context,
                                fullName: userNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                avatar: imageName,
                                confirmPassword: confirmPasswordController
                                    .text, // Add confirm password
                              ),
                            );

                        // Clear fields after submission
                        userNameController.clear();
                        emailController.clear();
                        passwordController.clear();
                        confirmPasswordController
                            .clear(); // Clear confirm password

                        // Navigate to login page after successful registration
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 15),
                    ),
                    child: const Text('Register'),
                  ),
                  const SizedBox(height: 20),

                  // Display Error Message (if any)
                  if (_errorMessage != null)
                    Text(
                      _errorMessage!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  const SizedBox(height: 20),

                  // Already have an account Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.transparent,
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.white),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
