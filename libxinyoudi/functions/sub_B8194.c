__int64 __fastcall sub_B8194(__int64 a1, __int64 a2)
{
  __int64 i; // x20
  _QWORD *v5; // x0
  _QWORD *v6; // x1
  __int64 result; // x0
  __int64 v8; // [xsp+38h] [xbp+38h] BYREF

  if ( ((*(_QWORD *)(a2 + 832) & 0x4000000000000000LL) == 0 || !*(_BYTE *)(a2 + 887)) && !*(_QWORD *)(a2 + 248) )
    sub_B8100(a2, *(_QWORD *)(a2 + 784), &v8);
  for ( i = 0LL; i != 97; ++i )
  {
    v5 = *(_QWORD **)(a1 + 8 * i);
    v6 = *(_QWORD **)(a2 + 8 * i);
    if ( *(_BYTE *)(a1 + i + 856) )
LABEL_7:
      abort();
    if ( *(_BYTE *)(a2 + i + 856) && v5 )
    {
      if ( byte_69EA280[i] != 8 )
        goto LABEL_7;
      *v5 = v6;
    }
    else if ( v5 != 0LL && v6 != 0LL && v6 != v5 )
    {
      memcpy(v5, v6, (unsigned __int8)byte_69EA280[i]);
    }
  }
  if ( (*(_QWORD *)(a1 + 832) & 0x4000000000000000LL) == 0 || (result = 0LL, !*(_BYTE *)(a1 + 887)) )
  {
    result = 0LL;
    if ( !*(_QWORD *)(a1 + 248) )
      return Unwind_GetGR(a2, 31) - *(_QWORD *)(a1 + 784) + *(_QWORD *)(a2 + 848);
  }
  return result;
}
