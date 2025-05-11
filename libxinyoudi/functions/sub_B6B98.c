void (__fastcall **__fastcall sub_B6B98(__int64 a1, const char **lpsrc, _QWORD **a3))(std::type_info *__hidden this)
{
  void (__fastcall **result)(std::type_info *__hidden); // x0
  void (__fastcall **v7)(std::type_info *__hidden); // x21
  int v8; // w8
  int v9; // w9
  void (__fastcall **v10)(std::type_info *__hidden); // x8
  void *v11; // x0
  _BYTE *v12; // x0
  _QWORD *v13; // x8
  _QWORD *v14; // x22
  void (__fastcall **v15)(std::type_info *__hidden); // x20
  _QWORD v16[4]; // [xsp+8h] [xbp-88h] BYREF
  __int128 v17; // [xsp+28h] [xbp-68h]
  __int128 v18; // [xsp+38h] [xbp-58h]
  __int64 v19; // [xsp+48h] [xbp-48h]
  _BYTE v20[7]; // [xsp+50h] [xbp-40h]
  __int64 v21; // [xsp+58h] [xbp-38h]

  v21 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( lpsrc == (const char **)&`typeinfo for'decltype(nullptr) )
  {
    *a3 = 0LL;
    return (void (__fastcall **)(std::type_info *__hidden))(&dword_0 + 1);
  }
  if ( (*(_BYTE *)(a1 + 16) & 0x18) != 0 )
  {
LABEL_3:
    if ( strcmp(*(const char **)(a1 + 8), lpsrc[1]) )
      goto LABEL_4;
LABEL_20:
    if ( *a3 )
    {
      v13 = (_QWORD *)**a3;
LABEL_22:
      *a3 = v13;
    }
    return (void (__fastcall **)(std::type_info *__hidden))(&dword_0 + 1);
  }
  if ( !lpsrc )
    return 0LL;
  v12 = __dynamic_cast(
          lpsrc,
          (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
          (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__pbase_type_info,
          0LL);
  if ( v12 )
  {
    if ( (v12[16] & 0x18) != 0 )
      goto LABEL_3;
    if ( (const char **)a1 == lpsrc )
      goto LABEL_20;
  }
LABEL_4:
  result = (void (__fastcall **)(std::type_info *__hidden))__dynamic_cast(
                                                             lpsrc,
                                                             (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
                                                             (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__pointer_type_info,
                                                             0LL);
  v7 = result;
  if ( !result )
    return result;
  if ( *a3 )
    *a3 = (_QWORD *)**a3;
  v8 = *((_DWORD *)result + 4);
  v9 = *(_DWORD *)(a1 + 16);
  if ( ((unsigned __int8)v8 & (unsigned __int8)~(_BYTE)v9 & 7) != 0
    || ((unsigned __int8)v9 & (unsigned __int8)~(_BYTE)v8 & 0x60) != 0 )
  {
    return 0LL;
  }
  result = *(void (__fastcall ***)(std::type_info *__hidden))(a1 + 24);
  v10 = (void (__fastcall **)(std::type_info *__hidden))v7[3];
  if ( result == v10 )
    return (void (__fastcall **)(std::type_info *__hidden))(&dword_0 + 1);
  if ( result == &`typeinfo for'void )
  {
    if ( v10 )
      return (void (__fastcall **)(std::type_info *__hidden))(__dynamic_cast(
                                                                v7[3],
                                                                (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
                                                                (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__function_type_info,
                                                                0LL) == 0LL);
    return (void (__fastcall **)(std::type_info *__hidden))(&dword_0 + 1);
  }
  if ( !result )
    return result;
  v11 = __dynamic_cast(
          result,
          (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
          (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__pointer_type_info,
          0LL);
  if ( v11 )
  {
    if ( (*(_BYTE *)(a1 + 16) & 1) != 0 )
      return (void (__fastcall **)(std::type_info *__hidden))(sub_B6E94((int)v11, v7[3]) & 1);
    return 0LL;
  }
  result = *(void (__fastcall ***)(std::type_info *__hidden))(a1 + 24);
  if ( !result )
    return result;
  v14 = __dynamic_cast(
          result,
          (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
          (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__pointer_to_member_type_info,
          0LL);
  if ( !v14 )
  {
    result = *(void (__fastcall ***)(std::type_info *__hidden))(a1 + 24);
    if ( !result )
      return result;
    result = (void (__fastcall **)(std::type_info *__hidden))__dynamic_cast(
                                                               result,
                                                               (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
                                                               (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__class_type_info,
                                                               0LL);
    v15 = result;
    if ( !result )
      return result;
    result = (void (__fastcall **)(std::type_info *__hidden))v7[3];
    if ( !result )
      return result;
    result = (void (__fastcall **)(std::type_info *__hidden))__dynamic_cast(
                                                               result,
                                                               (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
                                                               (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__class_type_info,
                                                               0LL);
    if ( !result )
      return result;
    v16[0] = result;
    v16[1] = 0LL;
    v16[2] = v15;
    v16[3] = -1LL;
    *(_DWORD *)&v20[3] = 0;
    v19 = 0LL;
    v18 = 0u;
    v17 = 0u;
    *(_DWORD *)v20 = 1;
    (*((void (__fastcall **)(void (__fastcall **)(std::type_info *__hidden), _QWORD *, _QWORD, __int64))*result + 7))(
      result,
      v16,
      *a3,
      1LL);
    if ( (_DWORD)v18 != 1 )
      return 0LL;
    if ( *a3 )
    {
      v13 = (_QWORD *)v17;
      goto LABEL_22;
    }
    return (void (__fastcall **)(std::type_info *__hidden))(&dword_0 + 1);
  }
  if ( (*(_BYTE *)(a1 + 16) & 1) == 0 )
    return 0LL;
  result = (void (__fastcall **)(std::type_info *__hidden))v7[3];
  if ( result )
  {
    result = (void (__fastcall **)(std::type_info *__hidden))__dynamic_cast(
                                                               result,
                                                               (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
                                                               (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__pointer_to_member_type_info,
                                                               0LL);
    if ( result )
    {
      if ( ((_DWORD)result[2] & ~*((_DWORD *)v14 + 4)) == 0
        && (void (__fastcall *)(std::type_info *__hidden))v14[3] == result[3] )
      {
        return (void (__fastcall **)(std::type_info *__hidden))(v14[4] == (_QWORD)result[4]);
      }
      return 0LL;
    }
  }
  return result;
}
