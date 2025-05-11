_QWORD *__fastcall Unwind_ForcedUnwind(
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
  _QWORD v15[120]; // [xsp+D0h] [xbp+D0h] BYREF
  __int64 v16[98]; // [xsp+490h] [xbp+490h] BYREF

  sub_B94C0(v15, (__int64)&a9, v9);
  memcpy(v16, v15, 0x3C0uLL);
  a1[2] = a2;
  a1[3] = a3;
  if ( (unsigned int)sub_B96A8(a1, v16) == 7 )
  {
    sub_B8194((__int64)v15, (__int64)v16);
    nullsub_1();
  }
  return a1;
}
