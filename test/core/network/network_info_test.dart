import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:my_shop/core/network/network_info.dart';

class MockDataConnectioChecker extends Mock implements DataConnectionChecker {}

void main() {
  NetworkInfoImpl networkInfo;
  MockDataConnectioChecker mockDataConnectioChecker;

  setUp(() {
    mockDataConnectioChecker = MockDataConnectioChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectioChecker);
  });

  group('NetworkInfoImpl isConnected =>', () {
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
      () async {
        //arrange
        final tHasConnectionFuture = Future.value(true);
        when(mockDataConnectioChecker.hasConnection)
            .thenAnswer((_) => tHasConnectionFuture);
        //act
        final result = networkInfo.isConnected;
        //assert
        verify(mockDataConnectioChecker.hasConnection);
        expect(result, tHasConnectionFuture);
      },
    );
  });
}
