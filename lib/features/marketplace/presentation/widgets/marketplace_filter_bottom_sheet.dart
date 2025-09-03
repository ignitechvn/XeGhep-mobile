import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xe_ghep_app/features/marketplace/presentation/providers/marketplace_provider.dart';

class MarketplaceFilterBottomSheet extends ConsumerStatefulWidget {
  const MarketplaceFilterBottomSheet({super.key});

  @override
  ConsumerState<MarketplaceFilterBottomSheet> createState() => _MarketplaceFilterBottomSheetState();
}

class _MarketplaceFilterBottomSheetState extends ConsumerState<MarketplaceFilterBottomSheet> {
  double? _maxDistance;
  int? _maxSeats;
  double? _maxPrice;
  String? _sortBy;

  @override
  void initState() {
    super.initState();
    final currentFilter = ref.read(marketplaceFilterProvider);
    _maxDistance = currentFilter.maxDistance;
    _maxSeats = currentFilter.maxSeats;
    _maxPrice = currentFilter.maxPrice;
    _sortBy = currentFilter.sortBy;
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              const Text(
                'Bộ lọc',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: _clearFilters,
                child: const Text('Xóa bộ lọc'),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Distance filter
          _buildSectionTitle('Khoảng cách tối đa'),
          const SizedBox(height: 8),
          _buildDistanceFilter(),
          
          const SizedBox(height: 24),
          
          // Seats filter
          _buildSectionTitle('Số ghế tối đa'),
          const SizedBox(height: 8),
          _buildSeatsFilter(),
          
          const SizedBox(height: 24),
          
          // Price filter
          _buildSectionTitle('Giá tiền tối đa'),
          const SizedBox(height: 8),
          _buildPriceFilter(),
          
          const SizedBox(height: 24),
          
          // Sort by
          _buildSectionTitle('Sắp xếp theo'),
          const SizedBox(height: 8),
          _buildSortFilter(),
          
          const SizedBox(height: 32),
          
          // Apply button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _applyFilters,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Áp dụng bộ lọc',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildDistanceFilter() {
    return Column(
      children: [
        Slider(
          value: _maxDistance ?? 50.0,
          min: 5.0,
          max: 200.0,
          divisions: 39,
          label: '${(_maxDistance ?? 50.0).toStringAsFixed(0)} km',
          onChanged: (value) {
            setState(() {
              _maxDistance = value;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('5 km'),
            Text('${(_maxDistance ?? 50.0).toStringAsFixed(0)} km'),
            Text('200 km'),
          ],
        ),
      ],
    );
  }

  Widget _buildSeatsFilter() {
    return Row(
      children: [
        Expanded(
          child: _buildSeatChip('1', 1),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildSeatChip('2', 2),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildSeatChip('3', 3),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildSeatChip('Tất cả', null),
        ),
      ],
    );
  }

  Widget _buildSeatChip(String label, int? value) {
    final isSelected = _maxSeats == value;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _maxSeats = selected ? value : null;
        });
      },
    );
  }

  Widget _buildPriceFilter() {
    return Column(
      children: [
        Slider(
          value: _maxPrice ?? 500000.0,
          min: 50000.0,
          max: 1000000.0,
          divisions: 19,
          label: '${_formatPrice(_maxPrice ?? 500000.0)}',
          onChanged: (value) {
            setState(() {
              _maxPrice = value;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('50K'),
            Text(_formatPrice(_maxPrice ?? 500000.0)),
            Text('1M'),
          ],
        ),
      ],
    );
  }

  Widget _buildSortFilter() {
    final sortOptions = [
      {'label': 'Gần nhất', 'value': 'distance'},
      {'label': 'Giá tốt nhất', 'value': 'price'},
      {'label': 'Thời gian sớm nhất', 'value': 'time'},
      {'label': 'Đánh giá cao nhất', 'value': 'rating'},
    ];

    return Column(
      children: sortOptions.map((option) {
        final isSelected = _sortBy == option['value'];
        return RadioListTile<String>(
          title: Text(option['label']!),
          value: option['value']!,
          groupValue: _sortBy,
          onChanged: (value) {
            setState(() {
              _sortBy = value;
            });
          },
          contentPadding: EdgeInsets.zero,
        );
      }).toList(),
    );
  }

  String _formatPrice(double price) {
    if (price >= 1000000) {
      return '${(price / 1000000).toStringAsFixed(1)}M';
    } else if (price >= 1000) {
      return '${(price / 1000).toStringAsFixed(0)}K';
    } else {
      return price.toStringAsFixed(0);
    }
  }

  void _clearFilters() {
    setState(() {
      _maxDistance = null;
      _maxSeats = null;
      _maxPrice = null;
      _sortBy = null;
    });
  }

  void _applyFilters() {
    final filter = MarketplaceFilter(
      maxDistance: _maxDistance,
      maxSeats: _maxSeats,
      maxPrice: _maxPrice,
      sortBy: _sortBy,
    );

    ref.read(marketplaceFilterProvider.notifier).updateFilter(filter);
    ref.invalidate(availablePostsProvider);
    
    Navigator.of(context).pop();
  }
}
