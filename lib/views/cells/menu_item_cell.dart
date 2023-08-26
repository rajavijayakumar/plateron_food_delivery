import 'package:flutter/material.dart';
import 'package:my_flutter_project/models/models.dart';

import '../lego_widgets/value_adjuster.dart';

class MenuItemCell extends StatelessWidget {
  final MenuModel menuModel;
  final void Function(int) onQuantityChange;

  const MenuItemCell(this.menuModel, this.onQuantityChange, {super.key});

  Widget get _foodImage => Image.network(
        menuModel.imgUrl ?? '',
        height: 125,
        width: 125,
      );

  Widget get _foodTitle => Text(
        menuModel.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      );

  Widget get _foodDescription => Text(
        menuModel.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            color: Color(0xFF667085),
            fontSize: 14,
            fontWeight: FontWeight.w600),
      );

  Widget get _vegOrNonVegIcon => Image.asset(
        (menuModel.isVeg
            ? 'assets/icons/veg_icon.png'
            : 'assets/icons/non_veg_icon.png'),
        height: 20,
      );

  Widget get _rateLabel => Text(
        '\$${menuModel.rate}',
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      );

  Widget get _valueAdjusterButton => ValueAdjuster(
        value: menuModel.quantity,
        onValueChange: (value) => {onQuantityChange(value)},
      );

  Widget get _bottomSeparator => Container(
        padding: const EdgeInsets.only(top: 24),
        height: 0.5,
        color: const Color(0xFFD0D5DD),
      );

  @override
  Widget build(BuildContext context) {
    var iconAndRateRow = Row(
      children: [
        _vegOrNonVegIcon,
        const SizedBox(
          width: 8,
        ),
        _rateLabel,
      ],
    );

    var iconRateAndValueAdjusterRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [iconAndRateRow, _valueAdjusterButton],
    );

    var expandedTitleAndAttributes = Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _foodTitle,
        const SizedBox(
          height: 4,
        ),
        _foodDescription,
        iconRateAndValueAdjusterRow
      ],
    ));

    var foodImageAndAttributes = Row(
      children: [
        _foodImage,
        const SizedBox(
          width: 8,
        ),
        expandedTitleAndAttributes
      ],
    );

    var attributesAndBottomSeparator = Column(
      children: [foodImageAndAttributes, _bottomSeparator],
    );

    return Container(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
        child: attributesAndBottomSeparator);
  }
}
