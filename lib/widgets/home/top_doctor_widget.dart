import 'package:doctor_appointment/config/const.dart';
import 'package:doctor_appointment/services/data_service.dart';
import 'package:flutter/material.dart';

class TopDoctorWidget extends StatefulWidget {
  const TopDoctorWidget({
    super.key,
  });

  @override
  State<TopDoctorWidget> createState() => _TopDoctorWidgetState();
}

class _TopDoctorWidgetState extends State<TopDoctorWidget> {
  final DataService dataService = DataService();

  List<dynamic> topDoctors = [];

  @override
  void initState() {
    super.initState();

    // Get top doctors
    getTopDoctors(context);
  }

  Future<dynamic> getTopDoctors(BuildContext context) async {
    try {
      final response = await dataService.getTopDoctors();
      setState(() {
        topDoctors = response.data;
      });
    } catch (e) {
      print('Get top doctors error: ' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Const.init(context);
    return SizedBox(
      height: 300, // Set a fixed height or adjust as necessary
      child: topDoctors.isNotEmpty
          ? ListView.builder(
              itemCount: topDoctors.length,
              itemBuilder: (context, index) {
                final doctor = topDoctors[index];
                return GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    height: 150,
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Row(
                        children: [
                          SizedBox(
                            width: Const.screenWidth * 0.33,
                            child: Image.network(
                              doctor['image'],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doctor['name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  doctor['cate_name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                                const Spacer(),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.star_border,
                                      size: 16,
                                      color: Colors.yellow,
                                    ),
                                    Spacer(flex: 1),
                                    Text('4.5'),
                                    Spacer(flex: 1),
                                    Text('Reviews'),
                                    Spacer(flex: 1),
                                    Text('20'),
                                    Spacer(flex: 7),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('doctor_detail', arguments: doctor);
                  },
                );
              },
            )
          : Container(),
    );
  }
}
