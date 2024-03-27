import 'package:drama_box_copy/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.primaryColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  size: 50.0,
                  color: Colors.grey,
                ),
                title: Text(
                  'Anonymous',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  'ID 78562347 ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                trailing: Text(
                  'Log in >',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Card(
              color: Color(0XFF29292B),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Wallet',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Coins',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              colors: [
                                Color(0XFFFE6628),
                                Color(0XFFF7005B),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Top Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.lock_clock_outlined,
              color: Colors.white60,
            ),
            title: Text(
              'Watch History',
              style: TextStyle(
                color: Colors.white60,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color: Colors.white60,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.help_center,
              color: Colors.white60,
            ),
            title: Text(
              'Help & Feedback',
              style: TextStyle(
                color: Colors.white60,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color: Colors.white60,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white60,
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                color: Colors.white60,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color: Colors.white60,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.feedback,
              color: Colors.white60,
            ),
            title: Text(
              'About',
              style: TextStyle(
                color: Colors.white60,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}
