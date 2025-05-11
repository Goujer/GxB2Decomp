__int64 __fastcall sub_B836C(unsigned __int8 a1)
{
  unsigned int v1; // w2

  if ( a1 == 255 )
    return 0LL;
  v1 = a1 & 0x70;
  if ( v1 == 32 )
    return _Unwind_GetTextRelBase();
  if ( v1 <= 0x20 )
  {
    if ( (a1 & 0x70) == 0 || v1 == 16 )
      return 0LL;
LABEL_13:
    abort();
  }
  if ( v1 == 64 )
    return _Unwind_GetRegionStart();
  if ( v1 != 80 )
  {
    if ( v1 == 48 )
      return _Unwind_GetDataRelBase();
    goto LABEL_13;
  }
  return 0LL;
}
