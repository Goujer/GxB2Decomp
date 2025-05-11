__int64 __fastcall sub_B94C0(_QWORD *a1, __int64 a2, __int64 a3)
{
  __int64 v3; // x30
  __int64 result; // x0
  __int64 v8; // [xsp+48h] [xbp+48h] BYREF
  _QWORD v9[200]; // [xsp+50h] [xbp+50h] BYREF
  int v10; // [xsp+690h] [xbp+690h]

  memset(a1, 0, 0x3C0uLL);
  a1[99] = v3;
  a1[104] = 0x4000000000000000LL;
  if ( (unsigned int)sub_B88DC((int)a1, v9) )
    abort();
  if ( (!&pthread_create || pthread_once((pthread_once_t *)&algn_69EA2E1[3], (void (*)(void))sub_B7FEC))
    && !byte_69EA280[0] )
  {
    sub_B7FEC();
  }
  sub_B8100((__int64)a1, a2, &v8);
  v9[197] = 0LL;
  v10 = 1;
  v9[198] = 31LL;
  result = sub_B92B4(a1, (__int64)v9);
  a1[99] = a3;
  return result;
}
