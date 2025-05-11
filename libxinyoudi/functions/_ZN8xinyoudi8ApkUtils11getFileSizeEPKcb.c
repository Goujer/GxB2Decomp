xinyoudi::FileRef *__fastcall xinyoudi::ApkUtils::getFileSize(xinyoudi::ApkUtils *this, const char *a2, bool a3)
{
  __int64 v4; // x20
  xinyoudi::LuaFileUtils *v5; // x21
  xinyoudi::FileRef *result; // x0
  __int64 v7; // x20
  xinyoudi::LuaFileUtils *v8; // x21
  __int64 v9; // x20
  xinyoudi::LuaFileUtils *v10; // x21

  v4 = xinyoudi::ApkUtils::_apkUtils;
  if ( ((unsigned __int8)a2 & 1) != 0 )
  {
    if ( !xinyoudi::ApkUtils::_apkUtils )
    {
      v4 = operator new(0x38uLL);
      *(_OWORD *)(v4 + 24) = 0u;
      *(_OWORD *)(v4 + 8) = 0u;
      *(_QWORD *)v4 = off_69E88B0;
      *(_DWORD *)(v4 + 40) = 1065353216;
      v5 = (xinyoudi::LuaFileUtils *)operator new(0x30uLL);
      xinyoudi::LuaFileUtils::LuaFileUtils(v5);
      *(_QWORD *)(v4 + 48) = v5;
      xinyoudi::LuaFileUtils::start(v5);
      xinyoudi::ApkUtils::_apkUtils = v4;
    }
    return (xinyoudi::FileRef *)xinyoudi::LuaFileUtils::getFileSize(
                                  *(xinyoudi::LuaFileUtils **)(v4 + 48),
                                  (const char *)this);
  }
  else
  {
    if ( !xinyoudi::ApkUtils::_apkUtils )
    {
      v7 = operator new(0x38uLL);
      *(_OWORD *)(v7 + 24) = 0u;
      *(_OWORD *)(v7 + 8) = 0u;
      *(_QWORD *)v7 = off_69E88B0;
      *(_DWORD *)(v7 + 40) = 1065353216;
      v8 = (xinyoudi::LuaFileUtils *)operator new(0x30uLL);
      xinyoudi::LuaFileUtils::LuaFileUtils(v8);
      *(_QWORD *)(v7 + 48) = v8;
      xinyoudi::LuaFileUtils::start(v8);
      xinyoudi::ApkUtils::_apkUtils = v7;
    }
    xinyoudi::ApkUtils::isFileExist(this, 0LL, a3);
    v9 = xinyoudi::ApkUtils::_apkUtils;
    if ( !xinyoudi::ApkUtils::_apkUtils )
    {
      v9 = operator new(0x38uLL);
      *(_OWORD *)(v9 + 24) = 0u;
      *(_OWORD *)(v9 + 8) = 0u;
      *(_QWORD *)v9 = off_69E88B0;
      *(_DWORD *)(v9 + 40) = 1065353216;
      v10 = (xinyoudi::LuaFileUtils *)operator new(0x30uLL);
      xinyoudi::LuaFileUtils::LuaFileUtils(v10);
      *(_QWORD *)(v9 + 48) = v10;
      xinyoudi::LuaFileUtils::start(v10);
      xinyoudi::ApkUtils::_apkUtils = v9;
    }
    result = (xinyoudi::FileRef *)xinyoudi::ApkUtils::getFileRef((xinyoudi::ApkUtils *)v9, (const char *)this);
    if ( result )
      return (xinyoudi::FileRef *)xinyoudi::FileRef::getSize(result);
  }
  return result;
}
