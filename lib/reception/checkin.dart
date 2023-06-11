import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_arth_app/reception/reservation_infos.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../Services/qr_code.dart';

class Checkin extends StatefulWidget {
  const Checkin({super.key});

  @override
  State<Checkin> createState() => _CheckinState();
}

class _CheckinState extends State<Checkin> {
  var qrcode = QrCode();

  // Barcode? result;
  // QRViewController? controller;
  // final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrcode.controller!.pauseCamera();
    }
    qrcode.controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (qrcode.result != null)
                    if (describeEnum(qrcode.result!.format) == "qrcode")
                      Text(
                          'Barcode Type: ${describeEnum(qrcode.result!.format)}   Data: ${qrcode.id = qrcode.result!.code}')
                    else
                      const Text('Scannez le QR code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await qrcode.controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: qrcode.controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                if (snapshot.data == false)
                                  return Icon(Icons.flash_off_sharp);
                                else
                                  return Icon(Icons.flash_on_sharp);
                                // Text('Flash: ${snapshot.data}');
                              },
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await qrcode.controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: qrcode.controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  if (describeEnum(snapshot.data!) == "back") {
                                    return Icon(
                                        Icons.photo_camera_back_outlined);
                                  } else if (describeEnum(snapshot.data!) ==
                                      "front") {
                                    return Icon(
                                        Icons.photo_camera_front_outlined);
                                  } else {
                                    return const Text('Chargement');
                                  }
                                } else {
                                  return const Text('Chargement');
                                }
                              },
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await qrcode.controller?.pauseCamera();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReservationInfos(),
                                  settings: RouteSettings(
                                      arguments: {'id': qrcode.result!.code})),
                            );
                          },
                          child: const Text('pause',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await qrcode.controller?.resumeCamera();
                          },
                          child: const Text('resume',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrcode.qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      qrcode.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrcode.result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    qrcode.controller?.dispose();
    super.dispose();
  }
}
