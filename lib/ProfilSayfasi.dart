
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_egitim/GirisEkrani.dart';
import 'package:firebase_egitim/crash.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'firebase.dart';

class Profil extends StatefulWidget {
  const Profil({ Key? key }) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text("Profil Sayfası"),
        actions:<Widget>[
      IconButton(
        icon: const Icon(Icons.exit_to_app),
        onPressed: (){
          FirebaseAuth.instance.signOut().then((value){//çıkış yap
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) =>const MyApp()),
              (Route<dynamic> route) => false);
          });
        }, 
      ),
        ],
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
              SizedBox(width: 100, height: 100,
             child:  VtBilgi('yazilar', 'uyari'),),
               SizedBox(width: 100, height: 100,
               child: VtBilgi('yazilar2', 'uyari2'),
               ),
              
               SizedBox(width: 150, height: 50, 
               child: ElevatedButton(
      onPressed:() =>   Navigator.pushAndRemoveUntil(
  context,
   MaterialPageRoute(
    builder: (_) => const ImagePickerSayfasi(),
    ),
    ((Route<dynamic> route)=>false)), child: const Text('İmagePicker sayfasına git'),),),
      


         ],
        ),
      ),      
      );
       }
}

class ImagePickerSayfasi extends StatefulWidget {
  const ImagePickerSayfasi({ Key? key }) : super(key: key);

  @override
  State<ImagePickerSayfasi> createState() => _ImagePickerSayfasi();
}

class _ImagePickerSayfasi extends State<ImagePickerSayfasi> {
  CollectionReference imageAndEmail = FirebaseFirestore.instance.collection('resimler');

  FirebaseAuth auth = FirebaseAuth.instance;
  File? image;
  String? indirmebaglantisi;

   Future kameradanYukle(ImageSource selectType) async{
    
    final image = await ImagePicker()
    .pickImage(source: selectType);//kameradan resmin bilgilerini al ata
    
    if(image==null) return;

    final imageTemp = File(image.path);
print("11111111111111111111111111$imageTemp");

String uniquefilename = DateTime.now().millisecondsSinceEpoch.toString();
 setState(() =>
   this.image = imageTemp
 );
   
Reference referenceRoot = FirebaseStorage.instance.ref();
Reference referenceDirImages = referenceRoot.child('images');

Reference referenceImageToUpload = 
referenceDirImages.child(uniquefilename);

await referenceImageToUpload.putFile(File(imageTemp.path));
indirmebaglantisi = await referenceImageToUpload.getDownloadURL();
print("resimin urlsi burada: $indirmebaglantisi");

//image picker ile resim paylaşan kişinin
 Map<String, dynamic> datalar = {
    'kullanici':auth.currentUser!.email.toString(), //emailini
    'resimlink': indirmebaglantisi,//ve paylaştığı resimin url'sini datalar map'ine atadım
  };
  await imageAndEmail.doc('resimler').set(datalar); //firebasede resimler dokumentinin içine yazdırdım
   
 
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    home: Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.redAccent,
      title:   const Center(child: Text('image picker sayfası')) ,
      ),
      body: Column(
        children: [
          Divider(color: Colors.teal.shade100,
              thickness: 10.0,),
              SizedBox(width: 100, height: 40, 
                 child: ElevatedButton(
        onPressed:() => kameradanYukle(ImageSource.gallery),child:  const Text("Galeriden seç"),),),
                 Divider(color: Colors.teal.shade100,
              thickness: 10.0,),
                  SizedBox(width: 100, height: 40, 
                 child: ElevatedButton(
        onPressed:() => kameradanYukle(ImageSource.camera),child:  const Text("Kameradan seç"),),),
        Divider(color: Colors.teal.shade100,
              thickness: 10.0,),
                     const SizedBox(height: 20,),
                   image != null ? Image.file(image!, width: 500, height: 300,):
                   const Text('no data'),
                   ElevatedButton(onPressed: () =>   Navigator.pushAndRemoveUntil(
      context,
       MaterialPageRoute(
      builder: (_) => const Profil(),
      ),
      ((Route<dynamic> route)=>false)), child: const Text('Profil sayfasına geri dön')),

      ElevatedButton(onPressed: () =>   Navigator.pushAndRemoveUntil(
      context,
       MaterialPageRoute(
      builder: (_) => const Crash(),
      ),
      ((Route<dynamic> route)=>false)), child: const Text('api json sayfasına git')),
        ],
        
      ),
    ),
    );
  }
}
  
    
 