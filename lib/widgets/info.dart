import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_interface.dart';

class Info extends StatelessWidget {
  const Info({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
      builder: (context, ui, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Thông tin người mượn"),
            backgroundColor: ui.appBarColor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 450.0, // Độ rộng của thẻ
              height: 200.0, // Độ cao của thẻ
              child: Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildInfoRow("Tên người mượn", ui.borrowerName),
                      buildInfoRow("Số căn cước", ui.borrowerIdCard),
                      buildInfoRow("Số điện thoại", ui.borrowerPhone),
                      buildInfoRow("Mã sách", ui.borrowerBookCode),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}
