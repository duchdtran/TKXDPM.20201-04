/// The EcobikeRentalException wraps all unchecked exceptions You can use this
/// exception to inform
///
/// @author duchdtran
class EcobikeRentalException implements Exception {
  EcobikeRentalException([this._message]);

  final _message;

  @override
  String toString(){
    return _message;
  }
}