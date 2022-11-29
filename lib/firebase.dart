import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class VtBilgi extends StatefulWidget {//firestoredan veri çeker
late String koleksiyonadi;
late String dokumentadi;

   VtBilgi(
     this.koleksiyonadi,
     this.dokumentadi,
    { Key? key , }) : super(key: key);

  @override
  State<VtBilgi> createState() => _VtBilgiState();
}

class _VtBilgiState extends State<VtBilgi> {
  @override
  Widget build(BuildContext context) {
      CollectionReference collectionReference = 
      FirebaseFirestore.instance.collection(widget.koleksiyonadi);//koleksiyonadi

    return StreamBuilder <QuerySnapshot>(
           stream: collectionReference.snapshots(),
           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
             if(snapshot.hasError){
               return Text('error: ${snapshot.error.toString()}');
             }
             if(snapshot.connectionState == ConnectionState.waiting){
               return const Text('loading...');
             }  
            return ListView(
               children: snapshot.data!.docs.map((DocumentSnapshot document) => ListTile(
                 title:Text(document[widget.dokumentadi]),//dokumentadi
               ),
               ).toList(),
             );
             },
           );
  }
}

