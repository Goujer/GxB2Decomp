__int64 __fastcall xinyoudi::ApkUtils::addFileRef(xinyoudi::ApkUtils *this, const char *s, xinyoudi::FileRef *a3)
{
  unsigned __int64 v3; // x26
  size_t v7; // x0
  char *v8; // x22
  unsigned __int8 v9; // w9
  int v10; // w8
  unsigned __int8 *v11; // x10
  int v12; // t1
  unsigned __int64 v13; // x25
  unsigned __int64 v14; // x24
  __int64 *v15; // x20
  unsigned __int64 v16; // x23
  __int64 v17; // x27
  __int64 **v18; // x28
  unsigned __int64 v19; // x8
  __int64 result; // x0
  __int64 v21; // x23
  float v22; // s0
  float v23; // s1
  _BOOL8 v24; // x9
  unsigned __int64 v25; // x8
  unsigned __int64 v26; // x9
  std::__ndk1 *v27; // x1
  __int64 v28; // x9
  __int64 *v29; // x8
  unsigned __int64 v30; // x8

  v7 = strlen(s);
  v8 = (char *)malloc(v7 + 1);
  strcpy(v8, s);
  v9 = *v8;
  if ( *v8 )
  {
    v10 = 0;
    v11 = (unsigned __int8 *)(v8 + 1);
    do
    {
      v10 = 131 * v10 + v9;
      v12 = *v11++;
      v9 = v12;
    }
    while ( v12 );
    v13 = v10 & 0x7FFFFFFF;
  }
  else
  {
    v13 = 0LL;
  }
  v14 = *((_QWORD *)this + 2);
  v15 = (__int64 *)((char *)this + 8);
  if ( v14 )
  {
    v16 = v14 - 1;
    v17 = (v14 - 1) & v14;
    if ( v17 )
    {
      v3 = v13;
      if ( v13 >= v14 )
        v3 = v13 % v14;
    }
    else
    {
      v3 = v16 & v13;
    }
    v18 = *(__int64 ***)(*v15 + 8 * v3);
    if ( v18 )
    {
      while ( 1 )
      {
        v18 = (__int64 **)*v18;
        if ( !v18 )
          break;
        v19 = (unsigned __int64)v18[1];
        if ( v19 != v13 )
        {
          if ( !v17 )
          {
            v19 &= v16;
LABEL_20:
            if ( v19 != v3 )
              break;
            goto LABEL_21;
          }
          if ( v19 < v14 )
            goto LABEL_20;
          if ( v19 % v14 != v3 )
            break;
        }
LABEL_21:
        result = strcmp((const char *)v18[2], v8);
        if ( !(_DWORD)result )
          return result;
      }
    }
  }
  result = operator new(0x20uLL);
  v21 = result;
  *(_QWORD *)(result + 16) = v8;
  *(_QWORD *)(result + 24) = a3;
  *(_QWORD *)result = 0LL;
  *(_QWORD *)(result + 8) = v13;
  v22 = *((float *)this + 10);
  v23 = (float)(unsigned __int64)(*((_QWORD *)this + 4) + 1LL);
  if ( !v14 || (float)(v22 * (float)v14) < v23 )
  {
    v24 = v14 < 3 || ((v14 - 1) & v14) != 0;
    v25 = v24 | (2 * v14);
    v26 = vcvtps_u32_f32(v23 / v22);
    if ( v25 >= v26 )
      v27 = (std::__ndk1 *)v25;
    else
      v27 = (std::__ndk1 *)v26;
    result = std::__hash_table<std::__hash_value_type<char const*,xinyoudi::FileRef *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,xinyoudi::FileRef *>,hash_func,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,xinyoudi::FileRef *>,cmp,true>,std::allocator<std::__hash_value_type<char const*,xinyoudi::FileRef *>>>::rehash(
               (int)this + 8,
               v27);
    v14 = *((_QWORD *)this + 2);
    if ( ((v14 - 1) & v14) != 0 )
    {
      if ( v13 >= v14 )
        v3 = v13 % v14;
      else
        v3 = v13;
    }
    else
    {
      v3 = (v14 - 1) & v13;
    }
  }
  v28 = *v15;
  v29 = *(__int64 **)(*v15 + 8 * v3);
  if ( v29 )
  {
    *(_QWORD *)v21 = *v29;
LABEL_44:
    *v29 = v21;
    goto LABEL_45;
  }
  *(_QWORD *)v21 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = v21;
  *(_QWORD *)(v28 + 8 * v3) = (char *)this + 24;
  if ( *(_QWORD *)v21 )
  {
    v30 = *(_QWORD *)(*(_QWORD *)v21 + 8LL);
    if ( ((v14 - 1) & v14) != 0 )
    {
      if ( v30 >= v14 )
        v30 %= v14;
    }
    else
    {
      v30 &= v14 - 1;
    }
    v29 = (__int64 *)(*v15 + 8 * v30);
    goto LABEL_44;
  }
LABEL_45:
  ++*((_QWORD *)this + 4);
  return result;
}
