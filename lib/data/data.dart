class Discount {
  String campaignsName;
  double discountPercentage;
  double discountStable;
  double everyXCost;
  double discountRate;
  String type;
  List<String> categories;

  Discount(this.campaignsName, this.discountPercentage, this.discountStable,
      this.everyXCost, this.discountRate, this.type, this.categories);
}

class Item {
  String name;
  double price;
  double amount;
  String category;

  Item(this.name, this.price, this.amount, this.category);

  @override
  String toString() {
    return 'Item(name: $name, price: $price, category: $category)';
  }
}

class DataForTest {
  Discount fixedAmount = Discount("fixedAmount", 0, 50, 0, 0, "Coupon", []);
  Discount percentageDiscount =
      Discount("percentageDiscount", 20, 0, 0, 0, "Coupon", []);
  Discount percentageDiscountByItemCategory = Discount(
      "percentageDiscountByItemCategory",
      0,
      50,
      0,
      0,
      "On Top",
      ["Clothing", "Accessories", "Electronics"]);
  Discount discountByPoints = Discount("discountByPoints", 0, 50, 0, 0,
      "On Top", []); //max at 20% of total price
  Discount specialCampaign =
      Discount("specialCampaign", 0, 50, 300, 40, "Seasonal", []);

  Item tShirt = Item("t-shirt", 350, 1, "Clothing");
  Item hat = Item("hat", 250, 1, "Accessories");
  Item hoodie = Item("hoodies", 700, 1, "Else");
  Item watch = Item("watch", 850, 1, "Accessories");
  Item bag = Item("bag", 640, 1, "Clothing");
  Item belt = Item("belt", 230, 1, "Accessories");
}
