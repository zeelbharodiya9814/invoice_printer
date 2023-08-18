import 'package:flutter/material.dart';

import 'homepage.dart';


class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {


  int? index;
  int? invoiceNo;
  String? buyer;

  List DataList = [];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController indexController = TextEditingController();
  TextEditingController invoiceNoController = TextEditingController();
  TextEditingController buyerController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Page",style: TextStyle(fontSize: 22),),

        actions: [
          TextButton(
            child: Text("Add",style: TextStyle(color: Colors.black,fontSize: 20),),
            onPressed: () {

              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                Map<String, dynamic> data = {
                  // 'Index': index,
                  // 'InvoiceNo': invoiceNo,
                  'BuyerName': "zeel",
                };

                DataList.add(data);

                Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage() ),
                );
                // Navigator.pushNamed(context, '/', arguments: data);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Data add..."),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                print("validate successfully...");
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Data not add..."),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
              indexController.clear();
              invoiceNoController.clear();
              buyerController.clear();

              setState(() {
                index = null;
                invoiceNo = null;
                buyer = null;
              });
            },
          ),


        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                // validator: (val) {
                //   if(val!.isEmpty) {
                //     return "Enter index No...";
                //   }
                // },
                onSaved: (val) {
                  setState(() {
                    index = int.parse(val!);
                  });
                },
                decoration: InputDecoration(
                  hintText: "Index"
                ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                // validator: (val) {
                //   if(val!.isEmpty) {
                //     return "Enter Invoice No...";
                //   }
                // },
                onSaved: (val) {
                  setState(() {
                    invoiceNo = int.parse(val!);
                  });
                },
                decoration: InputDecoration(
                    hintText: "Invoice No"
                ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                // validator: (val) {
                //   if(val!.isEmpty) {
                //     return "Enter Buyer Name...";
                //   }
                // },
                onSaved: (val) {
                  setState(() {
                    buyer = val;
                  });
                },
                decoration: InputDecoration(
                    hintText: "Buyer Name"
                ),
              ),
              SizedBox(height: 15,),

            ],
          ),
        ),
      ),
    );
  }
}
