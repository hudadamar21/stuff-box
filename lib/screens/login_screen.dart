import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 375,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/home-bg.png'),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 90, 30, 30),
              child: Column(
                crossAxisAlignment: screenWidth > 680
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/home-hero.png', width: 280),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Text(
                    'Stuff Box',
                    style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 240, 174, 51)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: screenWidth > 680 ? 400 : 223,
                    child: Text(
                      'Aplikasi untuk mendata barang beserta harganya',
                      textAlign:
                          screenWidth > 680 ? TextAlign.center : TextAlign.left,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 123, 127, 158),
                          height: 2),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: screenWidth > 680
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(36, 240, 174, 51),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 12,
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.fingerprint,
                                size: 30,
                                color: Color.fromARGB(255, 240, 174, 51),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Smart Id',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 240, 174, 51),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 240, 174, 51),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 12,
                          ),
                          child: const Row(
                            children: [
                              Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_right_alt_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Use social login'),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Image.asset('assets/icons/instagram.png'),
                          ),
                          const SizedBox(width: 50),
                          InkWell(
                            child: Image.asset('assets/icons/twitter.png'),
                          ),
                          const SizedBox(width: 50),
                          InkWell(
                            child: Image.asset('assets/icons/facebook.png'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          child: const Text(
                            'Create an account',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
