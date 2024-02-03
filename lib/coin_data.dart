import 'dart:convert';
import 'package:http/http.dart' as http;
import 'price_screen.dart';
const List<String> currenciesList = [
  'AUD',
  'INR'
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const coinApiUrl= 'https://rest.coinapi.io/v1/exchangerate';
const apikey='C4BB095A-BC40-47A0-9D17-B35BF36CF875';
const bitcoinAverageURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future<double> getCoinData(String selectedCurrency) async {
//create url
      String requestUrl = '$bitcoinAverageURL/BTC/$selectedCurrency?apikey=$apikey';
      try {
        //request url to get output
        http.Response response = await http.get(Uri.parse(requestUrl));
        if (response.statusCode == 200) {
          // convert the code in Parse the JSON response
          var data = jsonDecode(response.body);
          // Extract the Bitcoin price from the response and return it as a double
          double bitcoinPrice = data['rate'];
          return bitcoinPrice;
        } else {
          throw 'Failed to load Bitcoin price';
        }
      } catch (e) {
        throw 'Error: $e';
      }
    }
  }
