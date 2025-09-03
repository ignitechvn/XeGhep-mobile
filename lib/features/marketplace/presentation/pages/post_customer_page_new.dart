import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xe_ghep_app/data/models/detailed_address.dart';
import 'package:xe_ghep_app/features/marketplace/domain/entities/post_customer_request.dart';
import 'package:xe_ghep_app/features/marketplace/presentation/providers/marketplace_provider.dart';

class PostCustomerPageNew extends ConsumerStatefulWidget {
  const PostCustomerPageNew({super.key});

  @override
  ConsumerState<PostCustomerPageNew> createState() => _PostCustomerPageNewState();
}

class _PostCustomerPageNewState extends ConsumerState<PostCustomerPageNew> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isTimeRange = false;
  DateTime _departureTime = DateTime.now().add(const Duration(hours: 1));
  DateTime? _departureTimeEnd;

  // Controllers for detailed addresses
  final _fromStreetController = TextEditingController();
  final _fromWardController = TextEditingController();
  final _fromVillageController = TextEditingController();
  final _fromDistrictController = TextEditingController();
  final _fromCityController = TextEditingController();
  final _fromLandmarkController = TextEditingController();

  final _toStreetController = TextEditingController();
  final _toWardController = TextEditingController();
  final _toVillageController = TextEditingController();
  final _toDistrictController = TextEditingController();
  final _toCityController = TextEditingController();
  final _toLandmarkController = TextEditingController();

  // Other controllers
  final _seatsController = TextEditingController();
  final _priceController = TextEditingController();
  final _distanceController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _fromStreetController.dispose();
    _fromWardController.dispose();
    _fromVillageController.dispose();
    _fromDistrictController.dispose();
    _fromCityController.dispose();
    _fromLandmarkController.dispose();
    _toStreetController.dispose();
    _toWardController.dispose();
    _toVillageController.dispose();
    _toDistrictController.dispose();
    _toCityController.dispose();
    _toLandmarkController.dispose();
    _seatsController.dispose();
    _priceController.dispose();
    _distanceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng khách'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: _isLoading ? null : _submitForm,
            icon: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Icon(Icons.check),
            tooltip: 'Đăng chuyến',
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Time selection type
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Loại thời gian',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<bool>(
                              title: const Text('Thời gian cụ thể'),
                              value: false,
                              groupValue: _isTimeRange,
                              onChanged: (value) {
                                setState(() {
                                  _isTimeRange = value!;
                                  if (!_isTimeRange) {
                                    _departureTimeEnd = null;
                                  }
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<bool>(
                              title: const Text('Khoảng thời gian'),
                              value: true,
                              groupValue: _isTimeRange,
                              onChanged: (value) {
                                setState(() {
                                  _isTimeRange = value!;
                                  if (_isTimeRange) {
                                    _departureTimeEnd = _departureTime.add(const Duration(hours: 2));
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Time selection
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Thời gian khởi hành',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildTimeSelection(),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Trip details
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Thông tin chuyến đi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _seatsController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Số ghế cần *',
                                hintText: '1-3',
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nhập số ghế';
                                }
                                final seats = int.tryParse(value);
                                if (seats == null || seats < 1 || seats > 3) {
                                  return 'Số ghế từ 1-3';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _priceController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Giá tiền (VNĐ) *',
                                hintText: '100000',
                                prefixIcon: Icon(Icons.attach_money),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nhập giá tiền';
                                }
                                final price = double.tryParse(value);
                                if (price == null || price <= 0) {
                                  return 'Giá tiền không hợp lệ';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _distanceController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Khoảng cách (km) *',
                          hintText: '15.5',
                          prefixIcon: Icon(Icons.straighten),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập khoảng cách';
                          }
                          final distance = double.tryParse(value);
                          if (distance == null || distance <= 0) {
                            return 'Khoảng cách không hợp lệ';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // From location
              _buildLocationSection(
                'Điểm đón',
                Icons.location_on,
                null,
                _fromStreetController,
                _fromWardController,
                _fromVillageController,
                _fromDistrictController,
                _fromCityController,
                _fromLandmarkController,
              ),

              const SizedBox(height: 12),

              // To location
              _buildLocationSection(
                'Điểm đến',
                Icons.location_on,
                null,
                _toStreetController,
                _toWardController,
                _toVillageController,
                _toDistrictController,
                _toCityController,
                _toLandmarkController,
              ),

              const SizedBox(height: 12),

              // Description
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ghi chú của bạn',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _descriptionController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Ghi chú về chuyến đi (tùy chọn)',
                          hintText: 'Ví dụ: Khách hàng có 2 vali lớn, cần xe rộng. Có thể đón thêm khách trên đường...',
                          prefixIcon: Icon(Icons.note_alt),
                          border: OutlineInputBorder(),
                          helperText: 'Ghi chú này sẽ giúp tài xế khác hiểu rõ hơn về chuyến đi',
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text(
                          'Đăng chuyến',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSelection() {
    if (_isTimeRange) {
      return Column(
        children: [
          // Start time
          InkWell(
            onTap: () => _selectTime(_departureTime, (time) {
              setState(() {
                _departureTime = time;
                if (_departureTimeEnd != null && _departureTimeEnd!.isBefore(_departureTime)) {
                  _departureTimeEnd = _departureTime.add(const Duration(hours: 2));
                }
              });
            }),
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Thời gian bắt đầu',
                prefixIcon: Icon(Icons.access_time),
                border: OutlineInputBorder(),
              ),
              child: Text(
                '${_departureTime.day}/${_departureTime.month}/${_departureTime.year} ${_departureTime.hour.toString().padLeft(2, '0')}:${_departureTime.minute.toString().padLeft(2, '0')}',
              ),
            ),
          ),
          
          const SizedBox(height: 12),
          
          // End time
          InkWell(
            onTap: () => _selectTime(_departureTimeEnd ?? _departureTime.add(const Duration(hours: 2)), (time) {
              setState(() {
                _departureTimeEnd = time;
              });
            }),
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Thời gian kết thúc',
                prefixIcon: Icon(Icons.access_time_filled),
                border: OutlineInputBorder(),
              ),
              child: Text(
                _departureTimeEnd != null
                    ? '${_departureTimeEnd!.day}/${_departureTimeEnd!.month}/${_departureTimeEnd!.year} ${_departureTimeEnd!.hour.toString().padLeft(2, '0')}:${_departureTimeEnd!.minute.toString().padLeft(2, '0')}'
                    : 'Chọn thời gian kết thúc',
              ),
            ),
          ),
        ],
      );
    } else {
      return InkWell(
        onTap: () => _selectTime(_departureTime, (time) {
          setState(() {
            _departureTime = time;
          });
        }),
        child: InputDecorator(
          decoration: const InputDecoration(
            labelText: 'Thời gian khởi hành',
            prefixIcon: Icon(Icons.access_time),
            border: OutlineInputBorder(),
          ),
          child: Text(
            '${_departureTime.day}/${_departureTime.month}/${_departureTime.year} ${_departureTime.hour.toString().padLeft(2, '0')}:${_departureTime.minute.toString().padLeft(2, '0')}',
          ),
        ),
      );
    }
  }

  Future<void> _selectTime(DateTime initialTime, Function(DateTime) onTimeSelected) async {
    final date = await showDatePicker(
      context: context,
      initialDate: initialTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );

    if (date != null && mounted) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialTime),
      );

      if (time != null) {
        final selectedDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
        onTimeSelected(selectedDateTime);
      }
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final fromLocation = DetailedAddress(
        street: _fromStreetController.text.trim(),
        ward: _fromWardController.text.trim(),
        village: _fromVillageController.text.trim(),
        district: _fromDistrictController.text.trim(),
        city: _fromCityController.text.trim(),
        latitude: 21.0285, // Default latitude for Hanoi
        longitude: 105.8542, // Default longitude for Hanoi
        landmark: _fromLandmarkController.text.trim(),
      );

      final toLocation = DetailedAddress(
        street: _toStreetController.text.trim(),
        ward: _toWardController.text.trim(),
        village: _toVillageController.text.trim(),
        district: _toDistrictController.text.trim(),
        city: _toCityController.text.trim(),
        latitude: 21.0285, // Default latitude for Hanoi
        longitude: 105.8542, // Default longitude for Hanoi
        landmark: _toLandmarkController.text.trim(),
      );

      final request = PostCustomerRequest(
        fromLocation: fromLocation,
        toLocation: toLocation,
        departureTime: _departureTime,
        seatsNeeded: int.parse(_seatsController.text),
        price: double.parse(_priceController.text),
        distance: double.parse(_distanceController.text),
        description: _descriptionController.text.trim(),
      );

      await ref.read(postCustomerProvider.notifier).postCustomer(request);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đăng chuyến thành công!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Widget _buildLocationSection(
    String title,
    IconData icon,
    Color? color,
    TextEditingController streetController,
    TextEditingController wardController,
    TextEditingController villageController,
    TextEditingController districtController,
    TextEditingController cityController,
    TextEditingController landmarkController,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color ?? Colors.grey[600], size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: color ?? Colors.grey[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            // Street
            TextFormField(
              controller: streetController,
              decoration: const InputDecoration(
                labelText: 'Số nhà, tên đường *',
                hintText: '123 Phố Huế',
                prefixIcon: Icon(Icons.home),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập số nhà, tên đường';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            
            // Ward and Village
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: wardController,
                    decoration: const InputDecoration(
                      labelText: 'Phường/Xã *',
                      hintText: 'Phường Phố Huế',
                      prefixIcon: Icon(Icons.location_city),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập phường/xã';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: villageController,
                    decoration: const InputDecoration(
                      labelText: 'Thôn/Xóm',
                      hintText: 'Thôn 1',
                      prefixIcon: Icon(Icons.place),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            
            // District and City
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: districtController,
                    decoration: const InputDecoration(
                      labelText: 'Quận/Huyện *',
                      hintText: 'Quận Hoàn Kiếm',
                      prefixIcon: Icon(Icons.location_city),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập quận/huyện';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: cityController,
                    decoration: const InputDecoration(
                      labelText: 'Thành phố/Tỉnh *',
                      hintText: 'Hà Nội',
                      prefixIcon: Icon(Icons.location_city),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập thành phố/tỉnh';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            
            // Landmark
            TextFormField(
              controller: landmarkController,
              decoration: const InputDecoration(
                labelText: 'Địa danh gần đó (tùy chọn)',
                hintText: 'Gần chợ Đồng Xuân',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
