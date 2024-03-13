import 'package:doctor_appointment/config/const.dart';
import 'package:flutter/material.dart';

class HomeCategoryWidget extends StatefulWidget {
  const HomeCategoryWidget({
    super.key,
    required this.medCat,
  });

  final List<Map<String, dynamic>> medCat;

  @override
  State<HomeCategoryWidget> createState() => _HomeCategoryWidgetState();
}

class _HomeCategoryWidgetState extends State<HomeCategoryWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Const.screenHeight * 0.07,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...List.generate(widget.medCat.length, (index) {
            return Card(
              margin: const EdgeInsets.only(right: 20),
              color: Const.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Icon(medCat[index]['icon'])
                    Image(
                      image: widget.medCat[index]['icon'],
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.medCat[index]['category'],
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
