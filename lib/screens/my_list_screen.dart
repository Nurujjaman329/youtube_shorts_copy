import 'package:drama_box_copy/utils.dart';
import 'package:flutter/material.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.primaryColor,
      appBar: AppBar(
        backgroundColor: Utils.primaryColor,
        leading: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'My List',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
        actions: [
          Icon(
            Icons.list,
            color: Colors.grey,
          ),
          SizedBox(
            width: 5.0,
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.watch_later_sharp,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: SizedBox(
        height: 600,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: .000001,
                  ),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Center(
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 1.0, bottom: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                'https://picsum.photos/seed/picsum/200/300',
                                scale: .1,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
