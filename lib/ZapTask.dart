import 'package:flutter/material.dart';
import 'Services.dart';
import 'Users.dart';
class ZaapTask extends StatefulWidget {
  //
  ZaapTask() : super();
  @override
  _ZaapTaskState createState() => _ZaapTaskState();
}
class _ZaapTaskState extends State<ZaapTask> {
  //
  List<User> _users;
  bool _loading;
  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'ZapTAskRahul'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0 : _users.length,
          itemBuilder: (context, index) {
            User user = _users[index];
            return ListTile(
              title: Text(user.title),
              subtitle: Text(user.body),
            );
          },
        ),
      ),
    );
  }
}