class Discount {
  String campaignsName;
  String displayName;
  double discountPercentage;
  double discountStable;
  double everyXCost;
  double discountRate;
  String type;
  List<String> categories;

  Discount(
      this.campaignsName,
      this.displayName,
      this.discountPercentage,
      this.discountStable,
      this.everyXCost,
      this.discountRate,
      this.type,
      this.categories);
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
  Discount fixedAmount =
      Discount("fixedAmount", "Fixed Coupon", 0, 50, 0, 0, "Coupon", []);
  Discount percentageDiscount = Discount(
      "percentageDiscount", "Percentage Coupon", 20, 0, 0, 0, "Coupon", []);
  Discount percentageDiscountByItemCategory = Discount(
      "percentageDiscountByItemCategory",
      "Percentage Discount by Item Category",
      0,
      50,
      0,
      0,
      "On Top",
      ["Clothing", "Accessories", "Electronics"]);
  Discount discountByPoints = Discount("discountByPoints", "Discount by Points",
      0, 50, 0, 0, "On Top", []); //max at 20% of total price
  Discount specialCampaign = Discount(
      "specialCampaign", "Special Campaigns", 0, 50, 300, 40, "Seasonal", []);

  Item tShirt = Item("T-shirt", 350, 1, "Clothing");
  Item hat = Item("Hat", 250, 1, "Accessories");
  Item hoodie = Item("Hoodies", 700, 1, "Else");
  Item watch = Item("Watch", 850, 1, "Accessories");
  Item bag = Item("Bag", 640, 1, "Clothing");
  Item belt = Item("Belt", 230, 1, "Accessories");
}
