import 'package:flutter/material.dart';

import 'login.dart';
import 'register.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.deepPurple[200],
                padding: const EdgeInsets.all(15),
                child: const Text(
                  "W E L C O M E",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              TabBar(
                  labelColor: Colors.purple,
                  unselectedLabelColor: Colors.grey,
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      text: "LOGIN",
                      icon: Icon(Icons.login),
                    ),
                    Tab(
                      text: "REGISTER",
                      icon: Icon(Icons.app_registration),
                    )
                  ])
            ],
          ),
        ),
      ),
      body: TabBarView(
          controller: _tabController, children: [LoginPage(), RegisterPage()]),
    );
  }
}
