import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                       'https://i.imgur.com/um3WgNX.jpeg',
                    ),
                    scale: 1.0,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 210,
                  alignment: const Alignment(0.0, 2.5),
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.imgur.com/3PbkDxF.jpeg',
                    ),
                    radius: 60.0,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              const Text(
                "Muhamad Dimas Aditiya Putra",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Jakarta, Indonesia",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Game Development",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 7),
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Project",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              "26",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Followers",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              "82",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
