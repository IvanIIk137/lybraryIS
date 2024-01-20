import 'package:flutter/material.dart';
import 'package:task_3/ui/widgets/common/spinner.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef FetchPage<T> = Future<List<T>> Function(int page, int limit);

class InfinityListView<T> extends StatelessWidget {
  final InfinityListViewController<T> controller;
  final ItemWidgetBuilder<T> itemBuilder;
  final String? notFoundLabel;
  final ScrollController? scrollController;

  InfinityListView({
    required this.controller,
    required this.itemBuilder,
    this.notFoundLabel,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, T>(
      pagingController: controller.controller,
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      scrollController: scrollController,
      builderDelegate: PagedChildBuilderDelegate<T>(
        firstPageProgressIndicatorBuilder: (ctx) => Spinner(),
        newPageProgressIndicatorBuilder: (ctx) => Padding(
          padding: EdgeInsets.all(20.sp),
          child: Spinner(size: 22.sp, lineWidth: 4.sp),
        ),
        noItemsFoundIndicatorBuilder: (ctx) => Center(
          child: Text(
            notFoundLabel ?? 'No elements',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
        ),
        itemBuilder: itemBuilder,
      ),
    );
  }
}

class InfinityListViewController<T> {
  final _controller = PagingController<int, T>(firstPageKey: 1);
  late int _pageSize;
  late FetchPage<T> _fetchPage;

  int get pageSize => _pageSize;

  PagingController<int, T> get controller => _controller;

  InfinityListViewController({
    required FetchPage<T> fetchPage,
    int pageSize = 20,
  }) {
    _fetchPage = fetchPage;
    _pageSize = pageSize;
    _controller.addPageRequestListener((pageKey) async {
      final res = await _fetchPage(pageKey, pageSize);
      _append(res, pageKey);
    });
  }

  void dispose() {
    _controller.dispose();
  }

  void _append(List<T> data, int page) {
    if (data.length < _pageSize) {
      _controller.appendLastPage(data);
    } else {
      _controller.appendPage(data, page + 1);
    }
  }
}
