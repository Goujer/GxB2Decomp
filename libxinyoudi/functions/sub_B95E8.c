__int64 __fastcall sub_B95E8(_QWORD *a1, __int64 *a2)
{
  int v4; // w24
  int v5; // w22
  __int64 result; // x0
  char v7[1616]; // [xsp+40h] [xbp+40h] BYREF
  __int64 (__fastcall *v8)(__int64, _QWORD, _QWORD, _QWORD *, __int64 *); // [xsp+690h] [xbp+690h]

  while ( 1 )
  {
    v4 = sub_B88DC(a2, v7);
    v5 = _Unwind_GetCFA() - ((unsigned __int64)a2[104] >> 63) == a1[3] ? 4 : 0;
    if ( v4 )
      break;
    if ( v8 )
    {
      result = v8(1LL, v5 | 2u, *a1, a1, a2);
      if ( (_DWORD)result == 7 )
        return result;
      if ( (_DWORD)result != 8 )
        break;
    }
    if ( v5 )
      abort();
    sub_B959C(a2, (__int64)v7);
  }
  return 2LL;
}
