class ResponseModel {
  bool _status;
  String _message;
  String _token;

  ResponseModel(this._status, this._message, this._token);

  String get message => _message;

  bool get isSuccess => _status;

  String get token => _token;
}
