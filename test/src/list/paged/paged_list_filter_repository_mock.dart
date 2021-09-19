import 'package:flutter_bloc_patterns/page.dart';
import 'package:flutter_bloc_patterns/paged_filter_list.dart';
import 'package:flutter_bloc_patterns/src/list/paged/paged_list_filter_repository.dart';

import 'paged_list_repository_mock.dart';

class InMemoryPagedListFilterRepository<T, F>
    implements PagedListFilterRepository<T, F> {
  final List<T> elements;

  InMemoryPagedListFilterRepository(this.elements);

  @override
  Future<List<T>> getAll(Page page) => getBy(page);

  @override
  Future<List<T>> getBy(Page page, [F? filter]) {
    final elementsMatchingFilter =
        elements.where((item) => item == filter).toList();
    return InMemoryPagedListRepository(elementsMatchingFilter).getAll(page);
  }
}

class FailingPagedListFilterRepository<T, F>
    implements PagedListFilterRepository<T, F> {
  final dynamic error;

  FailingPagedListFilterRepository(this.error);

  @override
  // ignore: throw_of_invalid_type
  Future<List<T>> getAll(Page page) => throw error;

  @override
  // ignore: throw_of_invalid_type
  Future<List<T>> getBy(Page page, [F? filter]) => throw error;
}
