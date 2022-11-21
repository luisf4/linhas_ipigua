// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linhas_ipigua/views/android/widget/editAlarm.widget.dart';

class Alarmes extends StatefulWidget {
  const Alarmes({super.key});

  @override
  State<Alarmes> createState() => _AlarmesState();
}

class _AlarmesState extends State<Alarmes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alarms",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Flexible(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('alarms')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return SizedBox(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }

                    var documents = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: documents.length,
                      itemBuilder: (_, index) {
                        var document = documents[index];
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(
                                    document['title'],
                                  ),
                                ),
                                subtitle: Text(
                                  document['body'],
                                ),
                                leading: Icon(Icons.alarm),
                                trailing: InkWell(
                                  child: Icon(Icons.edit),
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => EditAlarm(
                                        idDocumento: document['id'],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
