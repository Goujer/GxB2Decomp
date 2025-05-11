__int64 __fastcall sub_B8100(__int64 result, __int64 a2, _QWORD *a3)
{
  if ( byte_69EA29F != 8 )
    abort();
  *a3 = a2;
  if ( (*(_QWORD *)(result + 832) & 0x4000000000000000LL) != 0 )
    *(_BYTE *)(result + 887) = 0;
  *(_QWORD *)(result + 248) = a3;
  return result;
}
