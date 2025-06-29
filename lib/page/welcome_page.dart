import 'package:flutter/material.dart';
import 'package:tugas_listview/page/login_page.dart';
import 'package:tugas_listview/page/register_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        color: theme.scaffoldBackgroundColor,
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * 0.53,
                width: size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/background_image.png.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.55,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Discover your\nDream here",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Explore all the most exciting dreams based on your interest and study major",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium,
                    ),
                    SizedBox(height: size.height * 0.03),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: theme.cardColor.withOpacity(0.9),
                          border: Border.all(color: theme.dividerColor),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.05),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, -1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterPage(),
                                  ),
                                );
                              },
                              child: Container(
                                height: size.height * 0.08,
                                width: size.width / 2.2,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.background,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    "Register",
                                    style: theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
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
                                "Login",
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
