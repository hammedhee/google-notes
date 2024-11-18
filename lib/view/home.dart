import 'package:flutter/material.dart';
import 'package:google_notes/function/functions.dart';
import 'package:google_notes/model/notemode.dart';
import 'package:google_notes/view/addpage.dart';
import 'package:google_notes/view/edit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    getAllData();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 216, 162, 0),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return Addpage();
          }));
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 45,
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.menu),
                  suffix: CircleAvatar(
                    radius: 13,
                  ),
                  suffixIcon: Icon(Icons.view_cozy),
                  hintText: 'Search Your Notes',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            ValueListenableBuilder(
              valueListenable: noteNotifire,
              builder: (context, List<Note> noteList, child) {
                return Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final data = noteList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) {
                              return Edit(
                                index: index,
                                title: data.title!,
                                subNote: data.subNote!,
                              );
                            }));
                          },
                          child: ListTile(
                            title: Text(data.title!),
                            subtitle: Text(data.subNote!),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      deleteData(index);
                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 2,
                        );
                      },
                      itemCount: noteList.length),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
