class Addproduct{
  String? Uid;
  String? Category;
  String? Product;
  String? Proce;
  String? Quantity;
  String? image;

  // Receiving data from server
  Addproduct({this.Uid,this.Category, this.Product ,this.Proce ,this.Quantity, this.image});
  factory Addproduct.formMap(map){
    return Addproduct(
        Uid: map['Uid'],
        Category: map['Beauty'],
        Product: map['Lipstick'],
        Proce: map['200'],
        Quantity: map['200'],
        image: map['#']
    );
  }

  //sending data to server
  Map<String, dynamic> toMap(){
    return{
      'Uid':Uid,
      'Category':Category,
      'Product':Product,
      'Proce':Proce,
      'Quantity':Quantity,
      'image':image
    };
  }
}