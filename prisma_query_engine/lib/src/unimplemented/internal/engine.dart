import 'package:prisma_query_engine/src/shared/protocol.dart';

import '../../shared/shared.dart' as shared;

class Engine extends shared.Engine {
  @override
  Future<void> start() {
    throw UnimplementedError();
  }

  @override
  Future<void> stop() {
    throw UnimplementedError();
  }

  @override
  Future<GQLBatchResponse> batch(GQLBatchRequest payload) {
    throw UnimplementedError();
  }
  
  @override
  Future<GQLResponse> request(GQLRequest payload) {
    throw UnimplementedError();
  }
}