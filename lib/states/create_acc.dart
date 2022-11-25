import 'package:ansonline/utility/SetConfig.dart';
import 'package:ansonline/widgets/shw_title.dart';
import 'package:flutter/material.dart';

class CreateAcc extends StatefulWidget {
  const CreateAcc({super.key});

  @override
  State<CreateAcc> createState() => _CreateAccState();
}

class _CreateAccState extends State<CreateAcc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Account'),
        backgroundColor: Static_val.primary,
      ),
      body: ShowTitle(title: 'ข้อมูลทั่วไป',
      textStyle: Static_val().h2Style(),
      ),

    );
  }
}
