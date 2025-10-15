import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanbanboard/features/auth/presentation/UI/widgets/registration_form.dart';
import 'package:kanbanboard/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:kanbanboard/features/auth/presentation/bloc/auth_event.dart';
import 'package:kanbanboard/features/auth/presentation/bloc/auth_state.dart';
import 'package:kanbanboard/generated/l10n.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});



  @override
  Widget build(BuildContext context) {
    



    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (cxt, state) {
          if (state is RegistrationSuccessful) {
            context.read<AuthBloc>().add(LogoutRequested());
            context.go('/login');
            ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  S.of(context).registrationSuccessful,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
        
          } else if (state is RegistrationError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0072FF), Color(0xFF00C6FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.black26,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: 

                   RegistrationForm()
                  
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
