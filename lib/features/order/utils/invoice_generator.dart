import 'dart:typed_data';
import 'package:homesta/features/order/data/models/order_details_response/order_details.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class InvoiceGenerator {
  static Future<Uint8List> generateInvoice(OrderDetails order) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Invoice',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text('Order ID: ${order.orderId}'),
              pw.Text(
                'Customer: ${order.firstName ?? "N/A"} ${order.lastName ?? "N/A"}',
              ),
              pw.Text('Status: ${order.status}'),
              pw.SizedBox(height: 20),
              pw.Divider(),

              pw.Text(
                'Items:',
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),

              pw.Table.fromTextArray(
                headers: ['Product', 'Price', 'Quantity', 'Total'],
                data:
                    (order.items ?? [])
                        .map(
                          (item) => [
                            item.productName ?? '',
                            '\$${item.finalUnitPrice?.toStringAsFixed(2) ?? "0.00"}',
                            '${item.quantity ?? 0}',
                            '\$${((item.finalUnitPrice ?? 0) * (item.quantity ?? 0)).toStringAsFixed(2)}',
                          ],
                        )
                        .toList(),
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                headerDecoration: const pw.BoxDecoration(
                  color: PdfColors.grey300,
                ),
                cellAlignment: pw.Alignment.centerLeft,
                cellStyle: const pw.TextStyle(fontSize: 12),
              ),

              pw.SizedBox(height: 20),
              pw.Divider(),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Text(
                  'Total: \$${order.orderTotal?.toStringAsFixed(2) ?? "0.00"}',
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
    return pdf.save();
  }
}
