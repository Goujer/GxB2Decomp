void __fastcall xinyoudi::LuaFileUtils::~LuaFileUtils(xinyoudi::LuaFileUtils *this)
{
  xinyoudi::LuaFileUtils::~LuaFileUtils(this);
  operator delete(this);
}
