__int64 __fastcall xinyoudi::LuaFileUtils::start(xinyoudi::LuaFileUtils *this)
{
  clock_t v2; // x20
  int v3; // w3

  v2 = clock();
  xinyoudi::LuaFileUtils::init(this);
  v3 = (int)((double)(clock() - v2) * 1000.0 / 1000000.0);
  return __android_log_print(
           6,
           "ApkUtils-Unity",
           "====================== LuaFileUtils::init cost: %d ms ======================",
           v3);
}
