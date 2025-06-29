import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tugas_listview/page/login_page.dart';
import 'package:tugas_listview/widget/custom_scaffold.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formRegisterKey = GlobalKey<FormState>();
  bool agreePersonalData = true;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(flex: 1, child: SizedBox(height: 10)),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 20),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formRegisterKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Full Name
                      TextFormField(
                        controller: nameController,
                        validator: (value) =>
                            (value == null || value.isEmpty)
                                ? 'Please enter full name'
                                : null,
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          hintText: 'Enter Full Name',
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Email
                      TextFormField(
                        controller: emailController,
                        validator: (value) =>
                            (value == null || value.isEmpty)
                                ? 'Please enter email'
                                : null,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter Email',
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Password
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) =>
                            (value == null || value.isEmpty)
                                ? 'Please enter password'
                                : null,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Checkbox Agreement
                      Row(
                        children: [
                          Checkbox(
                            value: agreePersonalData,
                            onChanged: (value) {
                              setState(() {
                                agreePersonalData = value ?? false;
                              });
                            },
                            activeColor: colorScheme.primary,
                          ),
                          Text(
                            'I agree to the processing of ',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.hintColor,
                            ),
                          ),
                          Text(
                            'Personal Data',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),

                      // Register Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formRegisterKey.currentState!.validate() &&
                                agreePersonalData) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Register Success')),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            } else if (!agreePersonalData) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Please agree to the processing of personal data'),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.primary,
                          ),
                          child: const Text('Register'),
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Divider with text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: theme.dividerColor,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Register with',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: theme.dividerColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),

                      // Brand Icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Brand(Brands.google),
                          Brand(Brands.facebook),
                          Brand(Brands.github),
                          Brand(Brands.twitter),
                        ],
                      ),
                      const SizedBox(height: 25),

                      // Login prompt
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.hintColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              ' Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
