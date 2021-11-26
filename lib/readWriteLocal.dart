import 'dart:core';
import 'dart:io';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AppDataStorage{

  static Future<String> get _localpath async {
    final dir=await getExternalStorageDirectory();
    print("dir path" + dir.path);
    return dir.path;
  }

  static Future<File> _localFile(String filename) async{
    final path= await _localpath;
    return File("$path/$filename");
  }

  static Future<bool> writeToFile(String data,String filename) async{
    final file= await _localFile(filename);
    File f;
    if(await requestPermission(Permission.storage)){
      f= await file.writeAsString(data);
      return f.exists();
    }else{
      print("storage permission not granted");
      return false;
    }
  }

  static Future<String> readFile(String filename) async{
    var file=await _localFile(filename);
    if(await requestPermission(Permission.storage)){
    final contents=file.readAsString();
    return contents;}
    else{
      print("read permission not granted");
    }
    return "";
  }

  static Future<bool> requestPermission(Permission permission) async{
    if(await permission.isGranted){
      return true;
    }else{
      var result=await permission.request();
      if(result==PermissionStatus.granted){
        return true;
      }else{
        return false;
      }
    }
  }

  static Future<bool>checkFile(String file) async{
    var dir= await _localpath;
    print("checking mobile file");
   if(await requestPermission(Permission.storage)){
    
    return File(dir+"/"+file).exists();}
    else{
      print("file check permission not granted");
    }
  }
}