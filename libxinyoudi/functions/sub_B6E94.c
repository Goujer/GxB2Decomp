_QWORD *__fastcall sub_B6E94(void *a1, void *lpsrc)
{
  const void *v2; // x8
  _QWORD *result; // x0
  _QWORD *v5; // x21
  int v6; // w9
  __int64 v7; // x8
  void *v8; // x0
  _QWORD *v9; // x19

  v2 = lpsrc;
  if ( !lpsrc )
    return 0LL;
  while ( 1 )
  {
    result = __dynamic_cast(
               v2,
               (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
               (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__pointer_type_info,
               0LL);
    v5 = result;
    if ( !result )
      break;
    v6 = *((_DWORD *)a1 + 4);
    if ( ((_DWORD)result[2] & ~v6) != 0 )
      return 0LL;
    v7 = *((_QWORD *)a1 + 3);
    if ( v7 == result[3] )
      return (_QWORD *)(&dword_0 + 1);
    result = 0LL;
    if ( (v6 & 1) == 0 || !v7 )
      return result;
    v8 = __dynamic_cast(
           *((const void **)a1 + 3),
           (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
           (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__pointer_type_info,
           0LL);
    if ( !v8 )
    {
      result = (_QWORD *)*((_QWORD *)a1 + 3);
      if ( !result )
        return result;
      result = __dynamic_cast(
                 result,
                 (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
                 (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__pointer_to_member_type_info,
                 0LL);
      v9 = result;
      if ( !result )
        return result;
      result = (_QWORD *)v5[3];
      if ( !result )
        return result;
      result = __dynamic_cast(
                 result,
                 (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
                 (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__pointer_to_member_type_info,
                 0LL);
      if ( !result )
        return result;
      if ( ((_DWORD)result[2] & ~*((_DWORD *)v9 + 4)) == 0 && v9[3] == result[3] )
        return (_QWORD *)(v9[4] == result[4]);
      return 0LL;
    }
    v2 = (const void *)v5[3];
    a1 = v8;
    if ( !v2 )
      return 0LL;
  }
  return result;
}
