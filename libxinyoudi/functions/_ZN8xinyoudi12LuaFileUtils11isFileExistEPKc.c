bool __fastcall xinyoudi::LuaFileUtils::isFileExist(xinyoudi::LuaFileUtils *this, const char *s)
{
  size_t v3; // x0
  size_t v4; // x21
  char *v5; // x22
  unsigned __int64 v6; // x23
  __int64 v7; // x19
  __int64 v9; // [xsp+0h] [xbp-50h] BYREF
  size_t v10; // [xsp+8h] [xbp-48h]
  void *v11; // [xsp+10h] [xbp-40h]
  __int64 v12; // [xsp+18h] [xbp-38h]

  v12 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  v10 = 0LL;
  v11 = 0LL;
  v9 = 0LL;
  v3 = strlen(s);
  v4 = v3;
  if ( v3 >= 0xFFFFFFFFFFFFFFF0LL )
    abort();
  if ( v3 >= 0x17 )
  {
    v6 = (v3 + 16) & 0xFFFFFFFFFFFFFFF0LL;
    v5 = (char *)operator new(v6);
    v10 = v4;
    v11 = v5;
    v9 = v6 | 1;
    goto LABEL_6;
  }
  v5 = (char *)&v9 + 1;
  LOBYTE(v9) = 2 * v3;
  if ( v3 )
LABEL_6:
    memcpy(v5, s, v4);
  v5[v4] = 0;
  v7 = std::__hash_table<std::__hash_value_type<std::string,std::basic_string<unsigned char>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::basic_string<unsigned char>>,std::hash<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::basic_string<unsigned char>>,std::equal_to<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::basic_string<unsigned char>>>>::find<std::string>();
  if ( (v9 & 1) != 0 )
    operator delete(v11);
  return v7 != 0;
}
