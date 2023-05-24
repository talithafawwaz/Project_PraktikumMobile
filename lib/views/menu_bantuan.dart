import 'package:flutter/material.dart';
import 'package:project_kel6/views/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bantuan extends StatefulWidget {
  const Bantuan({Key? key}) : super(key: key);

  @override
  State<Bantuan> createState() => _BantuanState();
}

class _BantuanState extends State<Bantuan> {
  final List<String> _caraPenggunaan = [
    'Daftarkan akun dengan mengisi username dan password pada halaman sign up',
    'Sign In dengan username dan password yang telah didaftarkan',
    'Ketika login berhasil, user akan masuk ke halaman daftar resep',
    'Jika memilih menu profil, maka akan masuk ke halaman profil anggota kelompok'
        'Jika memilih menu bantuan, maka akan masuk ke halaman bantuan'
        'Jika ingin keluar dari aplikasi, user dapat menekan tombol logout di bagian appbar'
  ];

  List<Widget> _buildInstructions() {
    return _caraPenggunaan
        .map((recommendation) => ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                child: Text('${_caraPenggunaan.indexOf(recommendation) + 1}'),
              ),
              title: Text(recommendation),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xfff0f1f5),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.help),
              SizedBox(width: 10),
              Text('Bantuan')
            ],
          ),
          backgroundColor: Colors.teal,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _validasi();
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tentang'),
              Tab(text: 'Cara Penggunaan'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tentang ShaRecipes',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Card(
                      margin: const EdgeInsets.only(top: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      child: Container(
                        height: 300,
                        width: 500,
                        padding: const EdgeInsets.all(15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Aplikasi ShaRecipes adalah sebuah platform atau aplikasi yang dirancang '
                              'untuk memudahkan pengguna dalam mencari berbagai resep masakan. '
                              'Di dalam aplikasi ini terdapat berbagai detail resep '
                              'seperti deskripsi singkat tentang masakan, bahan masakan, dan langkah membuatnya '
                              '. Secara keseluruhan, aplikasi Sharecipes menghadirkan platform yang interaktif dan menyenangkan bagi para pengguna untuk menemukan resep baru, '
                              'menciptakan ruang untuk kreativitas kuliner, serta memperluas pengetahuan dan pengalaman memasak pengguna.',
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cara penggunaan aplikasi ShaRecipes:',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Column(children: _buildInstructions()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _validasi() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Logout"),
              content: Text("Are you sure want to logout?"),
              actions: [
                TextButton(
                    onPressed: () => _logoutProcess(), child: Text("Yes")),
                TextButton(
                    onPressed: () => Navigator.pop(context), child: Text("No")),
              ],
            ));
  }

  _logoutProcess() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('status', false);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return SigninPage();
    }));
  }
}
