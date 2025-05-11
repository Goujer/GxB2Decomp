void __fastcall __noreturn Unwind_Resume_or_Rethrow(
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
  _QWORD v11[120]; // [xsp+D0h] [xbp+D0h] BYREF
  __int64 v12[98]; // [xsp+490h] [xbp+490h] BYREF

  if ( a1[2] )
  {
    sub_B94C0(v11, (__int64)&a9, v9);
    memcpy(v12, v11, 0x3C0uLL);
    if ( (unsigned int)sub_B96A8(a1, v12) != 7 )
      abort();
    sub_B8194((__int64)v11, (__int64)v12);
    nullsub_1();
  }
  else
  {
    _Unwind_RaiseException();
  }
}
