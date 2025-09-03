import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xe_ghep_app/data/models/detailed_address.dart';
import 'package:xe_ghep_app/features/marketplace/domain/entities/post_customer_request.dart';
import 'package:xe_ghep_app/features/marketplace/presentation/providers/marketplace_provider.dart';

class PostCustomerForm extends ConsumerStatefulWidget {
  const PostCustomerForm({super.key});

  @override
  ConsumerState<PostCustomerForm> createState() => _PostCustomerFormState();
}

class _PostCustomerFormState extends ConsumerState<PostCustomerForm> {
  final _formKey = GlobalKey<FormState>();
  
  // From location controllers
  final _fromStreetController = TextEditingController();
  final _fromWardController = TextEditingController();
  final _fromVillageController = TextEditingController();
  final _fromDistrictController = TextEditingController();
  final _fromCityController = TextEditingController();
  final _fromLandmarkController = TextEditingController();
  
  // To location controllers
  final _toStreetController = TextEditingController();
  final _toWardController = TextEditingController();
  final _toVillageController = TextEditingController();
  final _toDistrictController = TextEditingController();
  final _toCityController = TextEditingController();
  final _toLandmarkController = TextEditingController();
  
  final _seatsController = TextEditingController();
  final _priceController = TextEditingController();
  final _distanceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _vehicleTypeController = TextEditingController();
  final _licensePlateController = TextEditingController();

  DateTime _departureTime = DateTime.now().add(const Duration(hours: 1));
  DateTime? _departureTimeEnd;
  bool _isTimeRange = false;
  bool _isLoading = false;

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
    _vehicleTypeController.dispose();
    _licensePlateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                const Text(
                  'Chia sẻ khách hàng',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // From location section
            _buildLocationSection(
              'Điểm đón',
              Icons.my_location,
              Colors.green,
              _fromStreetController,
              _fromWardController,
              _fromVillageController,
              _fromDistrictController,
              _fromCityController,
              _fromLandmarkController,
            ),
            
            const SizedBox(height: 16),
            
            // To location section
            _buildLocationSection(
              'Điểm đến',
              Icons.location_on,
              Colors.red,
              _toStreetController,
              _toWardController,
              _toVillageController,
              _toDistrictController,
              _toCityController,
              _toLandmarkController,
            ),
            
            const SizedBox(height: 16),
            
            // Time type selection
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
                    contentPadding: EdgeInsets.zero,
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
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Departure time selection
            _buildTimeSelection(),
            
            const SizedBox(height: 16),
            
            // Seats and price row
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _seatsController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Số ghế',
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
                      labelText: 'Giá tiền (VNĐ)',
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
            
            const SizedBox(height: 16),
            
            // Distance
            TextFormField(
              controller: _distanceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Khoảng cách (km)',
                hintText: '120.5',
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
            
            const SizedBox(height: 16),
            
            // Vehicle info row
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _vehicleTypeController,
                    decoration: const InputDecoration(
                      labelText: 'Loại xe',
                      hintText: 'Xe 7 chỗ',
                      prefixIcon: Icon(Icons.directions_car),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _licensePlateController,
                    decoration: const InputDecoration(
                      labelText: 'Biển số',
                      hintText: '29A-12345',
                      prefixIcon: Icon(Icons.confirmation_number),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Description
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
            
            const SizedBox(height: 24),
            
            // Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _submitForm,
                style: ElevatedButton.styleFrom(
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
                        'Chia sẻ khách hàng',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
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
        ward: _fromWardController.text.trim().isEmpty ? null : _fromWardController.text.trim(),
        village: _fromVillageController.text.trim().isEmpty ? null : _fromVillageController.text.trim(),
        district: _fromDistrictController.text.trim(),
        city: _fromCityController.text.trim(),
        latitude: 0.0, // TODO: Get from GPS or map picker
        longitude: 0.0, // TODO: Get from GPS or map picker
        landmark: _fromLandmarkController.text.trim().isEmpty ? null : _fromLandmarkController.text.trim(),
      );

      final toLocation = DetailedAddress(
        street: _toStreetController.text.trim(),
        ward: _toWardController.text.trim().isEmpty ? null : _toWardController.text.trim(),
        village: _toVillageController.text.trim().isEmpty ? null : _toVillageController.text.trim(),
        district: _toDistrictController.text.trim(),
        city: _toCityController.text.trim(),
        latitude: 0.0, // TODO: Get from GPS or map picker
        longitude: 0.0, // TODO: Get from GPS or map picker
        landmark: _toLandmarkController.text.trim().isEmpty ? null : _toLandmarkController.text.trim(),
      );

      // Description is now just the driver's notes about the trip
      String description = _descriptionController.text.trim();

      final request = PostCustomerRequest(
        fromLocation: fromLocation,
        toLocation: toLocation,
        departureTime: _departureTime,
        seatsNeeded: int.parse(_seatsController.text),
        price: double.parse(_priceController.text),
        distance: double.parse(_distanceController.text),
        description: description.isEmpty ? null : description,
        vehicleType: _vehicleTypeController.text.trim().isEmpty
            ? null
            : _vehicleTypeController.text.trim(),
        licensePlate: _licensePlateController.text.trim().isEmpty
            ? null
            : _licensePlateController.text.trim(),
      );

      await ref.read(postCustomerProvider.notifier).postCustomer(request);

      if (mounted) {
        Navigator.of(context).pop();
        ref.invalidate(myPostsProvider);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Chia sẻ khách hàng thành công!'),
            backgroundColor: Colors.green,
          ),
        );
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
    Color color,
    TextEditingController streetController,
    TextEditingController wardController,
    TextEditingController villageController,
    TextEditingController districtController,
    TextEditingController cityController,
    TextEditingController landmarkController,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
        color: color.withOpacity(0.05),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Street
          TextFormField(
            controller: streetController,
            decoration: const InputDecoration(
              labelText: 'Số nhà, tên đường *',
              hintText: '123 Phố Huế',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập số nhà, tên đường';
              }
              return null;
            },
          ),
          
          const SizedBox(height: 12),
          
          // Ward and Village row
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: wardController,
                  decoration: const InputDecoration(
                    labelText: 'Phường/Xã',
                    hintText: 'Phường Phố Huế',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: villageController,
                  decoration: const InputDecoration(
                    labelText: 'Thôn/Khu phố',
                    hintText: 'Khu phố 1',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // District and City row
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: districtController,
                  decoration: const InputDecoration(
                    labelText: 'Quận/Huyện *',
                    hintText: 'Quận Hai Bà Trưng',
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
          
          const SizedBox(height: 12),
          
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
    );
  }
}
