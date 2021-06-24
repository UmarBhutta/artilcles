import 'package:intl/intl.dart';

class DateUtil{

  static String getReadableDate(String stringDate){
    final dateFormatServer = DateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
    final dateFormatReadable = DateFormat('MM/dd/yyyy hh:mm a');

    var publishDate = dateFormatServer.parse(stringDate);
    return dateFormatReadable.format(publishDate);
  }
}