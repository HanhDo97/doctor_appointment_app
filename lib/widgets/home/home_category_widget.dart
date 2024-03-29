import 'package:doctor_appointment/config/const.dart';
import 'package:doctor_appointment/core/exceptions/unauthenticated_exception.dart';
import 'package:doctor_appointment/core/widgets/messages/dialog_show_error.dart';
import 'package:doctor_appointment/services/data_service.dart';
import 'package:flutter/material.dart';

class HomeCategoryWidget extends StatefulWidget {
  const HomeCategoryWidget({
    super.key,
  });

  @override
  State<HomeCategoryWidget> createState() => _HomeCategoryWidgetState();
}

class _HomeCategoryWidgetState extends State<HomeCategoryWidget> {
  final DataService dataService = DataService();

  List<dynamic> categories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // get Categories list
    getCategories(context);
  }

  Future<void> getCategories(BuildContext context) async {
    try {
      final response = await dataService.getCategories();
      setState(() {
        categories = response.data;
      });
    } catch (e) {
      print('Get categories error: ' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return categories != null
        ? SizedBox(
            height: Const.screenHeight * 0.07,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(categories.length, (index) {
                  final category = categories[index];
                  if (category != null) {
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
                            if (category['icon_or_image'] != null)
                              Image.network(
                                category['icon_or_image'],
                                width: 20,
                                height: 20,
                                color: Colors.white,
                              ),
                            if (category['icon_or_image'] != null)
                              const SizedBox(width: 10),
                            Text(
                              category['name'] ??
                                  '', // Use null-aware operator to handle null case
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    // Return an empty container if category is null
                    return Container();
                  }
                })
              ],
            ),
          )
        : Container(); // Return an empty container if categories is null
  }
}
