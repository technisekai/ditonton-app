import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

class CertSsl extends IOClient {
  Future<SecurityContext> get globalContext async {
    final sslCert = await rootBundle.load('certificates/themoviedb.crt');
    SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
    securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
    return securityContext;
  }

  Future<Response> getData(Uri url, {Map<String, String>? headers}) async {
    HttpClient client = HttpClient(context: await globalContext);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;
    IOClient ioClient = IOClient(client);
    return ioClient.get(url);
  }
}
