void __fastcall __noreturn Unwind_Resume(
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
  _QWORD v12[120]; // [xsp+D0h] [xbp+D0h] BYREF
  __int64 v13[98]; // [xsp+490h] [xbp+490h] BYREF

  sub_B94C0(v12, (__int64)&a9, v9);
  memcpy(v13, v12, 0x3C0uLL);
  if ( a1[2] )
    v11 = sub_B96A8(a1, v13);
  else
    v11 = sub_B95E8(a1, v13);
  if ( v11 != 7 )
    abort();
  sub_B8194((__int64)v12, (__int64)v13);
  nullsub_1();
}
