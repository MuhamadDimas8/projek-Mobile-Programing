import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_listview/page/main_home_page.dart';
import 'package:tugas_listview/page/register_page.dart';
import 'package:tugas_listview/widget/custom_scaffold.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formLoginKey = GlobalKey<FormState>();
  bool rememberPassword = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    if (_formLoginKey.currentState!.validate()) {
      if (!rememberPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please agree to the processing of personal data'),
          ),
        );
        return;
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Success')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainHomePage()),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(flex: 1, child: SizedBox(height: 10)),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formLoginKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome Back",
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Email
                      TextFormField(
                        controller: emailController,
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Please enter email' : null,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          labelText: 'Email',
                          hintText: 'Enter Email',
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Remember & Forget
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberPassword,
                                onChanged: (value) {
                                  setState(() {
                                    rememberPassword = value ?? false;
                                  });
                                },
                                activeColor: theme.colorScheme.primary,
                              ),
                              const Text('Remember Me'),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forget Password',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                          ),
                          child: const Text('Login'),
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

                      // Brand icons
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

                      // To Register
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?'),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => RegisterPage()),
                              );
                            },
                            child: Text(
                              ' Register',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary,
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
