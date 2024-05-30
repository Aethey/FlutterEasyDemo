import 'package:flutter_test/flutter_test.dart';
import 'package:select_one/service/api/dio_client.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('DioClient Tests', () {
    late DioClient dioClient;

    setUp(() {
      // init DioClient
      dioClient = DioClient();
      // set AppConfig.useLocalJson = true;
    });

    test('Should fetch data from local JSON when useLocalJson is true',
        () async {
      // route /test
      var response = await dioClient.get('/test');

      // check answer
      expect(response.data, isNotNull);
      expect(
          response.data['message'], 'This is a test message from local JSON');
    });
  });
}
