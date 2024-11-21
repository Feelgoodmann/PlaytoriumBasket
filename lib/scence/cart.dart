import 'package:flutter/material.dart';
import 'package:playtorium/scence/menu.dart';

import '../data/data.dart';

class Cart extends StatefulWidget {
  final List<Item>? items;

  const Cart(this.items, {Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // Boolean flags for each coupon type (mutually exclusive groups)
  bool isFixedCouponSelected = false;
  bool isPercentageCouponSelected = false;

  bool isPercentageDiscountByItemCategorySelected = false;
  bool isDiscountByPointsSelected = false;

  bool isSpecialCampaignSelected = false; // Flag for special campaigns

  final dataForTest = DataForTest();
  double totalCost = 0;
  double basedCost = 0;
  double discountByPoints = 0; // Variable to store points discount value

  final TextEditingController pointsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _calculateTotalCost(); // Calculate the initial total cost
  }

  // Function to calculate the total cost based on the items
  void _calculateTotalCost() {
    basedCost = widget.items?.fold(0, (sum, item) => sum! + item.price) ?? 0;
    totalCost =
        basedCost; // Initially set the total cost to the base cost (without coupon)
  }

  // Function to update the total cost based on the selected coupons
  void _updateTotalCost() {
    setState(() {
      totalCost = basedCost; // Start with the base cost

      // Apply fixed coupon
      if (isFixedCouponSelected) {
        totalCost -= dataForTest.fixedAmount.discountStable;
      }

      // Apply percentage coupon
      if (isPercentageCouponSelected) {
        totalCost -= basedCost *
            (dataForTest.percentageDiscount.discountPercentage / 100);
      }

      // Apply percentage discount by item category (on eligible items)
      if (isPercentageDiscountByItemCategorySelected) {
        double categoryDiscount = widget.items!.fold(0, (sum, item) {
          if (dataForTest.percentageDiscountByItemCategory.categories
              .contains(item.category)) {
            return sum +
                (item.price *
                    (dataForTest.percentageDiscountByItemCategory
                            .discountPercentage /
                        100));
          }
          return sum;
        });
        totalCost -= categoryDiscount;
      }

      // Apply discount by points
      if (isDiscountByPointsSelected) {
        totalCost -= discountByPoints;
      }

      // Apply special campaigns discount
      if (isSpecialCampaignSelected) {
        double everyXCost =
            dataForTest.specialCampaign.everyXCost; // X amount threshold
        double discount =
            dataForTest.specialCampaign.discountRate; // Y discount amount

        int applicableDiscounts = (basedCost / everyXCost).floor();
        totalCost -= applicableDiscounts * discount;
      }

      // Ensure total cost is not negative
      if (totalCost < 0) {
        totalCost = 0;
      }
    });
  }

  // Function to handle selection of FixedCoupon
  void _selectFixedCoupon(bool? selected) {
    setState(() {
      isFixedCouponSelected = selected ?? false;
      if (isFixedCouponSelected) {
        isPercentageCouponSelected = false; // Deselect PercentageCoupon
      }
      _updateTotalCost();
    });
  }

  // Function to handle selection of PercentageCoupon
  void _selectPercentageCoupon(bool? selected) {
    setState(() {
      isPercentageCouponSelected = selected ?? false;
      if (isPercentageCouponSelected) {
        isFixedCouponSelected = false; // Deselect FixedCoupon
      }
      _updateTotalCost();
    });
  }

  // Function to handle selection of Percentage Discount by Item Category
  void _selectPercentageDiscountByItemCategory(bool? selected) {
    setState(() {
      isPercentageDiscountByItemCategorySelected = selected ?? false;
      if (isPercentageDiscountByItemCategorySelected) {
        isDiscountByPointsSelected = false; // Deselect DiscountByPoints
      }
      _updateTotalCost();
    });
  }

  // Function to handle selection of Discount By Points
  void _selectDiscountByPoints(bool? selected) {
    setState(() {
      isDiscountByPointsSelected = selected ?? false;
      if (isDiscountByPointsSelected) {
        isPercentageDiscountByItemCategorySelected =
            false; // Deselect PercentageDiscountByItemCategory
      }
      _updateTotalCost();
    });
  }

  // Function to handle input for Discount By Points with cap at 20% of baseCost
  void _setDiscountByPoints(String value) {
    double enteredPoints = double.tryParse(value) ?? 0;
    double maxDiscount = basedCost * 0.20; // 20% of the basedCost

    setState(() {
      // Cap the discount to 20% of basedCost
      discountByPoints =
          enteredPoints > maxDiscount ? maxDiscount : enteredPoints;
      _updateTotalCost(); // Update the total cost after applying the capped discount
    });

    // Update the TextField only if the input exceeds the max cap
    if (enteredPoints > maxDiscount) {
      pointsController.text = maxDiscount.toStringAsFixed(2);
      pointsController.selection =
          TextSelection.collapsed(offset: pointsController.text.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Back button
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Menu(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            // Display cart items
            ...?widget.items
                ?.map(
                  (item) => Row(
                    children: [
                      Text(item.name),
                      Text("\$${item.price}"),
                    ],
                  ),
                )
                .toList(),

            // Group 1: Fixed Coupon or Percentage Coupon (mutually exclusive)
            Row(
              children: [
                const Text("Fixed Coupon"),
                Checkbox(
                  value: isFixedCouponSelected,
                  onChanged: _selectFixedCoupon,
                ),
                const Text("Percentage Coupon"),
                Checkbox(
                  value: isPercentageCouponSelected,
                  onChanged: _selectPercentageCoupon,
                ),
              ],
            ),

            // Group 2: Percentage Discount by Item Category or Discount by Points (mutually exclusive)
            Row(
              children: [
                const Text("Percentage Discount by Item Category"),
                Checkbox(
                  value: isPercentageDiscountByItemCategorySelected,
                  onChanged: _selectPercentageDiscountByItemCategory,
                ),
              ],
            ),
            Row(
              children: [
                const Text("Discount by Points"),
                Checkbox(
                  value: isDiscountByPointsSelected,
                  onChanged: _selectDiscountByPoints,
                ),
              ],
            ),

            // Input field for Discount By Points (only appears if Discount By Points is selected)
            if (isDiscountByPointsSelected)
              TextField(
                controller: pointsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText:
                      "Enter Points to Apply Discount (max 20% of total cost)",
                  hintText: "Max: \$${(basedCost * 0.20).toStringAsFixed(2)}",
                ),
                onChanged: _setDiscountByPoints,
              ),
            // Group 3: Special Campaigns
            Row(
              children: [
                const Text("Special Campaigns"),
                Checkbox(
                  value: isSpecialCampaignSelected,
                  onChanged: (selected) {
                    setState(() {
                      isSpecialCampaignSelected = selected ?? false;
                      _updateTotalCost(); // Recalculate the total cost
                    });
                  },
                ),
              ],
            ),

            // Display total cost
            Center(
              child: Column(
                children: [Text("Total: \$${totalCost.toStringAsFixed(2)}")],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
