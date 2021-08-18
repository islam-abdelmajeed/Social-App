class UserModel{
  String name;
  String email;
  String password;
  String phone;
  String uId;
  String image;
  String cover;
  String bio;
  bool isEmailVerified;

  UserModel({
    this.name,
    this.email,
    this.password,
    this.phone,
    this.uId,
    this.image,
    this.cover,
    this.bio,
    this.isEmailVerified,
});

  UserModel.formJson(Map<String,dynamic> json){
    name =json['name'];
    email =json['email'];
    password =json['password'];
    phone =json['phone'];
    uId =json['uId'];
    image =json['image'];
    bio =json['bio'];
    cover =json['cover'];
    isEmailVerified =json['isEmailVerified'];
  }

  Map<String,dynamic> toMap(){
    return {
      'name': name,
      'email': email,
      'password':password,
      'phone':phone,
      'uId':uId,
      'cover':cover,
      'image':image,
      'bio':bio,
      'isEmailVerified':isEmailVerified,
    };
  }

}