caseSearch(String judul) {
  List<String> caseSearch = [];
  String temp = "";
  for (var i = 0; i < judul.length; i++) {
    if (judul[i] == " ") {
      temp = "";
    } else {
      temp = temp + judul[i];
      caseSearch.add(temp);
    }
  }
  return caseSearch;
}