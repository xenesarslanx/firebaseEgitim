import 'package:firebase_egitim/ProfilSayfasi.dart';
import 'package:firebase_egitim/apiModel.dart';
import 'package:firebase_egitim/xd_google_pixel6_pro1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Crash extends StatefulWidget {
  const Crash({ Key? key }) : super(key: key);

  @override
  State<Crash> createState() => _CrashState();
}

class _CrashState extends State<Crash> {//çökme testi için kullanılan fonksiyon firebase crashlytics
  /*void _firebaseCrash() async{
  FirebaseCrashlytics.instance.crash();
if (kDebugMode) {
  await FirebaseCrashlytics.instance
      .setCrashlyticsCollectionEnabled(false);
} else {
  await FirebaseCrashlytics.instance
  .setCrashlyticsCollectionEnabled(true);
}
}
@override
  void initState() {
    _firebaseCrash();
    super.initState();
  }*/

String dropdownValue = "19000";
 String? urlPosta2;

  void dropcallback(String? selectedValue){
    if(selectedValue is String){
 setState(() {
   dropdownValue = selectedValue;
   urlPosta2 = dropdownValue;
 });
    }
  
}

final String url = "https://raw.githubusercontent.com/alimcevik/jsonapi/master/api.json";
final String urlPosta1 = "https://api.zippopotam.us/tr/";

final String tokenValue = "apikey 29Wh9R60dYm48RdICMGzTb:5DLAWLbT4gdxvOPwGpkFMl";
     Future<AutoGenerate> apiCall() async {
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return AutoGenerate.fromJson(json.decode(response.body));
  } else {
    print('Failed to load1');

    throw Exception('Failed to load');
  }
}

     Future<PostaKod> apiCallWeather() async {
  var response = await http.get(Uri.parse(urlPosta1+urlPosta2!));
  if (response.statusCode == 200) {
    return PostaKod.fromJson(json.decode(response.body));
  } else {
    print('Failed to load2');

    throw Exception('Failed to load');
  }
}   

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.redAccent,
      title:   const Center(child: Text('api json Ekranı')) ,
    
      ),
    body: Column(
      children: [
        
        ElevatedButton(onPressed: () =>   Navigator.pushAndRemoveUntil(
      context,
       MaterialPageRoute(
      builder: (_) => const ImagePickerSayfasi(),
      ),
      ((Route<dynamic> route)=>false)), child: const Text('geri dön image picker')),

FutureBuilder<AutoGenerate>(
  future: apiCall(),
  builder: (context, snapshot){
     if (snapshot.hasData) {
            return Center(
                child: Text(
              "Kullanıcı Adı: ${snapshot.data!.username} \n" "E Posta: ${snapshot.data!.email} \n",
            
            ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
  }
  ),


  FutureBuilder<PostaKod>(
  future: apiCallWeather(),
  builder: (context, snapshot){
     if (snapshot.hasData) {
            return Center(
                child: Text(
              "postcode: ${snapshot.data!.postcode} \n"
              "country: ${snapshot.data!.country} \n"
            //  "country_abbreviation: ${snapshot.data!.country_abbreviation} \n\n"
              
        
                   "place_name: ${snapshot.data!.places[0].place_name} \n"
                   "state: ${snapshot.data!.places[0].state} \n"
                    "latitude: ${snapshot.data!.places[0].latitude} \n"
                   "longitude: ${snapshot.data!.places[0].longitude} \n"
                  // "state_abbreviation: ${snapshot.data!.places[0].state_abbreviation} \n"           
            ));
          } else {
            return  const Center(
              child: CircularProgressIndicator());
          }
  }
  ),
  
      DropdownButton(
        items: const [
          DropdownMenuItem(
            child: Text("çorum"), value:"19000"
            ),

              DropdownMenuItem(
            child: Text("kocaeli"), value:"41000"
            ),
              DropdownMenuItem(
            child: Text("mersin"), value:"33000"
            ),
          
          
        ],
        value: dropdownValue,
         onChanged: dropcallback,         
         ),
         Text(dropdownValue.toString()),
     
            
         
        ElevatedButton(onPressed: () =>   Navigator.pushAndRemoveUntil(
      context,
       MaterialPageRoute(
      builder: (_) => const XDGooglePixel6Pro1(),
      ),
      ((Route<dynamic> route)=>false)), child: const Text('adobe')),
       

      ],
    ),  
    );
  }
}