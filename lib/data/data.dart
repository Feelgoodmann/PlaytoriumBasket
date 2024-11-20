class Discount {
  String campaignsName;
  double discountPercentage;
  double discountStable;
  String type;
  List<String> categories;

  Discount(this.campaignsName, this.discountPercentage, this.discountStable, this.type, this.categories);
}
class Item{
  String name;
  double price;
  double amount;
  String category;

  Item(this.name, this.price, this.amount, this.category);
}

class DataForTest {
  Discount fixedAmount = Discount("fixedAmount", 0, 50, "Coupon", []);
  Discount percentageDiscount = Discount("percentageDiscount", 20, 0, "Coupon", []);
  Discount percentageDiscountByItemCategory = Discount("percentageDiscountByItemCategory", 0, 50, "On Top", ["Clothing",
"Accessories", "Electronics"]);
  Discount discountByPoints = Discount("discountByPoints", 0, 50, "On Top", []); //max at 20% of total price
  Discount specialCampaign = Discount("specialCampaign", 0, 50, "Seasonal", []);

  Item tShirt = Item("t-shirt", 350, 1, "Clothing");
  Item hat = Item("hat", 250, 1, "Clothing");
  Item hoodie = Item("hoodies", 700, 1, "Clothing");
  Item watch = Item("watch", 850, 1, "Clothing");
  Item bag = Item("bag", 640, 1, "Clothing");
  Item belt = Item("belt", 230, 1, "Clothing");

}