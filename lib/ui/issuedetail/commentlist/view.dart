import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:gitbbs/ui/issuedetail/commentlist/state.dart';

Widget buildView(
    CommentListState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  if (state.easyRefreshKey.currentState != null) {
    state.easyRefreshKey.currentState.callRefreshFinish();
  }
  return EasyRefresh(
    key: state.easyRefreshKey,
    child: ListView.builder(
      itemBuilder: adapter.itemBuilder,
      itemCount: adapter.itemCount,
    ),
    autoLoad: state.hasNext,
    refreshHeader: MaterialHeader(
      key: state.headerKey,
    ),
    refreshFooter: MaterialFooter(key: state.footerKey),
    autoControl: true,
    onRefresh: () {},
    loadMore: state.hasNext
        ? () {
            if (!state.hasNext) {
              return;
            }
          }
        : null,
  );
}
