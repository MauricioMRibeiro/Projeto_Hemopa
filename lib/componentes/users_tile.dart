import 'package:flutter/material.dart';
import 'package:hemopa_app/models/user.dart';
import 'package:hemopa_app/routes/app_routes.dart';

class UserTitle extends StatelessWidget {
  final User user;
  const UserTitle(this.user);
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.account_box_rounded))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.nome),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        height: 200,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user.cpf,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
