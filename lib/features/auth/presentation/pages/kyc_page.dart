import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/custom_text_field.dart';
import '../../../../shared/widgets/loading_button.dart';
import '../../../../shared/widgets/app_logo.dart';
import '../providers/auth_provider.dart';

class KycPage extends ConsumerStatefulWidget {
  const KycPage({super.key});

  @override
  ConsumerState<KycPage> createState() => _KycPageState();
}

class _KycPageState extends ConsumerState<KycPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _licenseController = TextEditingController();
  final _plateController = TextEditingController();
  final _modelController = TextEditingController();
  final _colorController = TextEditingController();
  
  bool _isLoading = false;
  String _selectedVehicleType = '4_SEAT';

  @override
  void dispose() {
    _fullNameController.dispose();
    _licenseController.dispose();
    _plateController.dispose();
    _modelController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next is AuthLoading) {
        setState(() {
          _isLoading = true;
        });
      } else if (next is AuthError) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.message),
            backgroundColor: Colors.red,
          ),
        );
      } else if (next is AuthAuthenticated) {
        setState(() {
          _isLoading = false;
        });
        context.go('/home');
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Xác thực thông tin'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Column(
                  children: [
                    const AppLogoMedium(),
                    const SizedBox(height: 24),
                    Text(
                      'Hoàn thiện hồ sơ',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Vui lòng cung cấp thông tin để hoàn tất đăng ký',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                
                const SizedBox(height: 32),
                
                // Personal Information
                Text(
                  'Thông tin cá nhân',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                
                CustomTextField(
                  controller: _fullNameController,
                  label: 'Họ và tên',
                  hint: 'Nhập họ và tên đầy đủ',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập họ và tên';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 16),
                
                CustomTextField(
                  controller: _licenseController,
                  label: 'Số bằng lái xe',
                  hint: 'Nhập số bằng lái xe',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập số bằng lái xe';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 24),
                
                // Vehicle Information
                Text(
                  'Thông tin phương tiện',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Vehicle Type
                Text(
                  'Loại xe',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Xe 4 chỗ'),
                        value: '4_SEAT',
                        groupValue: _selectedVehicleType,
                        onChanged: (value) {
                          setState(() {
                            _selectedVehicleType = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Xe 7 chỗ'),
                        value: '7_SEAT',
                        groupValue: _selectedVehicleType,
                        onChanged: (value) {
                          setState(() {
                            _selectedVehicleType = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                CustomTextField(
                  controller: _plateController,
                  label: 'Biển số xe',
                  hint: 'Nhập biển số xe',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập biển số xe';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 16),
                
                CustomTextField(
                  controller: _modelController,
                  label: 'Dòng xe',
                  hint: 'Ví dụ: Vios, Innova, Xpander...',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập dòng xe';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 16),
                
                CustomTextField(
                  controller: _colorController,
                  label: 'Màu xe',
                  hint: 'Nhập màu xe',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập màu xe';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 32),
                
                // Submit Button
                LoadingButton(
                  onPressed: _isLoading ? null : _handleSubmit,
                  isLoading: _isLoading,
                  child: const Text('Hoàn tất đăng ký'),
                ),
                
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final kycData = {
        'full_name': _fullNameController.text.trim(),
        'license_number': _licenseController.text.trim(),
        'vehicle_type': _selectedVehicleType,
        'vehicle_plate': _plateController.text.trim(),
        'vehicle_model': _modelController.text.trim(),
        'vehicle_color': _colorController.text.trim(),
      };
      
      ref.read(authProvider.notifier).submitKyc(kycData);
    }
  }
}
