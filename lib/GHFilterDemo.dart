import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GHFilterDemo extends StatefulWidget {
  @override
  _GHFilterDemoState createState() => _GHFilterDemoState();
}

class _GHFilterDemoState extends State<GHFilterDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _minPriceTextEditingController =
      TextEditingController();
  TextEditingController _maxPriceTextEditingController =
      TextEditingController();

  bool _seletect = false;

  String _seletecdString = "";

  /// 构造筛选Map
  List _filterList = [
    {
      "id": "1",
      "title": "综合",
      "fileds": "all",
      "sort": "1",
      "seletecd": "0",
    },
    {
      "id": "2",
      "title": "销量",
      "fileds": 'saleCount',
      "sort": "1",
      "seletecd": "0"
    },
    {"id": "1", "title": "价格", "fileds": 'price', "sort": "1", "seletecd": "0"},
    {"id": "4", "title": "筛选", "seletecd": "0"}
  ];

  /// 构造筛选Map
  List _firstList = [
    {"id": "1", "title": "京东物流", "type": "1", "seletecd": "0"},
    {"id": "2", "title": "货到付款", "type": "1", "seletecd": "0"},
    {"id": "3", "title": "仅看有货", "type": "1", "seletecd": "0"},
    {"id": "4", "title": "京东国际", "type": "1", "seletecd": "0"}
  ];

  /// 构造筛选Map
  List _secondList = [
    {"id": "1", "title": "6-10", "type": "1", "seletecd": "0"},
    {"id": "2", "title": "10-26", "type": "1", "seletecd": "0"},
    {"id": "3", "title": "26-137", "type": "1", "seletecd": "0"}
  ];

  /// 构造筛选Map
  List _thirdList = [
    {"id": "1", "title": "得力", "type": "1", "seletecd": "0"},
    {"id": "2", "title": "广博", "type": "1", "seletecd": "0"},
    {"id": "3", "title": "TANGO", "type": "1", "seletecd": "0"},
    {"id": "1", "title": "晨光", "type": "1", "seletecd": "0"},
    {"id": "2", "title": "齐心", "type": "1", "seletecd": "0"},
    {"id": "3", "title": "3M", "type": "1", "seletecd": "0"},
    {"id": "1", "title": "哈哈", "type": "1", "seletecd": "0"},
    {"id": "2", "title": "嘿嘿", "type": "1", "seletecd": "0"},
    {"id": "1", "title": "得力", "type": "1", "seletecd": "0"},
    {"id": "2", "title": "广博", "type": "1", "seletecd": "0"},
    {"id": "3", "title": "TANGO", "type": "1", "seletecd": "0"},
    {"id": "1", "title": "晨光", "type": "1", "seletecd": "0"},
    {"id": "2", "title": "齐心", "type": "1", "seletecd": "0"},
    {"id": "3", "title": "3M", "type": "1", "seletecd": "0"},
    {"id": "1", "title": "哈哈", "type": "1", "seletecd": "0"},
  ];

  List _seletecdList = [];

  @override
  void initState() {
    super.initState();
    _getSeletecdList();
  }

  /// 改变筛选菜单状态
  _changeFilterStatus(index, seletecd) {
    Map map = this._filterList[index];
    map["seletecd"] = seletecd;
    setState(() {});
  }

  /// 重置所有数据
  _reastData() {
    this._seletecdList.forEach((element) {
      setState(() {
        element["seletecd"] = "0";
      });
    });
    _changeFilterStatus(3, "0");
    this._minPriceTextEditingController.text = "";
    this._maxPriceTextEditingController.text = "";
    this._seletecdList.clear();
  }

  _clickSure() {
    if ((this._seletecdList != null && this._seletecdList.length > 0) ||
        this._minPriceTextEditingController.text.length > 0 ||
        this._maxPriceTextEditingController.text.length > 0) {
      _changeFilterStatus(3, "1");
      setState(() {
        List strings = [];
        this._seletecdList.forEach((element) {
            strings.add(element["title"]);
        });
        this._seletecdString = ( this._seletecdList.length >0 ?strings.toString():"") + (this._minPriceTextEditingController.text.length > 0 ? "最低价" + "${this._minPriceTextEditingController.text}":"") + (this._minPriceTextEditingController.text.length > 0 ? "最高价" + "${this._maxPriceTextEditingController.text}":"");
      });
    }
  }

  /// 获取用户选中
  _getSeletecdList() {
    List seletecdList = [];
    this._firstList.forEach((element) {
      if (element["seletecd"] == "1") {
        seletecdList.add(element);
      }
    });

    this._thirdList.forEach((element) {
      if (element["seletecd"] == "1") {
        seletecdList.add(element);
      }
    });
    this._seletecdList = seletecdList;
  }

  /// 侧滑每行的标题
  Widget _sideSectionTitle(String title, [List list]) {
    List array = [];
    List test = [];
    if (list != null) {
      list.forEach((element) {
        if (element["seletecd"] == "1") {
          array.add(element["title"]);
          test.join(element["title"]);
        }
      });
    }

    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 200,
                  child: Text(
                    array.length > 0 ? array.toString() : "",
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
                list != null && list.length > 6
                    ? Container(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              this._seletect = !this._seletect;
                            });
                          },
                          child: this._seletect == true
                              ? Icon(Icons.arrow_drop_down)
                              : Icon(Icons.arrow_drop_up),
                        ),
                      )
                    : Text(""),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 侧滑筛选子项
  Widget _sideItem(list) {
    List actionList = [];

    if (list.length > 6) {
      for (var i = 0; i < 6; i++) {
        Map map = list[i];
        actionList.add(map);
      }
    }
    List temp = [];
    if (this._seletect && list.length > 6) {
      temp = actionList;
    } else {
      temp = list;
    }
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Wrap(
        spacing: 10,
        runSpacing: 5,
        children: temp.asMap().keys.map<Widget>((f) {
          Map map = temp[f];
          return InkWell(
              onTap: () {
                setState(() {
                  String sel = map["seletecd"];
                  if (sel == "0") {
                    map["seletecd"] = "1";
                  } else {
                    map["seletecd"] = "0";
                  }
                });
                _getSeletecdList();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 0.5,
                      color: map["seletecd"] == "0"
                          ? Colors.transparent
                          : Colors.red,
                    )),
                alignment: Alignment.center,
                height: 36,
                width: 103,
                child: Chip(
                  backgroundColor: map["seletecd"] == "0"
                      ? Color.fromRGBO(240, 240, 240, 1)
                      : Color.fromRGBO(245, 245, 245, 0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  label: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            "#####",
                            style: TextStyle(color: Colors.transparent),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${map["title"]}",
                          style: TextStyle(
                              fontSize: 12,
                              color: map["seletecd"] == "1"
                                  ? Colors.red
                                  : Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        }).toList(),
      ),
    );
  }

  /// 侧滑筛选
  Widget _sideFilter() {
    return Container(
        child: Stack(
      children: <Widget>[
        Positioned(
          bottom: MediaQuery.of(context).padding.bottom,
          height: ScreenUtil.getInstance().setHeight(80),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
              width: 1,
              color: Colors.black12,
            ))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _reastData();
                  },
                  child: Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      width: 175,
                      child: Text(
                        "重置",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )),
                ),
                GestureDetector(
                    onTap: () {
                      _clickSure();
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 175,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Text(
                        "确定",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ))
              ],
            ),
          ),
        ),
        Container(
          height: ScreenUtil.screenHeightDp -
              ScreenUtil.getInstance().setHeight(80) -
              MediaQuery.of(context).padding.bottom,
          child: ListView(
            children: <Widget>[
              Container(
                  child: Column(
                children: <Widget>[
                  _sideSectionTitle("服务/折扣", this._firstList),
                  _sideItem(this._firstList),
                ],
              )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _sideSectionTitle("价格区间"),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 125,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(240, 240, 240, 1),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: TextField(
                              controller: _minPriceTextEditingController,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 0, top: 0),
                                  counterText: '',
                                  hintText: "最低价",
                                  hintStyle: TextStyle(
                                    color: Colors.black38,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 1,
                            width: 10,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 125,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(240, 240, 240, 1),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: TextField(
                              controller: _maxPriceTextEditingController,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 0, top: 0),
                                  counterText: '',
                                  hintText: "最高价",
                                  hintStyle: TextStyle(
                                    color: Colors.black38,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            _sideSectionTitle("品牌", this._thirdList),
                            _sideItem(this._thirdList),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }

  /// 筛选Widget
  Widget _filter() {
    return Positioned(
      height: ScreenUtil.getInstance().setHeight(80),
      width: ScreenUtil.screenWidthDp,
      top: 0,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          width: 1,
          color: Colors.black12,
        ))),
        child: Row(
          children: this._filterList.map((value) {
            return Expanded(
                child: InkWell(
                    onTap: () {
                      /// 如果是筛选，弹出抽屉
                      String id = value["id"];
                      if (id == "4") {
                        _scaffoldKey.currentState.openEndDrawer();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${value["title"]}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: value["seletecd"] == "1"
                              ? Colors.red
                              : Colors.black87,
                        ),
                      ),
                    )));
          }).toList(),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Scaffold(
        key: _scaffoldKey,
        endDrawer: Container(
            width: 350,
            child: Drawer(
              child: _sideFilter(),
            )),
        appBar: AppBar(
          title: Text("GHFilterDemo"),
        ),
        body: Stack(
          children: <Widget>[
            _filter(),
            Center(

              child: Text(
                this._seletecdString,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                fontSize: 18),
              ),
            )
          ],
        )
    );
  }
}
