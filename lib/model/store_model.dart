


class StoreModel{
  int? id;
  String? title;
  String? description;
  String?  price;
  String? image;

  StoreModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.image
  });

  factory StoreModel.fromjson(Map<String,dynamic>json){
    return StoreModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    price: json['price'].toString(),
    image: json['image']
    );
  }
  Map<String,dynamic> tojson(){
    return{
      'id':id,
      'title':title,
      'description':description,
      'price':price,
      'image':image
    };
  }
}