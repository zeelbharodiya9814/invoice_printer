import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? index;
  int? invoiceNo;
  String? buyer;
  String? date;
  int? quantity;
  int? rate;
  int? taxableAMT;
  int? cgst;
  int? sgst;
  int? total;

  List DataList = [];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController indexController = TextEditingController();
  TextEditingController invoiceNoController = TextEditingController();
  TextEditingController buyerController = TextEditingController();



  final pdf = pw.Document();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    makePDF();
  }



  makePDF() {
    pdf.addPage(
      pw.Page(
        build: (pw.Context context1) => pw.Column(
          children: [
            pw.Table(
              defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
              columnWidths: {
                0: pw.FlexColumnWidth(1.2),
                1: pw.FlexColumnWidth(1.8),
                2: pw.FlexColumnWidth(3),
                3: pw.FlexColumnWidth(2.2),
                4: pw.FlexColumnWidth(2),
                5: pw.FlexColumnWidth(2),
                6: pw.FlexColumnWidth(2),
                7: pw.FlexColumnWidth(1.9),
                8: pw.FlexColumnWidth(1.9),
                9: pw.FlexColumnWidth(2),
              },
              // defaultColumnWidth: pw.FixedColumnWidth(15.0),
              border: pw.TableBorder.all(
                  color: PdfColors.black, style: pw.BorderStyle.solid, width: 1.5),
              children: [
                pw.TableRow(
                    children: [
                      pw.Padding(
                        padding:  pw.EdgeInsets.only(left: 3,right: 3,top: 8,bottom: 8),
                        child: pw.Column(children: [
                          pw.Text('Ind',
                              style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 8))
                        ]),
                      ),
                      pw.Padding(
                        padding:  pw.EdgeInsets.only(left: 3,right: 3,top: 8,bottom: 8),
                        child: pw.Column(children: [
                          pw.Text('Invoice\n No',
                              style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 8)),
                        ]),
                      ),
                      pw.Padding(
                        padding:  pw.EdgeInsets.only(left: 3,right: 3,top: 8,bottom: 8),
                        child: pw.Column(children: [
                          pw.Text('Buyer Name',
                              style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 8))
                        ]),
                      ),
                      pw.Padding(
                        padding:  pw.EdgeInsets.only(left: 3,right: 3,top: 8,bottom: 8),
                        child: pw.Column(children: [
                          pw.Text('Date',
                              style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 8))
                        ]),
                      ),
                      pw.Padding(
                        padding:  pw.EdgeInsets.only(left: 3,right: 3,top: 8,bottom: 8),
                        child: pw.Column(children: [
                          pw.Text('Quantity',
                              style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 8))
                        ]),
                      ),
                      pw.Padding(
                        padding:  pw.EdgeInsets.only(left: 3,right: 3,top: 8,bottom: 8),
                        child: pw.Column(children: [
                          pw.Text('Rate',
                              style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 8))
                        ]),
                      ),
                      pw.Padding(
                        padding:  pw.EdgeInsets.only(left: 3,right: 3,top: 8,bottom: 8),
                        child: pw.Column(
                            children: [
                          pw.Text('  Taxable\n  AMT',
                              style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 8))
                        ]),
                      ),
                      pw.Padding(
                        padding:  pw.EdgeInsets.only(left: 3,right: 3,top: 8,bottom: 8),
                        child: pw.Column(children: [
                          pw.Text('  CGST\n Value',
                              style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 8))
                        ]),
                      ),
                      pw.Padding(
                        padding:  pw.EdgeInsets.only(left: 3,right: 3,top: 8,bottom: 8),
                        child: pw.Column(children: [
                          pw.Text('  SGST\n  Value',
                              style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 8))
                        ]),
                      ),
                      pw.Padding(
                        padding:  pw.EdgeInsets.only(left: 3,right: 3,top: 8,bottom: 8),
                        child: pw.Column(children: [
                          pw.Text('Total',
                              style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 8))
                        ]),
                      ),
                    ]),
                ...DataList.map((e) {
                  return pw.TableRow(children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5.0),
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [pw.Text('${e['Index']}',style: pw.TextStyle(fontSize: 8))]),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5.0),
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [pw.Text('${e['InvoiceNo']}',style: pw.TextStyle(fontSize: 8))]),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5.0),
                      child: pw.Container(
                        alignment: pw.Alignment.bottomRight,
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            children: [pw.Center(child: pw.Text('${e['BuyerName']}',style: pw.TextStyle(fontSize: 8)))]),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5.0),
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [pw.Center(child: pw.Text('${e['Date']}',style: pw.TextStyle(fontSize: 8)))]),
                    ),

                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5.0),
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [pw.Center(child: pw.Text('${e['Quantity']}',style: pw.TextStyle(fontSize: 8)))]),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5.0),
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [pw.Center(child: pw.Text('${e['Rate']}',style: pw.TextStyle(fontSize: 8)))]),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5.0),
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [pw.Center(child: pw.Text('${e['TaxableAMT']}',style: pw.TextStyle(fontSize: 8)))]),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5.0),
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [pw.Center(child: pw.Text('${e['CGST']}',style: pw.TextStyle(fontSize: 8)))]),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5.0),
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [pw.Center(child: pw.Text("${e['SGST']}",style: pw.TextStyle(fontSize: 8)),),
                          ]),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5.0),
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [pw.Center(child: pw.Text('${e['Total']}',style: pw.TextStyle(fontSize: 8)))]),
                    ),
                  ]);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    //   // DeviceOrientation.portraitUp,
    //   // DeviceOrientation.portraitDown,
    // ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Data List",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: ()  {

                setState(() async{

                  WidgetsFlutterBinding.ensureInitialized();
                  SystemChrome.setPreferredOrientations([
                    // DeviceOrientation.landscapeRight,
                    // DeviceOrientation.landscapeLeft,
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.portraitDown,
                  ]);

                  Uint8List data = await pdf.save();
                  await Printing.layoutPdf(onLayout: (format) => data);
                });
              },
              icon: Icon(Icons.picture_as_pdf)),
        ],
      ),
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(3),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                0: FlexColumnWidth(1.2),
                1: FlexColumnWidth(1.5),
                2: FlexColumnWidth(3),
                3: FlexColumnWidth(2.2),
                4: FlexColumnWidth(1.6),
                5: FlexColumnWidth(1.4),
                6: FlexColumnWidth(1.5),
                7: FlexColumnWidth(1.5),
                8: FlexColumnWidth(1.5),
                9: FlexColumnWidth(1.5),
              },
              // defaultColumnWidth: FixedColumnWidth(3),
              border: TableBorder.all(
                  color: Colors.black, style: BorderStyle.solid, width: 1.5),
              children: [
                TableRow(
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Column(children: [
                      Text('Index',
                          style: TextStyle(fontWeight: FontWeight.w600))
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Column(children: [
                      Text('Invoice No',
                          style: TextStyle(fontWeight: FontWeight.w600))
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Column(children: [
                      Text('Buyer Name',
                          style: TextStyle(fontWeight: FontWeight.w600))
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Column(children: [
                      Text('Date',
                          style: TextStyle(fontWeight: FontWeight.w600))
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Column(children: [
                      Text('Quantity',
                          style: TextStyle(fontWeight: FontWeight.w600))
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Column(children: [
                      Text('Rate',
                          style: TextStyle(fontWeight: FontWeight.w600))
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Column(children: [
                      Text('Taxable AMT',
                          style: TextStyle(fontWeight: FontWeight.w600))
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Column(children: [
                      Text('CGST Value',
                          style: TextStyle(fontWeight: FontWeight.w600))
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Column(children: [
                      Text('SGST Value',
                          style: TextStyle(fontWeight: FontWeight.w600))
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Column(children: [
                      Text('Total',
                          style: TextStyle(fontWeight: FontWeight.w600))
                    ]),
                  ),
                ]),
                ...DataList.map((e) {
                  return TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('${e['Index']}')]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('${e['InvoiceNo']}')]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [Center(child: Text('${e['BuyerName']}'))]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Center(child: Text('${e['Date']}'))]),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Center(child: Text('${e['Quantity']}'))]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Center(child: Text('${e['Rate']}'))]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Center(child: Text('${e['TaxableAMT']}'))]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Center(child: Text('${e['CGST']}'))]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Center(child: Text("${e['SGST']}"),),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Center(child: Text('${e['Total']}'))]),
                    ),
                  ]);
                }),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            WidgetsFlutterBinding.ensureInitialized();
            SystemChrome.setPreferredOrientations([
              // DeviceOrientation.landscapeRight,
              // DeviceOrientation.landscapeLeft,
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Invoice"),
                    content: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 20, left: 8, right: 8),
                      child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
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
                                decoration: InputDecoration(hintText: "Index"),
                              ),
                              SizedBox(
                                height: 15,
                              ),
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
                                decoration:
                                    InputDecoration(hintText: "Invoice No"),
                              ),
                              SizedBox(
                                height: 15,
                              ),
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
                                decoration:
                                    InputDecoration(hintText: "Buyer Name"),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                // validator: (val) {
                                //   if(val!.isEmpty) {
                                //     return "Enter Buyer Name...";
                                //   }
                                // },
                                onSaved: (val) {
                                  setState(() {
                                    date = val;
                                  });
                                },
                                decoration:
                                InputDecoration(hintText: "Date"),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                // validator: (val) {
                                //   if(val!.isEmpty) {
                                //     return "Enter Buyer Name...";
                                //   }
                                // },
                                onSaved: (val) {
                                  setState(() {
                                    quantity = int.parse(val!);
                                  });
                                },
                                decoration:
                                InputDecoration(hintText: "Quantity"),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                // validator: (val) {
                                //   if(val!.isEmpty) {
                                //     return "Enter Buyer Name...";
                                //   }
                                // },
                                onSaved: (val) {
                                  setState(() {
                                    rate = int.parse(val!);
                                  });
                                },
                                decoration:
                                InputDecoration(hintText: "Rate"),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                // validator: (val) {
                                //   if(val!.isEmpty) {
                                //     return "Enter Buyer Name...";
                                //   }
                                // },
                                onSaved: (val) {
                                  setState(() {
                                    taxableAMT = int.parse(val!);
                                  });
                                },
                                decoration:
                                InputDecoration(hintText: "Taxable AMT"),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                // validator: (val) {
                                //   if(val!.isEmpty) {
                                //     return "Enter Buyer Name...";
                                //   }
                                // },
                                onSaved: (val) {
                                  setState(() {
                                    cgst = int.parse(val!);
                                  });
                                },
                                decoration:
                                InputDecoration(hintText: "CGST Value"),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                // validator: (val) {
                                //   if(val!.isEmpty) {
                                //     return "Enter Buyer Name...";
                                //   }
                                // },
                                onSaved: (val) {
                                  setState(() {
                                    sgst = int.parse(val!);;
                                  });
                                },
                                decoration:
                                InputDecoration(hintText: "SGST Value"),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                // validator: (val) {
                                //   if(val!.isEmpty) {
                                //     return "Enter Buyer Name...";
                                //   }
                                // },
                                onSaved: (val) {
                                  setState(() {
                                    total = int.parse(val!);
                                  });
                                },
                                decoration:
                                InputDecoration(hintText: "Total"),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      MaterialButton(
                        color: Colors.blue[200],
                        textColor: Colors.black,
                        child: const Text('SAVE'),
                        onPressed: () {
                          WidgetsFlutterBinding.ensureInitialized();
                          SystemChrome.setPreferredOrientations([
                            DeviceOrientation.landscapeRight,
                            DeviceOrientation.landscapeLeft,
                            // DeviceOrientation.portraitUp,
                            // DeviceOrientation.portraitDown,
                          ]);
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            Map<String, dynamic> data = {
                              'Index': index,
                              'InvoiceNo': invoiceNo,
                              'BuyerName': buyer,
                              'Date': date,
                              'Quantity': quantity,
                              'Rate': rate,
                              'TaxableAMT': taxableAMT,
                              'CGST': cgst,
                              'SGST': sgst,
                              'Total': total,
                            };

                            DataList.add(data);

                            Navigator.pop(context);

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
                  );
                });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          )),
    );
  }
}
