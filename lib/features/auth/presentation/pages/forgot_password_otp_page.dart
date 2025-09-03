import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/custom_text_field.dart';
import '../../../../shared/widgets/loading_button.dart';
import '../../../../shared/widgets/app_logo.dart';
import '../providers/auth_provider.dart';

class ForgotPasswordOtpPage extends ConsumerStatefulWidget {
  final String phoneNumber;
  final String type;

  const ForgotPasswordOtpPage({
    super.key,
    required this.phoneNumber,
    required this.type,
  });

  @override
  ConsumerState<ForgotPasswordOtpPage> createState() => _ForgotPasswordOtpPageState();
}

class _ForgotPasswordOtpPageState extends ConsumerState<ForgotPasswordOtpPage> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  bool _isLoading = false;
  int _countdown = 60;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          if (_countdown > 0) {
            _countdown--;
            _startCountdown();
          } else {
            _canResend = true;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xác thực OTP'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                
                // Logo and Title
                Column(
                  children: [
                    const AppLogo(
                      width: 100,
                      height: 100,
                      borderRadius: 20,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Nhập mã xác thực',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Chúng tôi đã gửi mã xác thực đến số',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.phoneNumber,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 48),
                
                // OTP Input
                CustomTextField(
                  controller: _otpController,
                  label: 'Mã xác thực',
                  hint: 'Nhập 6 chữ số',
                  keyboardType: TextInputType.number,
                  prefixIcon: Icons.security,
                  maxLength: 6,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã xác thực';
                    }
                    if (value.length != 6) {
                      return 'Mã xác thực phải có 6 chữ số';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 24),
                
                // Verify Button
                LoadingButton(
                  onPressed: _isLoading ? null : _handleVerifyOtp,
                  isLoading: _isLoading,
                  child: const Text('Xác thực'),
                ),
                
                const SizedBox(height: 24),
                
                // Resend OTP
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Không nhận được mã? ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    if (_canResend)
                      TextButton(
                        onPressed: _handleResendOtp,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Gửi lại',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    else
                      Text(
                        'Gửi lại sau ${_countdown}s',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[500],
                        ),
                      ),
                  ],
                ),
                
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleVerifyOtp() {
    if (_formKey.currentState!.validate()) {
      final otp = _otpController.text.trim();
      
      setState(() {
        _isLoading = true;
      });
      
      // TODO: Implement verify OTP for forgot password
      // For now, simulate API call
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
        
        // Navigate to reset password page
        context.push('/reset-password', extra: {
          'phoneNumber': widget.phoneNumber,
          'otp': otp,
        });
      });
    }
  }

  void _handleResendOtp() {
    setState(() {
      _canResend = false;
      _countdown = 60;
    });
    _startCountdown();
    
    // TODO: Implement resend OTP
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã gửi lại mã xác thực')),
    );
  }
}
