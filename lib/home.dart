import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telegram_new/chat.dart';
import 'package:telegram_new/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Telegram',
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Abhinraj'),
              accountEmail: Text('8592943588'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/IDAK4920.JPG'),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.group),
              title: const Text('New Group'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.person),
              title: const Text('Contacts'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.call),
              title: const Text('Calls'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.near_me),
              title: const Text('people Nearby'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.save),
              title: const Text('Saved Messages'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.person_add),
              title: const Text('Invite Friends'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.question_mark_rounded),
              title: const Text('Telegram Features'),
            ),
            const SizedBox(
              height: 70,
            ),
            ListTile(
              onTap: () {
                logoutAlert(context);
              },
              leading: const Icon(Icons.exit_to_app),
              title: const Text('signout'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (ctx, index) {
              return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => ChatScreen(name: 'Friend $index'),
                      ),
                    );
                  },
                  title: Text('Friend $index'),
                  subtitle: const Text('new message',
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  leading: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 52, 157, 244),
                    backgroundImage: AssetImage('assets/images/userimage2.png'),
                    radius: 30,
                  ),
                  trailing: index <= 12
                      ? Text('$index:00 AM')
                      : Text('$index:00 PM'));
            },
            separatorBuilder: (ctx, index) {
              return const Divider(
                thickness: 3,
              );
            },
            itemCount: 25),
      ),
    );
  }

  logout(BuildContext context) async {
    final sharedpref = await SharedPreferences.getInstance();
    sharedpref.clear();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => const LoginScreen()),
        (route) => false);
  }

  logoutAlert(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Logout ?'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Are you sure, do you want to'),
              Text(
                'logout ?',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () {
                      logout(ctx);
                      logOutMessage(ctx);
                    },
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            )
          ],
        );
      },
    );
  }

  logOutMessage(BuildContext ctx) async {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        duration: Duration(seconds: 3),
        content: Text(
          'logout from your Telegram account',
        ),
      ),
    );
  }
}
