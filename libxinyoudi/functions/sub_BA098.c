__int64 __fastcall sub_BA098(unsigned __int8 a1, __int64 a2)
{
  unsigned int v2; // w0
  bool v3; // zf

  if ( a1 == 255 )
    return 0LL;
  v2 = a1 & 0x70;
  if ( v2 == 32 )
    return *(_QWORD *)(a2 + 8);
  if ( v2 > 0x20 )
  {
    if ( v2 == 48 )
      return *(_QWORD *)(a2 + 16);
    v3 = v2 == 80;
    goto LABEL_8;
  }
  v3 = v2 == 16;
  if ( v2 )
  {
LABEL_8:
    if ( !v3 )
      abort();
  }
  return 0LL;
}
