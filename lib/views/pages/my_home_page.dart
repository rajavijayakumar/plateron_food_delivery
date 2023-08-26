import 'package:flutter/material.dart';
import 'package:my_flutter_project/models/models.dart';
import 'package:my_flutter_project/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import '../cells/menu_item_cell.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Widget get _title => const Text('Salads & Soups',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22));

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<Cart>(context);
    List<MenuModel> menuModels = viewModel.getAllMenuModels();

    var menuListView = ListView.builder(
        itemCount: menuModels.length,
        itemBuilder: ((context, index) {
          return MenuItemCell(menuModels[index], (quantity) {
            var menuModel = menuModels[index];
            menuModel.quantity = quantity;
            if (quantity == 0) {
              viewModel.removeFromCart(menuModel);
              return;
            }
            viewModel.addToCart(menuModel);
          });
        }));

    var placeOrderButton = ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 10, 179, 80)),
        child: const Text(
          'Place Order',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
        ),
        onPressed: () => {Navigator.pushNamed(context, '/cart')});

    var noOfItemsLabel = Text(
      "${viewModel.cartCount} Items",
      style: const TextStyle(color: Colors.black),
    );

    var iconsAndItemsRow = Row(
      children: [
        const Icon(
          Icons.add_shopping_cart,
          size: 16,
          color: Colors.black54,
        ),
        const SizedBox(
          width: 4,
        ),
        noOfItemsLabel
      ],
    );

    var bottomAnimatedContainer = AnimatedSize(
      duration: const Duration(milliseconds: 230),
      child: Visibility(
          visible: !viewModel.isCartEmpty(),
          child: Container(
            decoration: const BoxDecoration(
              border:
                  Border(top: BorderSide(color: Color(0xFFD0D5DD), width: 0.5)),
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(12, 8, 24, 4),
              height: 50,
              child: Row(children: [
                iconsAndItemsRow,
                const Spacer(),
                placeOrderButton
              ]),
            ),
          )),
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffffffff),
          centerTitle: false,
          title: _title,
        ),
        body: SafeArea(
          top: false,
          child: Column(
            children: [Expanded(child: menuListView), bottomAnimatedContainer],
          ),
        ));
  }
}
