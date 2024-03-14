// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 14, bottom: 14, left: 21, right: 21),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.menu,
                            color: Colors.grey[600],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 107,
                                height: 33,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 74,
                                      top: 0,
                                      child: SizedBox(
                                        width: 33,
                                        height: 33,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Opacity(
                                                opacity: 0.40,
                                                child: Container(
                                                    width: 33,
                                                    height: 33,
                                                    decoration:
                                                        const ShapeDecoration(
                                                      color: Color(0xFFF2F4F8),
                                                      shape: OvalBorder(),
                                                    ),
                                                    child: const Icon(
                                                      Icons
                                                          .notifications_outlined,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 37,
                                      top: 0,
                                      child: SizedBox(
                                        width: 33,
                                        height: 33,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Opacity(
                                                opacity: 0.40,
                                                child: Container(
                                                    width: 33,
                                                    height: 33,
                                                    decoration:
                                                        const ShapeDecoration(
                                                      color: Color(0xFFF2F4F8),
                                                      shape: OvalBorder(),
                                                    ),
                                                    child: const Icon(
                                                      Icons
                                                          .chat_bubble_outline_rounded,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: SizedBox(
                                        width: 33,
                                        height: 33,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Opacity(
                                                opacity: 0.40,
                                                child: Container(
                                                    width: 33,
                                                    height: 33,
                                                    decoration:
                                                        const ShapeDecoration(
                                                      color: Color(0xFFF2F4F8),
                                                      shape: OvalBorder(),
                                                    ),
                                                    child: const Icon(
                                                      Icons.search,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 1, // Width of the vertical line
                                height: 33, // Height of the vertical line
                                color: const Color(0x26162D4C),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 37.83,
                                height: 37.83,
                                decoration: const ShapeDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://picsum.photos/id/237/200/300"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                const Text("Hello world"),
                const Text("Hello world"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
