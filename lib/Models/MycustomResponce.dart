

class CustomResponce
{
  int statusCode;
  dynamic data;
  String message;
  String? errorMessage;
  bool errorStatus;

  CustomResponce({
    required this.statusCode,
    this.data,
    this.message ="",
    this.errorMessage,
    this.errorStatus = false,

});
}

