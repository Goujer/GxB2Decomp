void *__fastcall xinyoudi::LuaFileUtils::getFileContent(
        xinyoudi::LuaFileUtils *this,
        const char *s,
        unsigned __int8 *a3)
{
  size_t v5; // x0
  size_t v6; // x22
  char *v7; // x23
  unsigned __int64 v8; // x24
  __int64 v9; // x21
  unsigned __int64 v10; // x8
  const void *v11; // x1
  size_t v12; // x2
  __int64 v14; // [xsp+0h] [xbp-60h] BYREF
  size_t v15; // [xsp+8h] [xbp-58h]
  void *v16; // [xsp+10h] [xbp-50h]
  __int64 v17; // [xsp+18h] [xbp-48h]

  v17 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  v15 = 0LL;
  v16 = 0LL;
  v14 = 0LL;
  v5 = strlen(s);
  v6 = v5;
  if ( v5 >= 0xFFFFFFFFFFFFFFF0LL )
    abort();
  if ( v5 >= 0x17 )
  {
    v8 = (v5 + 16) & 0xFFFFFFFFFFFFFFF0LL;
    v7 = (char *)operator new(v8);
    v15 = v6;
    v16 = v7;
    v14 = v8 | 1;
    goto LABEL_6;
  }
  v7 = (char *)&v14 + 1;
  LOBYTE(v14) = 2 * v5;
  if ( v5 )
LABEL_6:
    memcpy(v7, s, v6);
  v7[v6] = 0;
  v9 = std::__hash_table<std::__hash_value_type<std::string,std::basic_string<unsigned char>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::basic_string<unsigned char>>,std::hash<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::basic_string<unsigned char>>,std::equal_to<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::basic_string<unsigned char>>>>::find<std::string>();
  if ( (v14 & 1) != 0 )
    operator delete(v16);
  if ( !v9 )
    return (void *)__android_log_print(6, "ApkUtils-Unity", "LuaFileUtils::getFileContent: %s is null", s);
  v10 = *(unsigned __int8 *)(v9 + 40);
  if ( (v10 & 1) != 0 )
  {
    v12 = *(_QWORD *)(v9 + 48);
    v11 = *(const void **)(v9 + 56);
  }
  else
  {
    v11 = (const void *)(v9 + 41);
    v12 = v10 >> 1;
  }
  return memcpy(a3, v11, v12);
}
