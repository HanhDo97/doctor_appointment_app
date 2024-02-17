import 'package:doctor_appointment/core/notifiers/user_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomeUserWidget extends StatefulWidget {
  const HomeUserWidget({Key? key}) : super(key: key);

  @override
  State<HomeUserWidget> createState() => _HomeUserWidgetState();
}

class _HomeUserWidgetState extends State<HomeUserWidget> {
  late UserChangeNotifier userModel;
  late String imageUrl;

  @override
  void initState() {
    super.initState();
    userModel = Provider.of<UserChangeNotifier>(context, listen: false);
    _loadImage();
  }

  Future<void> _loadImage() async {
    imageUrl = "http://localhost:8080/images/NoneImage.jfif";
    if (userModel.user.image != null) {
      final response = await http.head(Uri.parse(userModel.user.image!));
      if (response.statusCode != 404) {
        setState(() {
          imageUrl = userModel.user.image!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          userModel.user.name!,
          style: const TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: Colors.transparent,
          ),
        )
      ],
    );
  }
}
