import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/features/home/data/model/doctors_response_model.dart';
import 'package:docdoc/features/home/logic/cubit/home_cubit.dart';
import 'package:docdoc/features/home/logic/cubit/home_state.dart';
import 'package:docdoc/features/home/presentation/widget/recommendation_doctor/recommendation_list_shimmer_loading.dart';
import 'package:docdoc/features/home/presentation/widget/recommendation_doctor/recommendation_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendarionListView extends StatefulWidget {
  const RecommendarionListView({super.key});

  @override
  State<RecommendarionListView> createState() => _RecommendarionListViewState();
}

class _RecommendarionListViewState extends State<RecommendarionListView> {
  List<Doctor> listDoctor = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is HomeRecommendationDoctorFailure ||
            current is HomeRecommendationDoctorLoading ||
            current is HomeRecommendationDoctorSuccess,
        builder: (context, state) {
          if (state is HomeRecommendationDoctorSuccess) {
            listDoctor = state.listRecommendation;
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.listRecommendation.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.doctorDetail,
                            arguments: state.listRecommendation[index]);
                      },
                      child: RecommendationListViewItem(
                          doctorsModel: state.listRecommendation[index]));
                });
          } else {
            return RecommendationListShimmerLoading(
              doctorsList: listDoctor,
            );
          }
        });
  }
}
