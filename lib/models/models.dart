class MenuModel {
  int id;
  String name;
  String description;
  bool isVeg;
  num rate;
  int quantity;
  String? imgUrl;

  MenuModel(this.id, this.name, this.description, this.isVeg, this.rate,
      this.quantity, this.imgUrl);
}
