import 'dart:async';

import 'package:flutter/material.dart';

class FMTableView<T> extends StatefulWidget {

  // 每组对应 行数
  final int Function(BuildContext context, int section) numberOfRowsInSection;

  // builder 函数
  final Widget Function(BuildContext context, FMIndexPath indexPath) itemForRowAtIndexPath;

  // 组数
  final int Function(BuildContext context) numberOfSections;

  // Header Builder 函数
  final Widget Function(BuildContext context, int section) widgetForHeaderInSection;

  // item 高度
  final double Function(BuildContext context, FMIndexPath indexPath) heightForRowAtIndexPath;

  // section 高度
  final double Function(BuildContext context, int section) heightForHeaderInSection;

  // 是否需要 hover
  final bool needHover;

  // Hover Header Builder 函数
  final Widget Function(BuildContext context, int section) widgetForHoverHeader;

  // Hover Header Height
  final double Function(BuildContext context, int section) heightForHoverHeaderInSection;


  const FMTableView({
    Key key,
    this.numberOfSections,
    this.numberOfRowsInSection,
    this.itemForRowAtIndexPath,
    this.heightForRowAtIndexPath,
    this.widgetForHeaderInSection,
    this.heightForHeaderInSection,
    this.widgetForHoverHeader,
    this.heightForHoverHeaderInSection,
    this.needHover = true,
  }) : super(key: key);

  @override
  FMTableViewState createState() => FMTableViewState();
}

class FMTableViewState<T> extends State <FMTableView<T>> {
  FMDataSource _items = FMDataSource();

  ScrollController _controller = ScrollController();

  StreamController<double> _streamController = StreamController<double>();
  double _offsetY = 0.0;
  int _section = 0;

  double _hoverHeaderHeight = 30;


  @override
  void initState() {
    // TODO: implement initState
    _configDataSource();
    _configScrollController();

    super.initState();
  }

  @override
  void dispose(){
    _controller?.dispose();
    _streamController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ListView listView = ListView.builder(
      itemCount: _items.count,
      itemBuilder: (context, index){
        FMRowModel rowModel = _items.rowModelWithIndex(index);

        // 创建 Header
        if(rowModel.indexPath.row == -1) {
          return _buildHeader(context, rowModel.indexPath.section);
        }
        // 创建 Item
        return _buildItem(context, rowModel.indexPath);
      },
      controller: _controller,
    );

    Widget hoverHeader = widget.needHover ? StreamBuilder<double>(
      stream: _streamController.stream,
      initialData: _offsetY,
      builder: (context, snapshot){
        return _builderHoverHeader(context);
      },
    ) : null;


    return Stack(
      children: [
        listView,
        hoverHeader,
      ],
    );
  }

  // 创建 Header
  Container _buildHeader(context, int section){
    return Container(
      height: widget.heightForHeaderInSection == null ? 30 : widget.heightForHeaderInSection(context, section),
      child: widget.widgetForHeaderInSection == null ? null : widget.widgetForHeaderInSection(context, section),
    );
  }

  // 创建 Item
  Container _buildItem(context, FMIndexPath indexPath){
    return Container(
      height: widget.heightForRowAtIndexPath == null ? 44 : widget.heightForRowAtIndexPath(context, indexPath),
      child: widget.itemForRowAtIndexPath(context, indexPath),
    );
  }

  // 创建悬停 Header
  Widget _builderHoverHeader(context){
    // 顶部下拉不展示悬浮
    if (_offsetY < 0) { return Container(); }

    // 获取悬浮 Header
    Widget header = widget.widgetForHoverHeader == null ? null : widget.widgetForHoverHeader(context, _section);
    if (header == null) {
      header = widget.widgetForHeaderInSection == null ? null : widget.widgetForHeaderInSection(context, _section);
    }
    if (header == null) { return Container(); }

    // 获取悬浮 Header 高度
    double height = widget.heightForHoverHeaderInSection == null ? 0 : widget.heightForHoverHeaderInSection(context, _section);
    if (height == 0) {
      height = widget.heightForHeaderInSection == null ? 0 : widget.heightForHeaderInSection(context, _section);
    }

    // 计算偏移量，展示当前 section
    double offset = 0;
    for (int section = 0; section < _items.sections.length; section++){
      FMSectionModel sectionModel = _items.sections[section];
      if (_offsetY >= sectionModel.start && _offsetY <= sectionModel.end) {
        _section = sectionModel.section;
        // 根据偏移量计算，当 Header 替换的阶段做一个上推的动效
        double topOffset = sectionModel.end - _offsetY;
        if (topOffset >= 0 && topOffset <= height){
          offset = topOffset - height;
        }
      }
    }

    /*
    * top 根据计算展示是否需要动效
    * height 设置了 heightForHoverHeaderInSection，则使用 heightForHoverHeaderInSection，否则使用 heightForHeaderInSection，都没有时，为 0
    * Header 设置了 widgetForHoverHeader，则使用 widgetForHoverHeader，否则使用 widgetForHeaderInSection，都没有是，为一个不显示的空容器
    */
    return Positioned(
      left: 0,
      right: 0,
      top: offset,
      height: height,
      child: header,
    );
  }

  // 初始化数据源，设定 IndexPath 属性
  void _configDataSource(){
    _items.clear();

    int sections = widget.numberOfSections(context);

    double start = 0;

    for(int section = 0; section < sections; section++){
      FMSectionModel sectionModel = FMSectionModel();
      sectionModel.section = section;
      sectionModel.height = widget.heightForHeaderInSection(context, section);
      sectionModel.start = start;

      FMRowModel headerModel = FMRowModel();
      headerModel.indexPath = FMIndexPath(section: section, row: -1);
      headerModel.height = sectionModel.height;
      sectionModel.rows.add(headerModel);
      start += headerModel.height;

      int rows = widget.numberOfRowsInSection(context, section);
      for(int row = 0; row < rows; row++){
        FMRowModel rowModel = FMRowModel();
        rowModel.indexPath = FMIndexPath(section: section, row: row);
        rowModel.height = widget.heightForRowAtIndexPath(context, rowModel.indexPath);
        start += rowModel.height;
        sectionModel.rows.add(rowModel);
      }
      sectionModel.end = start;
      _items.sections.add(sectionModel);
    }
  }

  // ScrollController 滑动监听
  void _configScrollController(){
    if (!widget.needHover) return;
    _controller.addListener(() {
      _offsetY = _controller.offset;
      _streamController.add(
          _offsetY = _controller.offset
      );
    });
  }

}

class FMIndexPath{
  final int section;
  final int row;

  FMIndexPath({
    this.section,
    this.row,
  });
}

class FMDataSource{
  List<FMSectionModel> _sections = [];
  List<FMSectionModel> get sections => _sections;

  int _count;
  int get count{
    int count = 0;
    _sections.forEach((FMSectionModel sectionModel) {
      sectionModel.rows.forEach((row) {
        count++;
      });
    });
    _count = count;
    return count;
  }

  FMRowModel rowModelWithIndex(int index){
    if(index >= this.count){
      return null;
    }

    FMRowModel rowModel;

    int current = 0;
    for(int section = 0; section < _sections.length; section++){
      FMSectionModel sectionModel = _sections[section];
      int next = current + sectionModel.rows.length;

      if(next > index){
        rowModel = sectionModel.rows[index - current];
        break;
      }

      current = next;
    }
    return rowModel;
  }

  void clear(){
    _sections.clear();
    _count = 0;
  }
}

class FMSectionModel{
  int section;
  double height;

  double start;
  double end;

  List <FMRowModel> rows = [];
}

class FMRowModel {
  FMIndexPath indexPath;
  double height;
}