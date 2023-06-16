import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> dataList = [
    {"Nama": "Pekerjaan Design", "Gaji": "1.000.000","Detil":"Pekerjaan Desain"},
    {"Nama": "Pekerjaan Koding", "Gaji":"2.000.000", "Detil":"Pekerjaan Mengetik"},
  ];
  List<String> warna = [' blue', ' yellow ', 'green'];
  var title = TextEditingController();
  var platform = TextEditingController();
  var lang = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    String pilih_warna = warna.first;
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Freelance'),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            textColor: Color.fromARGB(255, 0, 0, 0),
            leading: CircleAvatar(
              backgroundColor: index % 10 == 0 ? Color.fromARGB(255, 0, 0, 0) : Color.fromARGB(255, 255, 157, 1)
            ),
            title: Text(dataList[index]["Nama"]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(dataList: dataList[index])),
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Detail"),
                    content: Text(" ${dataList[index]["Gaji"]}"),
                    actions: <Widget>[
                      TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              action: SnackBarAction(
                label: 'Tambah',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Detail Pekerjaan"),
                        content: Column(
                          children: [
                            TextFormField(
                              controller: title,
                              decoration: const InputDecoration(
                                hintText: 'Nama Pekerjaan',
                              ),
                            ),
                            TextFormField(
                              controller: platform,
                              decoration: const InputDecoration(
                                hintText: 'Gaji',
                              ),
                            ),
                            TextFormField(
                              controller: lang,
                              decoration: const InputDecoration(
                                hintText: 'Detail Pekerjaan',
                              ),
                            ),

                            Padding(padding: EdgeInsets.all(10.0)),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  dataList.add({
                                    "Nama": title.text,
                                    "Gaji": platform.text,
                                    "Detil": platform.text,
                                  });
                                });
                              },
                              child: new Text('Save'),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text("Close"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              content: const Text('Tambah Pekerjaan Baru'),
              duration: const Duration(milliseconds: 1500),
              width: 300.0, 
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0, 
              ),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        },
        backgroundColor: Color.fromARGB(255, 250, 176, 5),
        child: const Icon(Icons.add),
      ),
    );
  }
}
class DetailScreen extends StatelessWidget {
  final  Map<String, dynamic> dataList;
  DetailScreen({Key ? key, required this.dataList}) :super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children:  <Widget> [
          Text( " ${dataList["Nama"]}", 
          style: TextStyle(color: Color.fromARGB(255, 255, 140, 0) ,fontSize: 22),
          ),
           Text(" ${dataList["Gaji"]}"),
           Text(" ${dataList["Detil"]}"),

           
        ],

        

        ),
      ),
    );
  }
}

