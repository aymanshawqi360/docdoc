import 'package:bloc/bloc.dart';
import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/search_screen/data/model/search_response_model.dart';
import 'package:docdoc/features/search_screen/data/repo/search_repo.dart';
import 'package:docdoc/features/search_screen/logic/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  SearchCubit(this._searchRepo) : super(SearchInitial());

  search() async {
    emit(SearchLoading());
    final response = await _searchRepo.getSearch();
    if (response is Success<List<ListDoctors>>) {
      emit(SearchSuccess(listDoctors: response.data));
    } else if (response is Failure<List<ListDoctors>>) {
      emit(SearchFailure(
          errorModel: ApiErrorModel(error: response.error.error.toString())));
    }
  }
}
