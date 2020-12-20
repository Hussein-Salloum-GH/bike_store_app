class Product {
  // fileds
  int id;
  String title;
  int price;
  String image;
  String gear;
  String size;
  String description;
  int idCategory;
  int idStore;
  int idVendor;
  String country;
  int featured;
  String model;
  int modelId;
  String wheelSize;
  String frameMaterial;
  String ridingStyle;
  String frameSize;
  String type;
  String brakeType;
  String usedFor;
  int brandId;
  int flavorId;
  int nutritionBrandId;
  int nutritionModelId;
  String createdAt;
  String updatedAt;
  String discipline;
  int idAdmin;
  int rate;

//constructor
  Product(
      {this.id,
      this.title,
      this.price,
      this.image,
      this.gear,
      this.size,
      this.description,
      this.idCategory,
      this.idStore,
      this.idVendor,
      this.country,
      this.featured,
      this.model,
      this.modelId,
      this.wheelSize,
      this.frameMaterial,
      this.ridingStyle,
      this.frameSize,
      this.type,
      this.brakeType,
      this.usedFor,
      this.brandId,
      this.flavorId,
      this.nutritionBrandId,
      this.nutritionModelId,
      this.createdAt,
      this.updatedAt,
      this.discipline,
      this.idAdmin,
      this.rate});

  // products from map
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        image: json['image'],
        gear: json['gear'],
        size: json['size'],
        description: json['description'],
        idCategory: json['id_category'],
        idStore: json['id_store'],
        idVendor: json['id_vendor'],
        country: json['country'],
        featured: json['featured'],
        model: json['model'],
        modelId: json['model_id'],
        wheelSize: json['wheel_size'],
        frameMaterial: json['frame_material'],
        ridingStyle: json['riding_style'],
        frameSize: json['frame_size'],
        type: json['type'],
        brakeType: json['brake_type'],
        usedFor: json['used_for'],
        brandId: json['brand_id'],
        flavorId: json['flavor_id'],
        nutritionBrandId: json['nutrition_brand_id'],
        nutritionModelId: json['nutrition_model_id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        discipline: json['discipline'],
        idAdmin: json['id_admin'],
        rate: json['rate']);
  }
}
