__int64 __fastcall std::unordered_map<std::string,std::basic_string<unsigned char>>::operator[](
        float *a1,
        unsigned __int8 *a2)
{
  unsigned __int64 v2; // x27
  unsigned __int64 v5; // x0
  unsigned __int64 v6; // x26
  unsigned __int64 v7; // x21
  unsigned __int64 v8; // x28
  __int64 v9; // x25
  __int64 *v10; // x8
  __int64 v11; // x20
  unsigned __int64 v12; // x8
  size_t v13; // x23
  unsigned __int8 *v14; // x24
  unsigned __int64 v15; // x8
  unsigned __int64 v16; // x10
  unsigned __int64 v17; // x11
  const void *v18; // x0
  __int64 v19; // x9
  float v20; // s0
  float v21; // s1
  _BOOL8 v22; // x9
  unsigned __int64 v23; // x8
  unsigned __int64 v24; // x9
  std::__ndk1 *v25; // x1
  __int64 v26; // x9
  __int64 *v27; // x8
  unsigned __int64 v28; // x8

  _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2));
  v5 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()();
  v6 = *((_QWORD *)a1 + 1);
  v7 = v5;
  if ( v6 )
  {
    v8 = v6 - 1;
    v9 = (v6 - 1) & v6;
    if ( v9 )
    {
      v2 = v5;
      if ( v5 >= v6 )
        v2 = v5 % v6;
    }
    else
    {
      v2 = v8 & v5;
    }
    v10 = *(__int64 **)(*(_QWORD *)a1 + 8 * v2);
    if ( v10 )
    {
      v11 = *v10;
      if ( *v10 )
      {
        v12 = *a2;
        if ( (v12 & 1) != 0 )
          v13 = *((_QWORD *)a2 + 1);
        else
          v13 = v12 >> 1;
        if ( (v12 & 1) != 0 )
          v14 = (unsigned __int8 *)*((_QWORD *)a2 + 2);
        else
          v14 = a2 + 1;
        do
        {
          v15 = *(_QWORD *)(v11 + 8);
          if ( v15 == v7 )
            goto LABEL_22;
          if ( v9 )
          {
            if ( v15 >= v6 )
            {
              if ( v15 % v6 != v2 )
                break;
              goto LABEL_22;
            }
          }
          else
          {
            v15 &= v8;
          }
          if ( v15 != v2 )
            break;
LABEL_22:
          v16 = *(unsigned __int8 *)(v11 + 16);
          v17 = *(_QWORD *)(v11 + 24);
          if ( (v16 & 1) == 0 )
            v17 = v16 >> 1;
          if ( v17 == v13 )
          {
            if ( (v16 & 1) != 0 )
              v18 = *(const void **)(v11 + 32);
            else
              v18 = (const void *)(v11 + 17);
            if ( (v16 & 1) != 0 )
            {
              if ( !v13 || !memcmp(v18, v14, v13) )
                return v11 + 40;
            }
            else
            {
              if ( !v13 )
                return v11 + 40;
              v19 = 0LL;
              while ( *(unsigned __int8 *)(v11 + v19 + 17) == v14[v19] )
              {
                if ( v16 >> 1 == ++v19 )
                  return v11 + 40;
              }
            }
          }
          v11 = *(_QWORD *)v11;
        }
        while ( v11 );
      }
    }
  }
  v11 = operator new(0x40uLL);
  *(_QWORD *)(v11 + 32) = *((_QWORD *)a2 + 2);
  *(_QWORD *)(v11 + 40) = 0LL;
  *(_OWORD *)(v11 + 16) = *(_OWORD *)a2;
  *((_QWORD *)a2 + 1) = 0LL;
  *((_QWORD *)a2 + 2) = 0LL;
  *(_QWORD *)a2 = 0LL;
  *(_QWORD *)(v11 + 48) = 0LL;
  *(_QWORD *)(v11 + 56) = 0LL;
  *(_QWORD *)v11 = 0LL;
  *(_QWORD *)(v11 + 8) = v7;
  v20 = a1[8];
  v21 = (float)(unsigned __int64)(*((_QWORD *)a1 + 3) + 1LL);
  if ( !v6 || (float)(v20 * (float)v6) < v21 )
  {
    v22 = v6 < 3 || ((v6 - 1) & v6) != 0;
    v23 = v22 | (2 * v6);
    v24 = vcvtps_u32_f32(v21 / v20);
    if ( v23 >= v24 )
      v25 = (std::__ndk1 *)v23;
    else
      v25 = (std::__ndk1 *)v24;
    std::__hash_table<std::__hash_value_type<std::string,std::basic_string<unsigned char>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::basic_string<unsigned char>>,std::hash<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::basic_string<unsigned char>>,std::equal_to<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::basic_string<unsigned char>>>>::rehash(
      (int)a1,
      v25);
    v6 = *((_QWORD *)a1 + 1);
    if ( ((v6 - 1) & v6) != 0 )
    {
      if ( v7 >= v6 )
        v2 = v7 % v6;
      else
        v2 = v7;
    }
    else
    {
      v2 = (v6 - 1) & v7;
    }
  }
  v26 = *(_QWORD *)a1;
  v27 = *(__int64 **)(*(_QWORD *)a1 + 8 * v2);
  if ( v27 )
  {
    *(_QWORD *)v11 = *v27;
LABEL_59:
    *v27 = v11;
    goto LABEL_60;
  }
  *(_QWORD *)v11 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = v11;
  *(_QWORD *)(v26 + 8 * v2) = a1 + 4;
  if ( *(_QWORD *)v11 )
  {
    v28 = *(_QWORD *)(*(_QWORD *)v11 + 8LL);
    if ( ((v6 - 1) & v6) != 0 )
    {
      if ( v28 >= v6 )
        v28 %= v6;
    }
    else
    {
      v28 &= v6 - 1;
    }
    v27 = (__int64 *)(*(_QWORD *)a1 + 8 * v28);
    goto LABEL_59;
  }
LABEL_60:
  ++*((_QWORD *)a1 + 3);
  return v11 + 40;
}
