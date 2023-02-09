import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:provider/provider.dart';

import 'services/orders_service.dart';


class PdfGenerator {
  
  Future<void> generate(String path) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(build: (pw.Context context) {
      final getOrder=Provider.of<OrderService>(context);
    return pw.Column(
      children: <pw.Widget>[
        pw.Table(
          children: const <pw.TableRow>[
            pw.TableRow(
              children: [
                pw.Padding(
                    padding: pw.EdgeInsets.all(8.0),
                    child: pw.Column(
                      children: <pw.Widget>[
                        pw.Container(
                          height: 100,
                          width: 100,
                          child: pw.Image.file('path/to/logo.jpg'),
                        ),
                        pw.Text("Nombre empresa"),
                      ],
                    ),
                  ),
                pw.Padding(padding: pw.EdgeInsets.all(8.0), child: pw.Text('PEDIDO Nº')),
                ],
              ),
            pw.TableRow(
                children: [
                  pw.Padding(padding: pw.EdgeInsets.all(8.0), child: pw.Text('Dirección de envío')),
                  pw.Padding(padding: pw.EdgeInsets.all(8.0), child: pw.Text('')),
                ],
              ),
        ),
        pw.Table(
          children: const <pw.TableRow>[
            pw.TableRow(
              children: [
                pw.Padding(
                    padding: pw.EdgeInsets.all(8.0), 
                    child: pw.Text('Ref. Cod')), 
                pw.Padding(
                    padding: pw.EdgeInsets.all(8.0), 
                    child: pw.Text('Descripción')),
                pw.Padding(
                    padding: pw.EdgeInsets.all(8.0), 
                    child: pw.Text('Cantidad')),
                pw.Padding(
                    padding: pw.EdgeInsets.all(8.0), 
                    child: pw.Text('Precio')),
                pw.Padding(
                    padding: pw.EdgeInsets.all(8.0), 
                    child: pw.Text('Importe')),
              ],
            ),
            pw.TableRow(
              children: [
                pw.Padding(
                    padding: pw.EdgeInsets.all(8.0),
                    child: pw.Text('Column 1')),
                pw.Padding(
                    padding: pw.EdgeInsets.all(8.0),
                    child: pw.Text('Column 2')),
                pw.Padding(
                    padding: pw.EdgeInsets.all(8.0),
                    child: pw.Text('Column 3')), 
                pw.Padding(
                    padding: pw.EdgeInsets.all(8.0),
                    child: pw.Text('Column 4')), 
                pw.Padding(
                    padding: pw.EdgeInsets.all(8.0),
                    child: pw.Text('Column 5')), 
              ],
            ),
          ],
        ),
        
        
        pw.Table(
          children: const <pw.TableRow>[
            pw.TableRow(
              children: [
                pw.Padding(
                    padding: pw.EdgeInsets.all(8.0), 
                    child: pw.Text('TOTAL')), 
              ],
            ),
            pw.TableRow(
              children: [
                pw.Padding(
                    padding: pw.EdgeInsets.all(8.0),
                    child: pw.Text('Aceptado por')),
              ],
            ),
          ],
        ),
      ],
      );
      }
    ));

    final file = File(path);
    await file.writeAsBytes(pdf.save());
  }
}

Future<void> sendPdf(String path) async {
  final Email email = Email(
                            body: 'Here is a copy of the order.',
                            subject: 'Order made successfully',
                            recipients: ['raulreyes@cadiz.salesianos.edu'],
                            attachmentPath: 
                              'path/to/your/pdf/file.pdf'
                          );

                          String platformResponse;

                          try {
                            await FlutterEmailSender.send(email);
                            platformResponse = 'success';
                          } catch (error) {
                            platformResponse = error.toString();
                          }
 
}

Future<void> main() async {
  await PdfGenerator().generate('path/to/your/pdf/file.pdf');
  await sendPdf('path/to/your/pdf/file.pdf');
}



// body: Center(
//          child: FlatButton(
//            child: Text('Generate PDF'),
//            onPressed: () async {
//               await PdfGenerator().generate('path/to/your/pdf/file.pdf');
//               await sendPdf('path/to/your/pdf/file.pdf');
//            },
//          ),
//        ),
//esto es lo que habria que meterle al boton de 'generar pdf', lo del future void main