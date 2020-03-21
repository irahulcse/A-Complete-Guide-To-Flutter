// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';
// class MyMap extends StatefulWidget{
//   @override 
//   _MyMapState createState()=>_MyMapState();
// }

// class _MyMapState extends State<MyMap>{
//   GoogleMapController _controller;
//   Position position;
//   Widget _child;

//   Future <void> getPermission() async {
//     PermissionStatus permission= await PermissionHandler().checkPermissionStatus(PermissionGroup.location);
//     if(permission== PermissionStatus.denied){
//       await PermissionHandler().requestPermissions([PermissionGroup.locationAlways]);
//     }
//     var geolocator=Geolocator();
//     GeolocationStatus geolocationStatus= await geolocator.checkGeolocationPermissionStatus();

//     switch(geolocationStatus){
//       case GeolocationStatus.denied:
//         showToast('Access Denied');
//         break;
//       case GeolocationStatus.granted:
//         showToast('Access Granted');
//         _getCurrentLocation();
//         break;
//       case GeolocationStatus.disabled:
//         showToast('Disabled');
//         break;
//       case GeolocationStatus.restricted:
//         showToast('Restricted');
//         break;
//       case GeolocationStatus.unknown:
//         showToast('Unknow Network Connected');
//         break;
//     }

//   }

//   void _getCurrentLocation() async{
//     Position res=await Geolocator().getCurrentPosition();
//     setState(() {
//       position=res;
//       _child=_mapWidget();
//     });
//   }

//   void _setStyle(GoogleMapController controller) async{
//     String value= await DefaultAssetBundle.of(context)
//         .loadString('assets/map_style.json');
//     controller.setMapStyle(value);
//   }
//  Set<Marker>_createMarker(){
//    return <Marker>[
//      Marker(
//        markerId: MarkerId('home'),
//        position: LatLng(position.latitude, position.longitude),
//        icon: BitmapDescriptor.defaultMarker,
//        infoWindow: InfoWindow(
//          title: 'My Current Location'
//        )
//      )
//    ].toSet();
//  }
//   void showToast(message){
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIos: 1,
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//       fontSize: 16.0,

//     );
//   }
//   @override 
//   void initState(){
//     getPermission();
//     super.initState();
//   }
//   Widget _mapWidget(){
//     return GoogleMap(
//       mapType: MapType.normal,
//       markers: _createMarker(),
//       initialCameraPosition: CameraPosition(
//         target: LatLng(position.latitude, position.longitude),
//         zoom: 12.0,
//       ),
//       onMapCreated: (GoogleMapController controller ){
//         _controller= controller;
//         _setStyle(controller);
//       },
//     );
//   }
//   @override 
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: new AppBar(
//         title: new Text(
//           "Zypp E Mobility Startup",
//           style: TextStyle(
//             color:Colors.white,
//           ),
//         ),
//       ),
//       body: _child,
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  GoogleMapController _controller;

  Position position;
  Widget _child;



  Future<void> getPermission() async {
   // PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.location);    // PermissionStatus permission = await PermissionHandler()
    //     .checkPermissionStatus(PermissionGroup.location);
    
    //if (permission == PermissionStatus.denied) {
   //   await PermissionHandler()
      //    .requestPermissions([PermissionGroup.locationAlways]);
    //}

    var geolocator = Geolocator();

    GeolocationStatus geolocationStatus =
        await geolocator.checkGeolocationPermissionStatus();

    switch (geolocationStatus) {
      case GeolocationStatus.denied:
        showToast('denied');
        break;
      case GeolocationStatus.disabled:
        showToast('disabled');
        break;
      case GeolocationStatus.restricted:
        showToast('restricted');
        break;
      case GeolocationStatus.unknown:
        showToast('unknown');
        break;
      case GeolocationStatus.granted:
        showToast('Access granted');
        _getCurrentLocation();
    }
  }

  void _setStyle(GoogleMapController controller) async {
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    controller.setMapStyle(value);
  }
  Set<Marker> _createMarker(){
    return <Marker>[
      Marker(
        markerId: MarkerId('home'),
        position: LatLng(position.latitude,position.longitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: 'Current Location')
      )
    ].toSet();
  }

  void showToast(message){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  void initState() {
    getPermission();
    super.initState();
  }
  void _getCurrentLocation() async{
    Position res = await Geolocator().getCurrentPosition();
    setState(() {
      position = res;
      _child = _mapWidget();
    });
  }


  Widget _mapWidget(){
    return GoogleMap(
      mapType: MapType.normal,
      markers: _createMarker(),
      initialCameraPosition: CameraPosition(
        target: LatLng(position.latitude,position.longitude),
        zoom: 12.0,
      ),
      onMapCreated: (GoogleMapController controller){
        _controller = controller;
        _setStyle(controller);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store Geolocation Zypp',textAlign: TextAlign.center,style: TextStyle(color: CupertinoColors.white),),
      ),
      body:_child
    );
  }
}
