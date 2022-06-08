import 'package:flutter/material.dart';
import 'package:vinhome/utils/color.dart';

class ListIssueScreen extends StatefulWidget {
  const ListIssueScreen({Key? key}) : super(key: key);

  @override
  State<ListIssueScreen> createState() => _ListIssueScreenState();
}

class _ListIssueScreenState extends State<ListIssueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sự cố'),
        iconTheme: IconThemeData(color: AppColor.whiteColor),
        backgroundColor: AppColor.mainColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Show Menu',
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('This is a menu')));
          },
        ),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Expanded(
                              child: Column(
                            children: [Text('Hieu Tao'), Text('20/09/2020')],
                          )),
                          Text('Khong duyet')
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Text('Đố các fen trái này là trái gì?'),
                          Text('''Con mèo mà trèo cây cau
                              Hỏi thăm chú chuột đi đâu vắng nhà
                              Chú chuột đi chợ đường xa
                              Mua mắm mà mua muối
                              Mua mắm mà mua muối để giỗ cha
                              Để giỗ cha chú mèo
                              ''')
                        ],
                      )
                    ],
                  ));
            }),
      ),
    );
  }
}
