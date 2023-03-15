import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ansonline/utility/SetConfig.dart';
import 'package:ansonline/utility/my_dialog.dart';
import 'package:ansonline/widgets/show_image.dart';
import 'package:ansonline/widgets/show_progress.dart';
import 'package:ansonline/widgets/shw_title.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class CreateAcc extends StatefulWidget {
  const CreateAcc({super.key});

  @override
  State<CreateAcc> createState() => _CreateAccState();
}

class _CreateAccState extends State<CreateAcc> {
  String? typeUser;
  File? file;
  double? lat, lng;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameCtl = TextEditingController();
  TextEditingController addressCtl = TextEditingController();
  TextEditingController phoneCtl = TextEditingController();
  TextEditingController userCtl = TextEditingController();
  TextEditingController passwordCtl = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPermission();
  }

  Future<Null> checkPermission() async {
    bool locationService;
    LocationPermission locationPermission;

    locationService = await Geolocator.isLocationServiceEnabled();
    if (locationService) {
      print('Service Location Open');

      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alerlocationService(
              context, 'ไม่อนุญาติแชร์', 'โปรดแชร์ Location');
        } else {
          //Find Latlng
          findLagLng();
        }
      } else {
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alerlocationService(
              context, 'ไม่อนุญาติแชร์', 'โปรดแชร์ Location');
        } else {
          //Find
          findLagLng();
        }
      }
    } else {
      print('Service Localtion Close');
      MyDialog()
          .alerlocationService(context, 'Location Close', 'Open Location');
    }
  }

  Future<Null> findLagLng() async {
    print('findLatLan ==> Work');
    Position? position = await findPostion();
    setState(() {
      lat = position!.latitude;
      lng = position.longitude;
      print('lat = $lat, lng = $lng');
    });
  }

  Future<Position?> findPostion() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition();
      return position;
    } catch (e) {
      return null;
    }
  }

  Row nameMethod(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            controller: nameCtl,
            validator: (value) {
              if (value!.isEmpty) {
                return ' ระบุ รายชื่อ ';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelStyle: Static_val().h3Style(),
              labelText: 'Name:',
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
            controller: addressCtl,
            validator: (value) {
              if (value!.isEmpty) {
                return ' โปรด ระบุ ที่อยู่';
              } else {
                return null;
              }
            },
            maxLines: 3,
            decoration: InputDecoration(
              labelStyle: Static_val().h3Style(),
              labelText: 'Address :',
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Icon(
                  Icons.home,
                  color: Static_val.light,
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
          margin: const EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            keyboardType: TextInputType.phone,
            controller: phoneCtl,
            validator: (value) {
              if (value!.isEmpty) {
                return 'โปรด ระบุ หมายเลขโทรศัพท์';
              } else {
                return null;
              }
            },
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
            controller: userCtl,
            validator: (value) {
              if (value!.isEmpty) {
                return 'โปรด ระบุ User';
              } else {
                return null;
              }
            },
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
            controller: passwordCtl,
            validator: (value) {
              if (value!.isEmpty) {
                return ' possword Not Empty';
              } else {
                return null;
              }
            },
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
        actions: [insertData()],
        title: const Text('Create New Account'),
        backgroundColor: Static_val.primary,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
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
                showTitle('รูปภาพ'),
                ShowTitle(
                    title: 'รูปภาพที่ต้องการแสดง',
                    textStyle: Static_val().h3Style()),
                avatarMethod(size),
                showTitle('แสดงพิกัด'),
                //showMap(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton insertData() {
    return IconButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            if (typeUser == null) {
              print('Non Choose type User');
              MyDialog()
                  .normalDialog(context, 'User Type', 'Choose User type ');
            } else {
              print('Process Insert ');
              uploadInsertData();
            }
          }
        },
        icon: const Icon(Icons.cloud_upload));
  }

  Future<Null> uploadInsertData() async {
    String name = nameCtl.text;
    String address = addressCtl.text;
    String password = passwordCtl.text;
    String phone = phoneCtl.text;
    String user = userCtl.text;
    
    print(' name = $name, address = $address, user =$user');
    print(' phone = $phone, password = $password, user =$user, type=$typeUser');
    String path ="https://www.57ans.com/ansonline/mysql/myapi/insert.php?isAdd=true&name=$name&type=$typeUser&user=$user&password=$password";
   // String path ="https://www.57ans.com/appfood/insertuser.php?isAdd=true&name=phairot 14-06-2507&type=shop&user=username&password=12345678";
  //  String path ="https://www.57ans.com/ansonline/api/getUserWhereUser.php?isAdd=true&user=$user";
//  'https://www.57ans.com/ansonline/api/getUserWhereUser.php?isAdd=true&user=$user';

    await Dio().get(path).then((value) => print('## value ==>> $value'));
  }

  Widget showMap() => Container(
        color: Colors.green,
        width: double.infinity,
        height: 200,
        child:
            lat == null ? const ShowProgress() : Text('Lat = $lat, Lng = $lng'),
      );

  Future<void> chooseImage(ImageSource source) async {
    try {
      // ignore: deprecated_member_use
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result!.path);
      });
    // ignore: empty_catches
    } catch (e) {}
  }

  Row avatarMethod(double size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => chooseImage(ImageSource.camera),
            icon: const Icon(
              Icons.add_a_photo,
              size: 36,
            )),
        Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            width: size * 0.6,
            child: file == null
                ? ShowImage(path: Static_val.avatar)
                : Image.file(file!)),
        IconButton(
          onPressed: () => chooseImage(ImageSource.gallery),
          icon: const Icon(
            Icons.add_photo_alternate,
            size: 36,
          ),
        ),
      ],
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
                typeUser = value;
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
