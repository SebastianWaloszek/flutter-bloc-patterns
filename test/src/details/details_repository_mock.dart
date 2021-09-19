import 'package:flutter_bloc_patterns/src/details/details_repository.dart';

const _delay = Duration.zero;

class InMemoryDetailsRepository<T, I> extends DetailsRepository<T, I> {
  final Map<I, T?> elements;

  InMemoryDetailsRepository([this.elements = const {}]);

  @override
  Future<T?> getById(I id) => Future.delayed(_delay, () => elements[id]);
}

class FailingDetailsRepository<T, I> extends DetailsRepository<T, I> {
  final dynamic error;

  FailingDetailsRepository(this.error);

  @override
  Future<T> getById(I id) async => Future.delayed(
        _delay,
        // ignore: throw_of_invalid_type
        () => throw error,
      );
}
