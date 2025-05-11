void __fastcall xinyoudi::ApkUtils::getFileContent(xinyoudi::ApkUtils *this, char *a2, unsigned __int8 *a3)
{
  __int64 v5; // x21
  xinyoudi::LuaFileUtils *v6; // x22
  unsigned int FileSize; // w21
  AAsset *v8; // x0
  AAsset *v9; // x22
  int v10; // w20

  if ( ((unsigned __int8)a3 & 1) != 0 )
  {
    v5 = xinyoudi::ApkUtils::_apkUtils;
    if ( !xinyoudi::ApkUtils::_apkUtils )
    {
      v5 = operator new(0x38uLL);
      *(_OWORD *)(v5 + 24) = 0u;
      *(_OWORD *)(v5 + 8) = 0u;
      *(_QWORD *)v5 = off_69E88B0;
      *(_DWORD *)(v5 + 40) = 1065353216;
      v6 = (xinyoudi::LuaFileUtils *)operator new(0x30uLL);
      xinyoudi::LuaFileUtils::LuaFileUtils(v6);
      *(_QWORD *)(v5 + 48) = v6;
      xinyoudi::LuaFileUtils::start(v6);
      xinyoudi::ApkUtils::_apkUtils = v5;
    }
    xinyoudi::LuaFileUtils::getFileContent(
      *(xinyoudi::LuaFileUtils **)(v5 + 48),
      (const char *)this,
      (unsigned __int8 *)a2);
  }
  else if ( xinyoudi::ApkUtils::_assetManager )
  {
    FileSize = xinyoudi::ApkUtils::getFileSize(this, 0LL, (bool)a3);
    v8 = AAssetManager_open((AAssetManager *)xinyoudi::ApkUtils::_assetManager, (const char *)this, 0);
    v9 = v8;
    if ( v8 )
    {
      v10 = AAsset_read(v8, a2, FileSize);
      if ( v10 != FileSize )
      {
        if ( a2 )
          operator delete[](a2);
        __android_log_print(6, "ApkUtils-Unity", "ReadSize: %d is equal to size: %d!", v10, FileSize);
      }
      AAsset_close(v9);
    }
    else
    {
      __android_log_print(6, "ApkUtils-Unity", "Asset %s is nullptr in getFileContent!");
    }
  }
  else
  {
    __android_log_print(6, "ApkUtils-Unity", "AssetManager is nullptr in getFileContent!");
  }
}
