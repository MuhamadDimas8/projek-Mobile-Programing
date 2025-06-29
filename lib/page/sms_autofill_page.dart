import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SmsAutofillPage extends StatefulWidget {
  const SmsAutofillPage({super.key});

  @override
  State<SmsAutofillPage> createState() => _SmsAutofillPageState();
}

class _SmsAutofillPageState extends State<SmsAutofillPage> with CodeAutoFill {
  String _otpCode = "";

  @override
  void initState() {
    super.initState();
    listenForCode(); // mulai mendengarkan OTP masuk
  }

  @override
  void codeUpdated() {
    setState(() {
      _otpCode = code ?? "";
    });
  }

  @override
  void dispose() {
    cancel(); // hentikan listener saat page ditutup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS Autofill'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Masukkan OTP yang dikirim via SMS',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            PinFieldAutoFill(
              codeLength: 6,
              onCodeChanged: (code) {
                if (code != null && code.length == 6) {
                  FocusScope.of(context).unfocus(); // tutup keyboard
                }
              },
              onCodeSubmitted: (code) {
                debugPrint("OTP Dikirim: $code");
              },
            ),
            const SizedBox(height: 20),
            Text('OTP Terdeteksi: $_otpCode'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('OTP Dimasukkan: $_otpCode')),
                );
              },
              child: const Text("Verifikasi"),
            ),
          ],
        ),
      ),
    );
  }
}
