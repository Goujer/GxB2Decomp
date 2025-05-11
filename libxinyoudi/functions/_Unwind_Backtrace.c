__int64 __fastcall Unwind_Backtrace(
        unsigned int (__fastcall *a1)(__int64 *, __int64),
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
  int v12; // w0
  int v13; // w19
  __int64 v15[120]; // [xsp+A0h] [xbp+A0h] BYREF
  char v16[1664]; // [xsp+460h] [xbp+460h] BYREF

  sub_B94C0(v15, (__int64)&a9, v9);
  while ( 1 )
  {
    v12 = sub_B88DC(v15, v16);
    v13 = v12;
    if ( v12 != 5 && v12 || a1(v15, a2) )
      return 3LL;
    if ( v13 == 5 )
      break;
    sub_B959C(v15, (__int64)v16);
  }
  return 5LL;
}
