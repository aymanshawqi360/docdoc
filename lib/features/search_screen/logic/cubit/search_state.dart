import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:docdoc/features/search_screen/data/model/search_response_model.dart';

class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<ListDoctors> listDoctors;

  SearchSuccess({required this.listDoctors});
}

class SearchFailure extends SearchState {
  final ApiErrorModel errorModel;

  SearchFailure({required this.errorModel});
}
