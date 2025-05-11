void *__fastcall sub_B6770(void *a1, void *lpsrc, _QWORD *a3)
{
  void *result; // x0
  _QWORD v6[4]; // [xsp+8h] [xbp-78h] BYREF
  __int128 v7; // [xsp+28h] [xbp-58h]
  __int128 v8; // [xsp+38h] [xbp-48h]
  __int64 v9; // [xsp+48h] [xbp-38h]
  _BYTE v10[7]; // [xsp+50h] [xbp-30h]
  __int64 v11; // [xsp+58h] [xbp-28h]

  v11 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( a1 == lpsrc )
    return &dword_0 + 1;
  if ( lpsrc )
  {
    result = __dynamic_cast(
               lpsrc,
               (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
               (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__class_type_info,
               0LL);
    if ( !result )
      return result;
    v6[0] = result;
    v6[1] = 0LL;
    v6[2] = a1;
    v6[3] = -1LL;
    *(_DWORD *)&v10[3] = 0;
    v9 = 0LL;
    v8 = 0u;
    v7 = 0u;
    *(_DWORD *)v10 = 1;
    (*(void (__fastcall **)(void *, _QWORD *, _QWORD, __int64))(*(_QWORD *)result + 56LL))(result, v6, *a3, 1LL);
    if ( (_DWORD)v8 == 1 )
    {
      *a3 = v7;
      return &dword_0 + 1;
    }
  }
  return 0LL;
}
