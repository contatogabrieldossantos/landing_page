import 'package:landing_app/app/repositories/data_repository.dart';

class DataService {

  final _dataRepository = DataRepository();

  Future<Map?> fetchData() async { 

    try {
      return await _dataRepository.fetchData();
    } catch (e) {
      rethrow;
    }

  }

}