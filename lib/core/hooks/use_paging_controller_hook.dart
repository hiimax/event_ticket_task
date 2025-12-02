// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';


// PagingController<int, T> usePagingController<T>(
//   Future<List<T>> Function(int) fetchPage, {
//   int firstPageKey = 1,
//   int pageSize = 20,
// }) {
//   final pagingController = useMemoized(
//     () => PagingController<int, T>(firstPageKey: firstPageKey),
//     [firstPageKey],
//   );

//   useEffect(() {
//     void pageRequestListener(int pageKey) {
//       fetchPage(pageKey).then(
//         (newItems) {
//           // Add null/empty list check
//           if (newItems.isEmpty) {
//             pagingController.appendLastPage([]);
//             return;
//           }

//           final isLastPage = newItems.length < pageSize;
//           if (isLastPage) {
//             pagingController.appendLastPage(newItems);
//           } else {
//             final nextPageKey = pageKey + 1;
//             pagingController.(newItems, nextPageKey);
//           }
//         },
//         onError: (error) => pagingController.error = error,
//       );
//     }

//     pagingController.addPageRequestListener(pageRequestListener);

//     return pagingController.dispose;
//   }, [pagingController]);

//   return pagingController;
// }
