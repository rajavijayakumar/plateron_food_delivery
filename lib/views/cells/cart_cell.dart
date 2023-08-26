import 'package:flutter/material.dart';

import '../lego_widgets/value_adjuster.dart';
import '../../models/models.dart';

class CartCell extends StatelessWidget {
  final MenuModel menuModel;
  final void Function(int) onQuantityChange;

  const CartCell(this.menuModel, this.onQuantityChange, {super.key});

  Widget get _title => Text(
        menuModel.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      );

  Widget get _totalPriceText => Text(
        '\$${menuModel.quantity * menuModel.rate}',
        maxLines: 1,
        textAlign: TextAlign.end,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      );

  Widget get _valueAdjusterButton => ValueAdjuster(
        value: menuModel.quantity,
        onValueChange: (value) => {onQuantityChange(value)},
      );

  @override
  Widget build(BuildContext context) {
    var valueAdjusterAndTotalPriceColumn = Column(
      children: [
        _valueAdjusterButton,
        _totalPriceText,
      ],
    );

    var titleAndValueAdjusterRow = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_title, valueAdjusterAndTotalPriceColumn]);

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
      child: titleAndValueAdjusterRow,
    );
  }
}
