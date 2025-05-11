_QWORD *__fastcall sub_B6FC8(__int64 a1, void *lpsrc)
{
  _QWORD *result; // x0

  if ( lpsrc )
  {
    result = __dynamic_cast(
               lpsrc,
               (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
               (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__pointer_to_member_type_info,
               0LL);
    if ( !result )
      return result;
    if ( ((_DWORD)result[2] & ~*(_DWORD *)(a1 + 16)) == 0 && *(_QWORD *)(a1 + 24) == result[3] )
      return (_QWORD *)(*(_QWORD *)(a1 + 32) == result[4]);
  }
  return 0LL;
}
