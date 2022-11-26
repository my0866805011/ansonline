import 'package:ansonline/utility/SetConfig.dart';
import 'package:ansonline/widgets/shw_title.dart';
import 'package:flutter/material.dart';

class CreateAcc extends StatefulWidget {
  const CreateAcc({super.key});

  @override
  State<CreateAcc> createState() => _CreateAccState();
}

class _CreateAccState extends State<CreateAcc> {
  String? typeUser;

  Row nameMethod(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: Static_val().h3Style(),
              labelText: 'User :',
              prefixIcon: Icon(Icons.account_circle, color: Static_val.light),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.dart),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row addressMethod(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            maxLines: 3,
            decoration: InputDecoration(
              labelStyle: Static_val().h3Style(),
              labelText: 'Address :',
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,60), 
              child: Icon(Icons.home, color: Static_val.light,
                 ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.dart),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
Row phoneMethod(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: Static_val().h3Style(),
              labelText: 'Phone :',
              prefixIcon: Icon(Icons.phone, color: Static_val.light),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.dart),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

Row userMethod(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: Static_val().h3Style(),
              labelText: 'User :',
              prefixIcon: Icon(Icons.perm_identity, color: Static_val.light),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.dart),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

Row passwordMethod(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: Static_val().h3Style(),
              labelText: 'Password :',
              prefixIcon: Icon(Icons.lock_outline, color: Static_val.light),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.dart),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Static_val.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }





  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Account'),
        backgroundColor: Static_val.primary,
      ),
      body:GestureDetector(onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          children: [
            showTitle('ข้อมูลทั่วไป'),
            nameMethod(size),
            showTitle('เลือก ประเภท'),
            radioListBuyer(size),
            radioListSeller(size),
            radioListRider(size),
            showTitle('ข้อมูลพื้นฐาน'),
            addressMethod(size),
            phoneMethod(size),
            userMethod(size),
            passwordMethod(size),
          ],
        ),
      ),
    );
  }

  Row radioListBuyer(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'buyer',
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value as String?;
              });
            },
            title: ShowTitle(
                title: 'ผู้ซื้อ (Buyer)', textStyle: Static_val().h3Style()),
          ),
        ),
      ],
    );
  }

  Row radioListSeller(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'seller',
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value as String?;
              });
            },
            title: ShowTitle(
                title: 'ผู้ขาย (Seller)', textStyle: Static_val().h3Style()),
          ),
        ),
      ],
    );
  }

  Row radioListRider(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'rider',
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value;
              });
            },
            title: ShowTitle(
                title: 'ผู้ส่ง (Rider)', textStyle: Static_val().h3Style()),
          ),
        ),
      ],
    );
  }

  Container showTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ShowTitle(
        title: title,
        textStyle: Static_val().h2Style(),
      ),
    );
  }
}
