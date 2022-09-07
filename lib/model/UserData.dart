class UserModel{
  String? Uid;
  String? Fullname;
  String? Email;
  String? Phone;
  String? Password;
  String? Wrole;

  // Receiving data from server
  UserModel({this.Uid,this.Email, this.Fullname ,this.Phone, this.Password, this.Wrole});
  factory UserModel.formMap(map){
    return UserModel(
        Uid: map['Uid'],
        Fullname: map['Fullname'],
        Email: map['Email'],
        Phone: map['phone'],
        Password: map['Password'],
        Wrole: map['Wrole']
    );
  }

  //sending data to server
  Map<String, dynamic> toMap(){
    return{
      'Uid':Uid,
      'Fullname':Fullname,
      'Email':Email,
      'Phone':Phone,
      'Password':Password,
      'Wrole':Wrole
    };
  }
}