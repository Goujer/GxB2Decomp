_BYTE *__fastcall sub_B6B18(const char **a1, const char **lpsrc)
{
  _BYTE *result; // x0

  if ( ((_BYTE)a1[2] & 0x18) != 0 )
    return (_BYTE *)(strcmp(a1[1], lpsrc[1]) == 0);
  if ( !lpsrc )
    return 0LL;
  result = __dynamic_cast(
             lpsrc,
             (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__shim_type_info,
             (const struct __class_type_info *)&`typeinfo for'__cxxabiv1::__pbase_type_info,
             0LL);
  if ( result )
  {
    if ( (result[16] & 0x18) == 0 )
      return (_BYTE *)(a1 == lpsrc);
    return (_BYTE *)(strcmp(a1[1], lpsrc[1]) == 0);
  }
  return result;
}
