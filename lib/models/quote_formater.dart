import 'package:scoped_model/scoped_model.dart';
import 'dummydata.dart';

class Quotes extends Model {
  String? quote = '';
  String? name = '';
  Map mydata = getdummydata();
  List authors = [];
  int currentdata = 0;
  String url = 'https://dummyjson.com/quotes/';

  void getdata() {
    // Response response = await get(Uri.parse('$url$currentdata'));
    dynamic response = mydata['quotes'];
    // if (response.statusCode == 200) {
    //   mydata = jsonDecode(response.body);
    //   quote = mydata!['quote'];
    //   name = mydata!['author'];
    //   notifyListeners();
    // }
    quote = response[currentdata]['quote'];
    name = response[currentdata]['author'];
  }

  void nextdata() {
    currentdata++;
    getdata();
    //  getdatalist();
    notifyListeners();
  }

  void prevdata() {
    currentdata--;
    getdata();
    notifyListeners();
  }

  List<dynamic> getdatalist() {
    dynamic response = mydata['quotes'];
    for (var element in response) {
      // debugPrint('${element["author"]}');
      authors.add(element['author']);
    }
    notifyListeners();
    return authors;
  }
}
