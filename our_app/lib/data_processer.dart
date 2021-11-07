import 'package:flutter/services.dart';
import 'package:our_app/data/CsvData.dart';

Future<List<CsvData>> getCsvData(String path) async {
  // 戻り値を生成
  List<CsvData> list = [];

  // csvデータを全て読み込む
  String csv = await rootBundle.loadString(path);

  // csvデータを1行ずつ処理する
  for (String line in csv.split("\r\n")) {
    // カンマ区切りで各列のデータを配列に格納
    List rows = line.split(','); // split by comma

    // csvデータを生成
    CsvData rowData = CsvData(
      id: int.parse(rows[0]),
      jap_section_1_score: rows[1],
      jap_section_2_score: rows[2],
      jap_section_3_score: rows[3],
      jap_section_4_score: rows[4],
      jap_total_score: rows[5],
      math_section_1_score: rows[6],
      math_section_2_score: rows[7],
      math_section_3_score: rows[8],
      math_section_4_score: rows[9],
      math_total_score: rows[10],
      eng_section_1_score: rows[11],
      eng_section_2_score: rows[12],
      eng_section_3_score: rows[13],
      eng_section_4_score: rows[14],
      eng_total_score: rows[15],
    );

    // csvデータをリストに格納
    list.add(rowData);
  }

  // リターン
  return list;
}

void main() {
  print('print me');
  String path = 'C:/Users/shunt/data_prosesser/our_app/assets/CsvData';
  print(getCsvData(path));
}
