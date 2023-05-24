import 'package:flutter/material.dart';
import 'package:project_kel6/model/resep.dart';
import 'package:project_kel6/model/resep_api.dart';
import 'package:project_kel6/views/detail_resep.dart';
import 'package:project_kel6/widget/resep_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signin.dart';

class MenuResep extends StatefulWidget {
  const MenuResep({Key? key}) : super(key: key);

  @override
  State<MenuResep> createState() => _MenuResepState();
}

class _MenuResepState extends State<MenuResep> {
  late List<Resep> _resep;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getResep();
  }

  Future<void> getResep() async {
    _resep = await ResepApi.getResep();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('ShaRecipes')
            ],
          ),
          backgroundColor: Colors.teal,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _validasi();
              },
            )
          ],
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: _resep.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: ResepCard(
                title: _resep[index].name,
                cookTime: _resep[index].totalTime,
                thumbnailUrl: _resep[index].images,
                videoUrl: _resep[index].videoUrl,
              ),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailResep(
                        name: _resep[index].name,
                        totalTime: _resep[index].totalTime,
                        images: _resep[index].images,
                        description: _resep[index].description,
                        videoUrl: _resep[index].videoUrl,
                        instructions: _resep[index].instructions,
                        sections: _resep[index].sections,
                      ),
                    ))
              },
            );
          },
        ));
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
