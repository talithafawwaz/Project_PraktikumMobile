import 'package:flutter/material.dart';
import 'package:project_kel6/views/signin.dart';

class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_circle),
              SizedBox(width: 10),
              Text('Data Anggota')
            ],
          ),
          backgroundColor: Colors.teal,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return SigninPage();
                }));
              },
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
          padding: const EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 10,
                  child: Container(
                    height: 230,
                    width: 350,
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: 130,
                            child: Image.asset(
                              'assets/nindy.jpeg',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.person,
                                  size: 90,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Nindya Putri Maharani',
                              style: TextStyle(fontSize: 16),
                              maxLines: 1,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              '123200019',
                              style: TextStyle(fontSize: 16),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  child: Container(
                    height: 230,
                    width: 350,
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: 130,
                            child: Image.asset(
                              'assets/talitha.jpg',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.person,
                                  size: 90,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Talitha Fawwaz',
                              style: TextStyle(fontSize: 16),
                              maxLines: 1,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              '123200013',
                              style: TextStyle(fontSize: 16),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
