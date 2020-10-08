class AppUser{
  final String id;
  final String fullName;
  final String email;
  final String phone;

  AppUser({ this.id, this.fullName, this.email, this.phone });

  // Name constructor for serializing the data from firebase
  AppUser.fromData(Map<String, dynamic> data)
        :id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        phone = data['phone'];

   Map<String, dynamic>  toJson(){
     return {
       "id": id,
       "fullName" : fullName,
       "email" : email,
       "phone" : phone,
     };
   }

}