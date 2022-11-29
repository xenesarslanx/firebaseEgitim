class AutoGenerate {
  AutoGenerate({
    required this.username,
    required this.email,
  });
  late final String username;
  late final String email;
  
  AutoGenerate.fromJson(Map<String, dynamic> json){
    username = json['username'];
    email = json['email'];
  }
/*
// bu aşağıdaki yapı jsondaki tüm verileri bir anda çekmeye yarar
    Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username\n'] = username;
    data['email\n'] = email;
    return data;
  }
  */
}
class PostaKod {
  PostaKod({
    required this.postcode,
    required this.country,
    required this.country_abbreviation,
    required this.places,
    
  });
  late final String postcode;
  late final String country;
  late final String country_abbreviation;
  late final List<Places> places;
  
  PostaKod.fromJson(Map<String, dynamic> json){
    postcode = json['post code'];
    country = json['country'];
    country_abbreviation = json['country abbreviation'];
    places = List.from(json['places']).map((e)=>Places.fromJson(e)).toList();
  }

}

class Places {
  Places({
    required this.place_name,
    required this.longitude,
    required this.state,
    required this.state_abbreviation,
    required this.latitude,
  });
  late final String place_name;
  late final String longitude;
  late final String state;
  late final String state_abbreviation;
  late final String latitude;
  
  Places.fromJson(Map<String, dynamic> json){
    place_name = json['place name'];
    longitude = json['longitude'];
    state = json['state'];
    state_abbreviation = json['state abbreviation'];
    latitude = json['latitude'];
  }
}




