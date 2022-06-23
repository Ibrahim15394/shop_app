class HomeModel
{
  bool? status;
   HomeDataModel? data;
  HomeModel.fromJson(Map<String, dynamic>json)
  {
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}
class HomeDataModel
{
   List<BannerModel> banners = [];
   List<ProductModel> products = [];
   String? ad;

  HomeDataModel.fromJson(Map<String, dynamic>json)
  {

   json['banners'].forEach((element)
       {
         banners.add(BannerModel.fromJson(element));
       });
   json['products'].forEach((element)
   {
     products.add(ProductModel.fromJson(element));
   });
   ad = json['ad'];
  }
}
class BannerModel
{
   int? id;
   String? image;
   dynamic category;
   dynamic product;
  BannerModel.fromJson(Map<String, dynamic>json)
  {
    id = json['id'];
    image = json['image'];
    product = json['product'];
    category = json['category'];
  }
}
class ProductModel
{
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  bool? inFavorites;
  bool? inCart;


  ProductModel.fromJson(Map<String, dynamic>json)
  {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

}