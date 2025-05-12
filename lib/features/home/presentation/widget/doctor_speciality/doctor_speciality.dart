import 'package:docdoc/core/helpers/app_assets.dart';
import 'package:docdoc/features/home/logic/cubit/home_cubit.dart';
import 'package:docdoc/features/home/logic/cubit/home_state.dart';
import 'package:docdoc/features/home/presentation/widget/doctor_speciality/doctor_speciality_list_shimmer_loading.dart';
import 'package:docdoc/features/home/presentation/widget/doctor_speciality/doctor_speciality_list_view_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpeciality extends StatefulWidget {
  const DoctorSpeciality({
    super.key,
  });

  @override
  State<DoctorSpeciality> createState() => _DoctorSpecialityState();
}

class _DoctorSpecialityState extends State<DoctorSpeciality> {
  List<String> images = [
    AppAssets().generalPractitioner,
    AppAssets().neurologic,
    AppAssets().pediatric,
    AppAssets().radiology,
  ];

  @override
  Widget build(ext) {
    return SizedBox(
      height: 86.h,
      width: double.infinity,
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeFaiture) {
            showError(context, error: state.error.error.toString());
          }
        },
        buildWhen: (previous, current) =>
            current is HomeLoading ||
            current is HomeSuccess ||
            current is HomeFaiture,
        builder: (context, state) {
          if (state is HomeSuccess) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.listDoctorSpeciality.length,
                itemBuilder: (contextt, index) {
                  return GestureDetector(
                      onTap: () {
                        context.read<HomeCubit>().getDoctors(
                            name: state.listDoctorSpeciality[index]);
                      },
                      child: DoctorSpecialityListViewItem(
                        image: images[index],
                        speciality: state.listDoctorSpeciality[index],
                      ));
                });
          } else {
            return DoctorSpecialityListShimmerLoading(
              image: images,
            );
          }
        },
      ),
    );
  }
}

Future<void> showError(BuildContext context, {required String error}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titlePadding: const EdgeInsets.only(top: 24),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      actionsPadding: const EdgeInsets.only(bottom: 12, right: 12),
      title: Center(
        child: Icon(
          Icons.error_outline,
          color: Colors.redAccent,
          size: 48,
        ),
      ),
      content: Text(
        error,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, color: Colors.black87),
      ),
      actions: [
        Center(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ),
      ],
    ),
  );
}
