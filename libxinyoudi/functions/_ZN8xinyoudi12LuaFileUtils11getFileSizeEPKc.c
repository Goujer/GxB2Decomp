unsigned __int64 __fastcall xinyoudi::LuaFileUtils::getFileSize(xinyoudi::LuaFileUtils *this, const char *s)
{
  size_t v3; // x0
  size_t v4; // x21
  char *v5; // x22
  unsigned __int64 v6; // x23
  __int64 v7; // x20
  unsigned __int64 v8; // x8
  __int64 v10; // [xsp+0h] [xbp-50h] BYREF
  size_t v11; // [xsp+8h] [xbp-48h]
  void *v12; // [xsp+10h] [xbp-40h]
  __int64 v13; // [xsp+18h] [xbp-38h]

  v13 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  v11 = 0LL;
  v12 = 0LL;
  v10 = 0LL;
  v3 = strlen(s);
  v4 = v3;
  if ( v3 >= 0xFFFFFFFFFFFFFFF0LL )
    abort();
  if ( v3 >= 0x17 )
  {
    v6 = (v3 + 16) & 0xFFFFFFFFFFFFFFF0LL;
    v5 = (char *)operator new(v6);
    v11 = v4;
    v12 = v5;
    v10 = v6 | 1;
    goto LABEL_6;
  }
  v5 = (char *)&v10 + 1;
  LOBYTE(v10) = 2 * v3;
  if ( v3 )
LABEL_6:
    memcpy(v5, s, v4);
  v5[v4] = 0;
  v7 = std::__hash_table<std::__hash_value_type<std::string,std::basic_string<unsigned char>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::basic_string<unsigned char>>,std::hash<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::basic_string<unsigned char>>,std::equal_to<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::basic_string<unsigned char>>>>::find<std::string>();
  if ( (v10 & 1) != 0 )
    operator delete(v12);
  if ( v7 )
  {
    v8 = *(unsigned __int8 *)(v7 + 40);
    if ( (v8 & 1) != 0 )
      return *(_QWORD *)(v7 + 48);
    else
      return v8 >> 1;
  }
  else
  {
    __android_log_print(6, "ApkUtils-Unity", "LuaFileUtils::getFileSize: %s is zero.", s);
    return 0LL;
  }
}
