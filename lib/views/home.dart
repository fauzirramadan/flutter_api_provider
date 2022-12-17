import 'package:flutter/material.dart';
import 'package:flutter_api_provider/provider/user_provider.dart';
import 'package:flutter_api_provider/utils/nav_helper.dart';
import 'package:flutter_api_provider/views/my_tabbar.dart';
import 'package:flutter_api_provider/widgets/loading_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            IconButton(
                onPressed: () => Nav.toAll(const MyTabBar()),
                icon: const Icon(Icons.logout_rounded))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<UserProvider>(builder: (context, prov, _) {
            return prov.isLoading
                ? loadingView
                : GridView.builder(
                    itemCount: prov.dataUser.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.2,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      var data = prov.dataUser[index];
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple[200],
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipOval(
                                child: Image.network(data.avatar.toString(),
                                    fit: BoxFit.fitHeight, loadingBuilder:
                                        (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return loadingView;
                                }),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(data.email.toString()),
                            Text(data.firstName.toString())
                          ],
                        ),
                      );
                    });
          }),
        ),
      ),
    );
  }
}
