import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartIconWithBadge extends StatelessWidget {
  final int itemCount;
  final VoidCallback onBucketClicked;
  const CartIconWithBadge({super.key, required this.itemCount, required this.onBucketClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onBucketClicked(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset("assets/cart_black_icon.svg", width: 35, height: 35),
          if (itemCount > 0)
            Positioned(
              right: -6,
              top: -6,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$itemCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}