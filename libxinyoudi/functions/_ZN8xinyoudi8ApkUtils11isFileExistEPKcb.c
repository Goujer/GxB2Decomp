__int64 __fastcall xinyoudi::ApkUtils::isFileExist(xinyoudi::ApkUtils *this, const char *a2)
{
  __int64 v3; // x20
  xinyoudi::LuaFileUtils *v4; // x21
  __int64 v6; // x20
  xinyoudi::LuaFileUtils *v7; // x21
  xinyoudi::FileRef *FileRef; // x0
  AAsset *v9; // x20
  AAsset *v10; // x0
  unsigned int Length; // w22
  xinyoudi::FileRef *v12; // x21
  __int64 v13; // x22
  xinyoudi::LuaFileUtils *v14; // x23

  if ( ((unsigned __int8)a2 & 1) != 0 )
  {
    v3 = xinyoudi::ApkUtils::_apkUtils;
    if ( !xinyoudi::ApkUtils::_apkUtils )
    {
      v3 = operator new(0x38uLL);
      *(_OWORD *)(v3 + 24) = 0u;
      *(_OWORD *)(v3 + 8) = 0u;
      *(_QWORD *)v3 = off_69E88B0;
      *(_DWORD *)(v3 + 40) = 1065353216;
      v4 = (xinyoudi::LuaFileUtils *)operator new(0x30uLL);
      xinyoudi::LuaFileUtils::LuaFileUtils(v4);
      *(_QWORD *)(v3 + 48) = v4;
      xinyoudi::LuaFileUtils::start(v4);
      xinyoudi::ApkUtils::_apkUtils = v3;
    }
    return xinyoudi::LuaFileUtils::isFileExist(*(xinyoudi::LuaFileUtils **)(v3 + 48), (const char *)this);
  }
  else if ( xinyoudi::ApkUtils::_assetManager )
  {
    v6 = xinyoudi::ApkUtils::_apkUtils;
    if ( !xinyoudi::ApkUtils::_apkUtils )
    {
      v6 = operator new(0x38uLL);
      *(_OWORD *)(v6 + 24) = 0u;
      *(_OWORD *)(v6 + 8) = 0u;
      *(_QWORD *)v6 = off_69E88B0;
      *(_DWORD *)(v6 + 40) = 1065353216;
      v7 = (xinyoudi::LuaFileUtils *)operator new(0x30uLL);
      xinyoudi::LuaFileUtils::LuaFileUtils(v7);
      *(_QWORD *)(v6 + 48) = v7;
      xinyoudi::LuaFileUtils::start(v7);
      xinyoudi::ApkUtils::_apkUtils = v6;
    }
    FileRef = (xinyoudi::FileRef *)xinyoudi::ApkUtils::getFileRef((xinyoudi::ApkUtils *)v6, (const char *)this);
    if ( FileRef )
    {
      LODWORD(v9) = xinyoudi::FileRef::isExist(FileRef) & 1;
    }
    else
    {
      v10 = AAssetManager_open((AAssetManager *)xinyoudi::ApkUtils::_assetManager, (const char *)this, 0);
      v9 = v10;
      if ( v10 )
      {
        Length = AAsset_getLength(v10);
        AAsset_close(v9);
        LODWORD(v9) = 1;
      }
      else
      {
        Length = 0;
      }
      v12 = (xinyoudi::FileRef *)operator new(0x10uLL);
      xinyoudi::FileRef::FileRef(v12, (bool)v9, Length);
      v13 = xinyoudi::ApkUtils::_apkUtils;
      if ( !xinyoudi::ApkUtils::_apkUtils )
      {
        v13 = operator new(0x38uLL);
        *(_OWORD *)(v13 + 24) = 0u;
        *(_OWORD *)(v13 + 8) = 0u;
        *(_QWORD *)v13 = off_69E88B0;
        *(_DWORD *)(v13 + 40) = 1065353216;
        v14 = (xinyoudi::LuaFileUtils *)operator new(0x30uLL);
        xinyoudi::LuaFileUtils::LuaFileUtils(v14);
        *(_QWORD *)(v13 + 48) = v14;
        xinyoudi::LuaFileUtils::start(v14);
        xinyoudi::ApkUtils::_apkUtils = v13;
      }
      xinyoudi::ApkUtils::addFileRef((xinyoudi::ApkUtils *)v13, (const char *)this, v12);
    }
    return (_DWORD)v9 != 0;
  }
  else
  {
    __android_log_print(6, "ApkUtils-Unity", "AssetManager is nullptr in isFileExist!");
    return 0LL;
  }
}
