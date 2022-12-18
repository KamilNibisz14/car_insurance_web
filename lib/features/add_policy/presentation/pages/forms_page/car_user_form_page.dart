import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_insurance/features/add_policy/presentation/bloc/add_policy_bloc.dart';
import 'package:car_insurance/features/add_policy/presentation/navigation_bloc/navigation_bloc.dart';

import '../../../domain/entities/navigation_data.dart';
import '../../widgets/bottom_navigation_form.dart';
import '../../widgets/top_bar_info.dart';
import '../forms/car_user_form.dart';

class CarUserFormPage extends StatelessWidget {
  static const String id = 'car_user_page';
  const CarUserFormPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: BlocListener<NavigationBloc, NavigationState>(
          listener: (context, state) {},
          child: GestureDetector(
            onTap: () {
              context.read<NavigationBloc>().add(EnableToGoNextPageEvent());
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        actions: [
          TopBarInfo(
            text: 'User',
            icon: Icons.person,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocListener<AddPolicyBloc, AddPolicyState>(
              listener: (context, state) {
              },

              child: const CarUserForm(),
            ),
            BottomNavigationForm(
              position: NavigationData.carUser,
            )
          ],
        ),
      ),
    );
  }
}
