import 'package:flutter/material.dart';

import '../pet-model.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<Pet> petList = [
    Pet(
      petCategory: "Dog",
      petType: "Golden",
      petLoveCount: 20,
      petPic: "https://drive.google.com/file/d/1SVXNgYjWidATdPpPfswlWtS31DnhjB-2/view?usp=share_link",
    ),
    Pet(
      petCategory: "Labrador",
      petType: "Golden",
      petLoveCount: 18,
      petPic:"https://drive.google.com/file/d/152WsHjSIgQUy0gS_WQEo3mWOSMK8v1kM/view?usp=share_link",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(223, 224, 223, 1),
        title: const Text(
          'Pet Market',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: petList.length,
        itemBuilder: (context, index) {
          final pet = petList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 125,
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(
                    pet.petPic ?? '',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    },
                  ),
                  title: Text(
                    pet.petType ?? 'Unknown',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(pet.petCategory ?? 'Unknown'),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/pawprint.png',
                            height: 28,
                            width: 26,
                          ),
                          const SizedBox(width: 10),
                          Text('Pet Love: ${pet.petLoveCount}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
