import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/custom_text_field.dart';
import '../../../../shared/widgets/loading_button.dart';
import '../../../../shared/widgets/app_logo.dart';
import '../providers/auth_provider.dart';

class RegisterKycPage extends ConsumerStatefulWidget {
  final String phoneNumber;
  final String password;
  final String fullName;
  final String email;
  final String otp;

  const RegisterKycPage({
    super.key,
    required this.phoneNumber,
    required this.password,
    required this.fullName,
    required this.email,
    required this.otp,
  });

  @override
  ConsumerState<RegisterKycPage> createState() => _RegisterKycPageState();
}

class _RegisterKycPageState extends ConsumerState<RegisterKycPage> {
  final _formKey = GlobalKey<FormState>();
  final _idNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _licenseNumberController = TextEditingController();
  final _vehicleNumberController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _idNumberController.dispose();
    _addressController.dispose();
    _licenseNumberController.dispose();
    _vehicleNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoàn thiện hồ sơ'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                
                // Header
                Column(
                  children: [
                    const AppLogo(
                      width: 80,
                      height: 80,
                      borderRadius: 15,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Hoàn thiện hồ sơ',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Cung cấp thông tin để hoàn tất đăng ký tài khoản',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                
                const SizedBox(height: 32),
                
                // ID Number Input
                CustomTextField(
                  controller: _idNumberController,
                  label: 'Số CMND/CCCD',
                  hint: 'Nhập số CMND hoặc CCCD',
                  keyboardType: TextInputType.number,
                  prefixIcon: Icons.credit_card,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập số CMND/CCCD';
                    }
                    if (value.length < 9 || value.length > 12) {
                      return 'Số CMND/CCCD không hợp lệ';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 16),
                
                // Address Input
                CustomTextField(
                  controller: _addressController,
                  label: 'Địa chỉ',
                  hint: 'Nhập địa chỉ thường trú',
                  prefixIcon: Icons.location_on,
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập địa chỉ';
                    }
                    if (value.length < 10) {
                      return 'Địa chỉ phải có ít nhất 10 ký tự';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 16),
                
                // License Number Input
                CustomTextField(
                  controller: _licenseNumberController,
                  label: 'Số bằng lái xe',
                  hint: 'Nhập số bằng lái xe',
                  prefixIcon: Icons.drive_eta,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập số bằng lái xe';
                    }
                    if (value.length < 8) {
                      return 'Số bằng lái xe không hợp lệ';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 16),
                
                // Vehicle Number Input
                CustomTextField(
                  controller: _vehicleNumberController,
                  label: 'Biển số xe',
                  hint: 'Nhập biển số xe (nếu có)',
                  prefixIcon: Icons.local_taxi,
                  validator: (value) {
                    if (value != null && value.isNotEmpty && value.length < 5) {
                      return 'Biển số xe không hợp lệ';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 24),
                
                // Upload Documents Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tải lên tài liệu',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildUploadItem('CMND/CCCD mặt trước', Icons.upload_file),
                      const SizedBox(height: 8),
                      _buildUploadItem('CMND/CCCD mặt sau', Icons.upload_file),
                      const SizedBox(height: 8),
                      _buildUploadItem('Bằng lái xe', Icons.upload_file),
                      const SizedBox(height: 8),
                      _buildUploadItem('Giấy đăng ký xe (nếu có)', Icons.upload_file),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Complete Registration Button
                LoadingButton(
                  onPressed: _isLoading ? null : _handleCompleteRegistration,
                  isLoading: _isLoading,
                  child: const Text('Hoàn tất đăng ký'),
                ),
                
                const SizedBox(height: 24),
                
                // Note
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue[200]!),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.blue[600],
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Thông tin của bạn sẽ được xác thực trong vòng 24h. Bạn có thể sử dụng ứng dụng ngay sau khi đăng ký.',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.blue[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUploadItem(String title, IconData icon) {
    return InkWell(
      onTap: () {
        // TODO: Implement file upload
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tính năng tải lên $title đang phát triển')),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey[600],
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[700],
                ),
              ),
            ),
            Icon(
              Icons.add_circle_outline,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _handleCompleteRegistration() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      
      // TODO: Implement complete registration API
      // For now, simulate API call
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _isLoading = false;
        });
        
        // Navigate to success page
        context.push('/register-success', extra: {
          'phoneNumber': widget.phoneNumber,
          'fullName': widget.fullName,
        });
      });
    }
  }
}
