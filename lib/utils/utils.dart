const double defaultPadding = 18.0;
const double defaultRadius = 8.0;

bool isValEmpty(dynamic val) {
  String? value = val.toString();
  return (val == null || value.isEmpty || value == "null" || value == "" || value == "NULL");
}
