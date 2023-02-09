import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:email_launcher/email_launcher.dart';

class PdfGenerator {
  Future<void> generate(String path) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(build: (pw.Context context) {
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
  final file = await File(path).readAsBytes();
  await EmailLauncher.launch(
    to: 'to@example.com', //email del usuario
    subject: 'Flutter PDF',
    body: 'Generated pdf',
    attachmentPath: 'file.pdf',
    attachmentData: file,
  );
 
}

Future<void> main() async {
  await PdfGenerator().generate('path/to/your/pdf/file.pdf');
  await sendPdf('path/to/your/pdf/file.pdf');
}


// body: Center(
//         child: FlatButton(
//           child: Text('Generate PDF'),
//           onPressed: () async {
//             await generatePdf('example.pdf');
//           },
//         ),
//       ),
//esto es lo que habria que meterle al boton de 'generar pdf'