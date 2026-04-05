import 'package:web/web.dart' as web;

void downloadCV() {
  final anchor =
      web.document.createElement('a') as web.HTMLAnchorElement;
  anchor.href = 'assets/assets/cv/emmanuel_olufunmilayo_cv.pdf';
  anchor.download = 'Emmanuel_Olufunmilayo_Senior_Mobile_Engineer.pdf';
  anchor.click();
}
