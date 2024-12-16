import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sep/controllers/firestore_service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final FirestoreService firestore = FirestoreService();
  final TextEditingController addField = TextEditingController();

  void openModel ({String? docId, String? existingText}) {
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          content: TextField(
            controller: addField,
          ),
          actions: [
            TextButton(
              onPressed: () {

                if (docId == null){
                  // add data to database
                  firestore.store(addField.text);
                } else {
                  // update the existing database
                  firestore.update(docId, addField.text);
                }
                
                // clear the text controller
                addField.clear();

                // Close the Model
                Navigator.of(context).pop();
              }, 
              child: const Text('Add'),
            )
          ]
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Dashboard'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openModel,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List dataList = snapshot.data!.docs;

            return ListView.builder(
              itemCount: dataList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                DocumentSnapshot document = dataList[index];
                String docId = document.id;

                Map<String,dynamic> data = 
                  document.data() as Map<String,dynamic>;
                
                String dataText = data['title'];
                Timestamp timestamp =data['timestamp'];

                return ListTile(
                  title: Text(dataText),
                  subtitle: Text('${timestamp.toDate().day}-${timestamp.toDate().month}-${timestamp.toDate().year}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => openModel(docId: docId, existingText: dataText),
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () => firestore.destroy(docId),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  )
                );
              }
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
  
    );
  }
}