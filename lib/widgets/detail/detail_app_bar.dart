import 'package:doctor_appointment/config/const.dart';
import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isFav;
  final VoidCallback onBack;
  final VoidCallback onFavoritePressed;

  const DetailAppBar({
    Key? key,
    required this.isFav,
    required this.onBack,
    required this.onFavoritePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Detail Screen',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: Container( 
        decoration: BoxDecoration(
          color: Const.primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: IconButton(
          hoverColor: Const.primaryColor,
          onPressed: onBack,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: onFavoritePressed,
          icon: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
