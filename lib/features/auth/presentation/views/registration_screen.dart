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

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? _successMessage;
  String? _errorMessage;

  late Box<Map> userBox;

  @override
  void initState() {
    super.initState();
    userBox = Hive.box<Map>('userBox'); // Open the user box for Hive
  }

  Future<void> _registerUser() async {
    final fullName = _fullNameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final password = _passwordController.text.trim();

    // Check if email already exists in Hive
    if (userBox.containsKey(email)) {
      setState(() {
        _errorMessage = 'Email already exists! Please use another email.';
        _successMessage = null;
      });
      return;
    }

    // Save the user data in Hive
    await userBox.put(email, {
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'password': password,
    });

    setState(() {
      _successMessage = 'Registration Successful!';
      _errorMessage = null;
    });

    // Clear fields after successful registration
    _fullNameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _passwordController.clear();
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
              key: _formKey,
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
                    controller: _fullNameController,
                    decoration: _inputDecoration('Enter Your Full Name'),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) =>
                        value!.isEmpty ? 'Full Name is required' : null,
                  ),
                  const SizedBox(height: 20),
                  // Email Field
                  TextFormField(
                    controller: _emailController,
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
                  // Phone Number Field
                  TextFormField(
                    controller: _phoneController,
                    decoration: _inputDecoration('Enter Your Phone Number'),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) =>
                        value!.isEmpty ? 'Phone number is required' : null,
                  ),
                  const SizedBox(height: 20),
                  // Password Field
                  TextFormField(
                    controller: _passwordController,
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
                  // Sign Up Button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _registerUser();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 15),
                    ),
                    child: const Text('Sign Up'),
                  ),
                  const SizedBox(height: 20),
                  // Display Success Message
                  if (_successMessage != null)
                    Text(
                      _successMessage!,
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  // Display Error Message
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
                          Navigator.pushNamed(context, '/login');
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
