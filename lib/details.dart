import 'package:flutter/material.dart';
import 'package:sec2/DataBase/dbhandler.dart';

class Details extends StatefulWidget {
  final String title;
  final String desc;
  final int id;
  const Details({
    super.key,
    required this.title,
    required this.desc,
    required this.id,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  DataBaseHandler dataBaseHandler = DataBaseHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'ID: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        widget.id.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'Title: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        widget.title,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'Describition: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        widget.desc,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
