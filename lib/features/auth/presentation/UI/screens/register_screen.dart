import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanbanboard/features/auth/presentation/UI/widgets/custom_text_field.dart';
import 'package:kanbanboard/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:kanbanboard/features/auth/presentation/bloc/auth_event.dart';
import 'package:kanbanboard/features/auth/presentation/bloc/auth_state.dart';
import 'package:kanbanboard/generated/l10n.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();

    void _onRegisterPressed(BuildContext context) {
      if (registerFormKey.currentState!.validate()) {
        authBloc.add(
          RegisterRequested(
            authBloc.emailCtrl.text.trim(),
            authBloc.passCtrl.text.trim(),
            context
          ),
        );
      }
    }

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (cxt, state) {
          if (state is RegistrationSuccessful) {
            context.read<AuthBloc>().add(LogoutRequested(context));
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
                    child: Form(
                      key: registerFormKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            S.of(context).createAccount,
                            style: TextStyle(
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800],
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            S.of(context).registerScreenMsg,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30.h),
                          CustomTextField(
                            controller: authBloc.emailCtrl,
                            label: S.of(context).email,
                            icon: Icons.email_outlined,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Please enter your email";
                              }
                              if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                                  .hasMatch(value.trim())) {
                                return "Enter a valid email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.h),
                         
                          CustomTextField(
                            controller: authBloc.passCtrl,
                            label: S.of(context).password,
                            icon: Icons.lock_outline,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).passwordValidation1;
                              }
                              if (value.length < 6) {
                                return S.of(context).passwordValidation2;
                              }
                              return null;
                            },
                          ),


                          SizedBox(height: 20.h),

                          // Confirm Password Field
                          CustomTextField(
                            controller: authBloc.confirmPassCtrl,
                            label: S.of(context).confirmPassword,
                            icon: Icons.lock_outline,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).confirmPasswordValidation1;
                              }
                              if (value != authBloc.passCtrl.text) {
                                return S.of(context).confirmPasswordValidation2;
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 30.h),

                          // Register Button
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              final isLoading = state is RegistrationLoading;
                              return SizedBox(
                                width: double.infinity,
                                height: 48.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    elevation: 3,
                                  ),
                                  onPressed: isLoading ? null : () => _onRegisterPressed(context),
                                  child: isLoading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 3,
                                        )
                                      : Text(
                                          S.of(context).register,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                ),
                              );
                            },
                          ),

                          SizedBox(height: 20.h),

                          // Back to Login
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).accountPresent,
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              TextButton(
                                onPressed: () {
                                  authBloc.emailCtrl.clear();
                                  authBloc.passCtrl.clear();
                                  authBloc.confirmPassCtrl.clear();
                                  context.pop();
                                },
                                child: Text(
                                  S.of(context).login,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[800],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
