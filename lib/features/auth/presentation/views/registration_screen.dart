// import 'package:flutter/material.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   bool _obscureText = true;
//   final TextEditingController _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();

//   String? _successMessage;

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
//               key: _formKey, // Wrap the content with a Form widget
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 130,
//                     child: Image.asset(
//                       'assets/images/logo.png',
//                       fit: BoxFit.contain,
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
//                     controller: _fullNameController,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.transparent,
//                       hintText: 'Enter Your Full Name',
//                       hintStyle: const TextStyle(color: Colors.white),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       errorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(color: Colors.red),
//                       ),
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(color: Colors.red),
//                       ),
//                     ),
//                     style: const TextStyle(color: Colors.white),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Full Name is required';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   // Email Field
//                   TextFormField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.transparent,
//                       hintText: 'Enter Your Email',
//                       hintStyle: const TextStyle(color: Colors.white),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       errorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(color: Colors.red),
//                       ),
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(color: Colors.red),
//                       ),
//                     ),
//                     style: const TextStyle(color: Colors.white),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
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
//                   // Phone Number Field
//                   TextFormField(
//                     controller: _phoneController,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.transparent,
//                       hintText: 'Enter Your Phone Number',
//                       hintStyle: const TextStyle(color: Colors.white),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       errorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(color: Colors.red),
//                       ),
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(color: Colors.red),
//                       ),
//                     ),
//                     style: const TextStyle(color: Colors.white),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Phone number is required';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   // Password Field
//                   TextFormField(
//                     controller: _passwordController,
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
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Password is required';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 30),
//                   // Sign Up Button
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState?.validate() ?? false) {
//                         setState(() {
//                           _successMessage = "Registration Successful!";
//                         });
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       foregroundColor: Colors.blue,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 100, vertical: 15),
//                     ),
//                     child: const Text('Sign Up'),
//                   ),
//                   const SizedBox(height: 20),
//                   // Display Success Message
//                   if (_successMessage != null)
//                     Text(
//                       _successMessage!,
//                       style: const TextStyle(
//                         color: Colors.green,
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
//                           Navigator.pushNamed(context, '/login');
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
// }

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   bool _obscureText = true;
//   final TextEditingController _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();

//   String? _successMessage;
//   String? _errorMessage;

//   late Box<Map> userBox;

//   @override
//   void initState() {
//     super.initState();
//     userBox = Hive.box<Map>('userBox'); // Open the user box for Hive
//   }

//   Future<void> _registerUser() async {
//     final fullName = _fullNameController.text.trim();
//     final email = _emailController.text.trim();
//     final phone = _phoneController.text.trim();
//     final password = _passwordController.text.trim();

//     // Check if email already exists in Hive
//     if (userBox.containsKey(email)) {
//       setState(() {
//         _errorMessage = 'Email already exists! Please use another email.';
//         _successMessage = null;
//       });
//       return;
//     }

//     // Save the user data in Hive
//     await userBox.put(email, {
//       'fullName': fullName,
//       'email': email,
//       'phone': phone,
//       'password': password,
//     });

//     setState(() {
//       _successMessage = 'Registration Successful!';
//       _errorMessage = null;
//     });

//     // Clear fields after successful registration
//     _fullNameController.clear();
//     _emailController.clear();
//     _phoneController.clear();
//     _passwordController.clear();
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
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 130,
//                     child: Image.asset(
//                       'assets/images/logo.png',
//                       fit: BoxFit.contain,
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
//                     controller: _fullNameController,
//                     decoration: _inputDecoration('Enter Your Full Name'),
//                     style: const TextStyle(color: Colors.white),
//                     validator: (value) =>
//                         value!.isEmpty ? 'Full Name is required' : null,
//                   ),
//                   const SizedBox(height: 20),
//                   // Email Field
//                   TextFormField(
//                     controller: _emailController,
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
//                   // Phone Number Field
//                   TextFormField(
//                     controller: _phoneController,
//                     decoration: _inputDecoration('Enter Your Phone Number'),
//                     style: const TextStyle(color: Colors.white),
//                     validator: (value) =>
//                         value!.isEmpty ? 'Phone number is required' : null,
//                   ),
//                   const SizedBox(height: 20),
//                   // Password Field
//                   TextFormField(
//                     controller: _passwordController,
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
//                   // Sign Up Button
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState?.validate() ?? false) {
//                         _registerUser();
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       foregroundColor: Colors.blue,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 100, vertical: 15),
//                     ),
//                     child: const Text('Sign Up'),
//                   ),
//                   const SizedBox(height: 20),
//                   // Display Success Message
//                   if (_successMessage != null)
//                     Text(
//                       _successMessage!,
//                       style: const TextStyle(
//                         color: Colors.green,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   // Display Error Message
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
//                           Navigator.pushNamed(context, '/login');
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
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: Colors.red),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: Colors.red),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smart_movie/features/auth/presentation/view_model/registration/register_bloc.dart';
// import 'package:smart_movie/features/auth/presentation/views/login_screen.dart'; // Make sure to import your BLoC

// class RegisterView extends StatelessWidget {
//   const RegisterView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final userNameController = TextEditingController();
//     final emailController = TextEditingController();
//     final passwordController = TextEditingController();
//     final formKey = GlobalKey<FormState>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Register',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.pink,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
//           child: Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Create Your Account',
//                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.pink,
//                       ),
//                 ),
//                 const SizedBox(height: 20),
//                 // Full Name Field
//                 TextFormField(
//                   controller: userNameController,
//                   decoration: InputDecoration(
//                     labelText: 'User Name',
//                     prefixIcon: const Icon(Icons.person, color: Colors.pink),
//                     labelStyle: const TextStyle(fontSize: 16),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(color: Colors.pink),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 18),
//                   ),
//                   validator: (value) => value?.isEmpty ?? true
//                       ? 'Please enter a user name'
//                       : null,
//                 ),
//                 const SizedBox(height: 16),
//                 // Email Field
//                 TextFormField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     prefixIcon: const Icon(Icons.email, color: Colors.pink),
//                     labelStyle: const TextStyle(fontSize: 16),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(color: Colors.pink),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 18),
//                   ),
//                   validator: (value) {
//                     if (value?.isEmpty ?? true) {
//                       return 'Please enter an email';
//                     }
//                     final emailRegex = RegExp(
//                         r'^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+'); // Basic email validation
//                     return emailRegex.hasMatch(value!)
//                         ? null
//                         : 'Enter a valid email';
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 // Password Field
//                 TextFormField(
//                   controller: passwordController,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     prefixIcon: const Icon(Icons.lock, color: Colors.pink),
//                     labelStyle: const TextStyle(fontSize: 16),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(
//                         color: Colors.pink,
//                       ),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 18),
//                   ),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value?.isEmpty ?? true) {
//                       return 'Please enter a password';
//                     }
//                     if (value!.length < 6) {
//                       return 'Password must be at least 6 characters';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 24),
//                 // Register Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (formKey.currentState?.validate() ?? false) {
//                         context.read<RegisterBloc>().add(
//                               RegisterUser(
//                                 context: context,
//                                 userName: userNameController.text,
//                                 email: emailController.text,
//                                 password: passwordController.text,
//                               ),
//                             );
//                         // After successful registration, navigate to login screen
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => LoginPage(),
//                           ),
//                         );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.pink,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Text(
//                       'Register',
//                       style: TextStyle(fontSize: 18, color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 // Already have an account? Link
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Already have an account? ',
//                       style: TextStyle(fontSize: 14),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (context) => LoginPage()),
//                         );
//                       },
//                       child: const Text(
//                         'Login',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.pink,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_movie/features/auth/presentation/view_model/registration/register_bloc.dart';
import 'package:smart_movie/features/auth/presentation/views/login_screen.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _obscureText = true;
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? _errorMessage;

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
                  SizedBox(
                    height: 130,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
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
                  const SizedBox(height: 30),
                  // Register Button
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        context.read<RegisterBloc>().add(
                              RegisterUser(
                                context: context,
                                userName: userNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );

                        // Clear fields after submission
                        userNameController.clear();
                        emailController.clear();
                        passwordController.clear();

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
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
    );
  }
}
