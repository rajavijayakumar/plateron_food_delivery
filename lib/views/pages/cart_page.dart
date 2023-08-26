import 'package:flutter/material.dart';
import 'package:my_flutter_project/views/cells/cart_cell.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  Widget get _title => const Text('Review Cart',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22));

  Widget _totalValueLabel(double cartValue) => Text(
        '\$$cartValue',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      );

  Widget get _totalLabel => const Text(
        "Total",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      );

  Widget _totalAndValueRow(double cartValue) =>
      Row(children: [_totalLabel, const Spacer(), _totalValueLabel(cartValue)]);

  Widget _bottomDisplayWidget(double cartValue) => Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFFD0D5DD), width: 0.5)),
        ),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(12, 8, 24, 4),
          height: 50,
          child: _totalAndValueRow(cartValue),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<Cart>(context);

    List<MenuModel> cartModels = viewModel.getCart();

    cartModels.sort((a, b) => a.name.compareTo(b.name));

    var cartListView = ListView.builder(
        itemCount: cartModels.length,
        itemBuilder: ((context, index) {
          return CartCell(cartModels[index], (quantity) {
            var menuModel = cartModels[index];
            menuModel.quantity = quantity;
            if (quantity <= 0) {
              viewModel.removeFromCart(menuModel);
              return;
            }
            viewModel.addToCart(menuModel);
          });
        }));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        centerTitle: false,
        title: _title,
      ),
      body: SafeArea(
          top: false,
          child: Column(
            children: [
              Expanded(child: cartListView),
              _bottomDisplayWidget(viewModel.totalCartValue)
            ],
          )),
    );
  }
}
