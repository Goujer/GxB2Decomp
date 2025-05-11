__int64 __fastcall xinyoudi::ApkUtils::checkFileExist(xinyoudi::ApkUtils *this, const char *a2, bool a3)
{
  __int64 v4; // x20
  xinyoudi::LuaFileUtils *v5; // x21

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
  return xinyoudi::ApkUtils::isFileExist(this, 0LL, a3);
}
