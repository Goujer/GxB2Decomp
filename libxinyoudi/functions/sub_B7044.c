_DWORD *__fastcall sub_B7044(__int64 a1, const char **lpsrc, _QWORD *a3)
{
  _DWORD *result; // x0
  int v7; // w8
  int v8; // w9
  const void *v9; // x0
  void *v10; // x19
  _BYTE *v11; // x0

  if ( lpsrc != (const char **)&`typeinfo for'decltype(nullptr) )
  {
    if ( (*(_BYTE *)(a1 + 16) & 0x18) != 0 )
      goto LABEL_3;
    if ( !lpsrc )
      return 0LL;
    v11 = __dynamic_cast(
            lpsrc,
            (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
            (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__pbase_type_info,
            0LL);
    if ( v11 )
    {
      if ( (v11[16] & 0x18) != 0 )
      {
LABEL_3:
        if ( strcmp(*(const char **)(a1 + 8), lpsrc[1]) )
          goto LABEL_4;
        return &dword_0 + 1;
      }
      if ( (const char **)a1 == lpsrc )
        return &dword_0 + 1;
    }
LABEL_4:
    result = __dynamic_cast(
               lpsrc,
               (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
               (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__pointer_to_member_type_info,
               0LL);
    if ( !result )
      return result;
    v7 = result[4];
    v8 = *(_DWORD *)(a1 + 16);
    if ( ((unsigned __int8)v7 & (unsigned __int8)~(_BYTE)v8 & 7) == 0
      && ((unsigned __int8)v8 & (unsigned __int8)~(_BYTE)v7 & 0x60) == 0
      && *(_QWORD *)(a1 + 24) == *((_QWORD *)result + 3) )
    {
      return (_DWORD *)(*(_QWORD *)(a1 + 32) == *((_QWORD *)result + 4));
    }
    return 0LL;
  }
  v9 = *(const void **)(a1 + 24);
  v10 = &unk_69D22D0;
  if ( v9
    && __dynamic_cast(
         v9,
         (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
         (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__function_type_info,
         0LL) )
  {
    v10 = &unk_69D22C0;
  }
  *a3 = v10;
  return &dword_0 + 1;
}
