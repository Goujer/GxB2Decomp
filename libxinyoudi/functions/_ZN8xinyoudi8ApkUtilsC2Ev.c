__int64 __fastcall xinyoudi::ApkUtils::ApkUtils(xinyoudi::ApkUtils *this)
{
  xinyoudi::LuaFileUtils *v2; // x20

  *((_QWORD *)this + 3) = 0LL;
  *((_QWORD *)this + 4) = 0LL;
  *((_QWORD *)this + 1) = 0LL;
  *((_QWORD *)this + 2) = 0LL;
  *(_QWORD *)this = off_69E88B0;
  *((_DWORD *)this + 10) = 1065353216;
  v2 = (xinyoudi::LuaFileUtils *)operator new(0x30uLL);
  xinyoudi::LuaFileUtils::LuaFileUtils(v2);
  *((_QWORD *)this + 6) = v2;
  return xinyoudi::LuaFileUtils::start(v2);
}
