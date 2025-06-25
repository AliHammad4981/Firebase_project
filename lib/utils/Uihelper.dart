import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Uihelper{

  static custometextfield(TextEditingController controller, String hint, IconData icon, bool isHide) {
    return TextField(
      controller: controller,
      obscureText: isHide,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: 14.0, horizontal: 10.0),
        label: Text(hint),
        labelStyle: TextStyle(color: Colors.grey),
        floatingLabelStyle: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon:  Icon(icon),
      ),
        );

  }

  static customButton(VoidCallback onpres, bool loading, String text) {
    return InkWell(
      onTap: onpres,
      child: Container(height: 50, width: 300, decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(20)
      ),

        child: Center( child: loading ? const CircularProgressIndicator(
          color: Colors.white,
        ) :
          Text(text, style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
                ),),
        ),
      ),
    );
  }

  static customalertbox(BuildContext context, String text) {
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(text),
      );
    }

    );
  } //alertbox End here

// static toastMessage(String Message)
// {
//   Fluttertoast.showToast(
//       msg: Message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.deepPurple,
//       textColor: Colors.white,
//       fontSize: 16.0
//   );
// }
}