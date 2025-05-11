_QWORD *__fastcall Unwind_RaiseException(
        _QWORD *a1,
        __int64 a2,
        __int64 a3,
        __int64 a4,
        __int64 a5,
        __int64 a6,
        __int64 a7,
        __int64 a8,
        __int64 a9)
{
  __int64 v9; // x30
  int v11; // w0
  _QWORD v14[120]; // [xsp+D0h] [xbp+D0h] BYREF
  __int64 v15[120]; // [xsp+490h] [xbp+490h] BYREF
  char v16[1616]; // [xsp+850h] [xbp+850h] BYREF
  __int64 (__fastcall *v17)(__int64, __int64, _QWORD, _QWORD *, __int64 *); // [xsp+EA0h] [xbp+EA0h]

  sub_B94C0(v14, (__int64)&a9, v9);
  memcpy(v15, v14, sizeof(v15));
  while ( !(unsigned int)sub_B88DC(v15, v16) )
  {
    if ( v17 )
    {
      v11 = v17(1LL, 1LL, *a1, a1, v15);
      if ( v11 == 6 )
      {
        a1[2] = 0LL;
        a1[3] = _Unwind_GetCFA() - ((unsigned __int64)v15[104] >> 63);
        memcpy(v15, v14, sizeof(v15));
        if ( (unsigned int)sub_B95E8(a1, v15) == 7 )
        {
          sub_B8194((__int64)v14, (__int64)v15);
          nullsub_1();
        }
        return a1;
      }
      if ( v11 != 8 )
        return a1;
    }
    sub_B959C(v15, (__int64)v16);
  }
  return a1;
}
