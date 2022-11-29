import 'package:firebase_egitim/ProfilSayfasi.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyApp extends StatefulWidget {
    const MyApp({Key? key}) : super(key: key);

  @override
  
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
String girisUyari  = "";
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

 Future<void>kayitOl()async{  //kayıt ol
   await FirebaseAuth.instance
  .createUserWithEmailAndPassword(email: t1.text, password: t2.text) //kullanıcı kayıtı
  //sonra
  .then((kullanicilar) {
    FirebaseFirestore.instance
    .collection("Kullanicilar")
    .doc(t1.text)//kullanıcının maili ile belge oluşturdu
    .set({"kullaniciEposta": t1.text, "kullaniciSifre": t2.text})//olusturulan belgeye eposta ve şifreleri yazdı
  .whenComplete(() => girisUyari = ("Kayıt oldunuz şimdi giriş yapınız."));
  });
 }

  girisYap(){
  FirebaseAuth.instance
  .signInWithEmailAndPassword(email: t1.text, password: t2.text)
  .then((kullanicilar) {
   Navigator.pushAndRemoveUntil(
  context,
   MaterialPageRoute(
    builder: (_) =>    const Profil(),
    ),
    ((Route<dynamic> route)=>false));
    }
    );
}

hatirla()async{
  FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}

  @override
 
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.redAccent,
      title:   const Center(child: Text('Giriş Ekranı')) ,
      ),
      body:SizedBox(
        width: 400, height: 1000,
    
       child: Column(
        children: [
            
           TextFormField(
            controller: t1,
        decoration: const InputDecoration(
          icon: Icon(Icons.email),
            border:OutlineInputBorder(),
            hintText: 'Email ',
        ),
      ),
       TextFormField(
            controller: t2,
        decoration: const InputDecoration(
          icon: Icon(Icons.password_sharp),
            border:OutlineInputBorder(),
            hintText: 'şifre ',

        ),
      ),
         ElevatedButton(onPressed: kayitOl, child:  const Text("Kayıt ol")),
        ElevatedButton(onPressed: girisYap, child:  const Text("Giriş yap")),
     

     Text(girisUyari),


        ]
       ),  
      ),
      ),
    );

  }
}
  


 