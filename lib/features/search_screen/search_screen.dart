import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/widget/app_back_button.dart';
import 'package:docdoc/core/widget/app_text_form_button.dart';
import 'package:docdoc/features/search_screen/logic/cubit/search_cubit.dart';
import 'package:docdoc/features/search_screen/logic/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    context.read<SearchCubit>().search();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 25.h, left: 15.w, right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBackButton(),
              verticalSpace(50),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchSuccess) {
                    return Expanded(
                        child: ListView.builder(
                      itemCount: state.listDoctors.length,
                      itemBuilder: (context, index) {
                        final doctor = state.listDoctors[index];

                        return Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 8.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r)),
                          elevation: 3,
                          child: ListTile(
                            contentPadding: EdgeInsets.all(12.w),
                            leading: CircleAvatar(
                              radius: 30.r,
                              backgroundImage: NetworkImage(doctor.image ?? ''),
                            ),
                            title: Text(
                              doctor.name ?? 'اسم غير متوفر',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              doctor.specialty ?? 'التخصص غير متوفر',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            onTap: () {
                              // يمكن إضافة التنقل إلى صفحة تفاصيل الدكتور
                            },
                          ),
                        );
                      },
                    ));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
