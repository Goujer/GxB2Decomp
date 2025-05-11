__int64 __fastcall xinyoudi::ApkUtils::getInstance(xinyoudi::ApkUtils *this)
{
  __int64 v1; // x19
  xinyoudi::LuaFileUtils *v2; // x20

  v1 = xinyoudi::ApkUtils::_apkUtils;
  if ( !xinyoudi::ApkUtils::_apkUtils )
  {
    v1 = operator new(0x38uLL);
    *(_OWORD *)(v1 + 24) = 0u;
    *(_OWORD *)(v1 + 8) = 0u;
    *(_QWORD *)v1 = off_69E88B0;
    *(_DWORD *)(v1 + 40) = 1065353216;
    v2 = (xinyoudi::LuaFileUtils *)operator new(0x30uLL);
    xinyoudi::LuaFileUtils::LuaFileUtils(v2);
    *(_QWORD *)(v1 + 48) = v2;
    xinyoudi::LuaFileUtils::start(v2);
    xinyoudi::ApkUtils::_apkUtils = v1;
  }
  return v1;
}
