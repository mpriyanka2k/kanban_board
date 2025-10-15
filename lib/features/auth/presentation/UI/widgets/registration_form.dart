import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanbanboard/features/auth/presentation/UI/widgets/custom_text_field.dart';
import 'package:kanbanboard/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:kanbanboard/features/auth/presentation/bloc/auth_event.dart';
import 'package:kanbanboard/features/auth/presentation/bloc/auth_state.dart';
import 'package:kanbanboard/generated/l10n.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final TextEditingController confirmPassCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
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
            controller: emailCtrl,
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
            controller: passCtrl,
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
            controller: confirmPassCtrl,
            label: S.of(context).confirmPassword,
            icon: Icons.lock_outline,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).confirmPasswordValidation1;
              }
              if (value != passCtrl.text) {
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
                  onPressed:
                      isLoading ? null : () => _onRegisterPressed(context),
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
                  emailCtrl.clear();
                  passCtrl.clear();
                  confirmPassCtrl.clear();
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
    );
  }

  void _onRegisterPressed(BuildContext context) {
    if (registerFormKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            RegisterRequested(emailCtrl.text.trim(), passCtrl.text.trim()),
          );
    }
  }
}
