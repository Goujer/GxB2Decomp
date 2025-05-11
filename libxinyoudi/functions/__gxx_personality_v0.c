__int64 __fastcall _gxx_personality_v0(int a1, __int64 a2, __int64 a3, _DWORD *a4, __int64 a5)
{
  bool v6; // zf
  __int64 result; // x0
  unsigned __int64 v8; // x21
  __int64 v9; // x0
  __int64 v10; // x1
  __int64 v11; // x2
  __int64 v12; // x3
  __int64 v13; // x4
  __int64 v14; // [xsp+8h] [xbp-68h] BYREF
  __int128 v15; // [xsp+10h] [xbp-60h]
  __int128 v16; // [xsp+20h] [xbp-50h]
  unsigned int v17; // [xsp+30h] [xbp-40h]
  __int64 v18; // [xsp+38h] [xbp-38h]

  v6 = a1 == 1;
  result = 3LL;
  v18 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( v6 && a4 && a5 )
  {
    v8 = a3 & 0xFFFFFFFFFFFFFF00LL;
    if ( (a2 & 1) != 0 )
    {
      sub_8EEDC(&v14, a2, v8 == 0x434C4E47432B2B00LL, a4, a5);
      result = v17;
      if ( v17 == 6 && v8 == 0x434C4E47432B2B00LL )
      {
        result = 6LL;
        *(a4 - 11) = v14;
        *(_OWORD *)(a4 - 10) = v15;
        *(_OWORD *)(a4 - 6) = v16;
      }
    }
    else
    {
      if ( (a2 & 2) == 0 )
        return 3LL;
      if ( (a2 & 4) != 0 )
      {
        if ( v8 == 0x434C4E47432B2B00LL )
        {
          v14 = (int)*(a4 - 11);
          v15 = *(_OWORD *)(a4 - 10);
          v16 = *(_OWORD *)(a4 - 6);
        }
        else
        {
          sub_8EEDC(&v14, a2, 0LL, a4, a5);
          if ( v17 != 6 )
          {
            v9 = sub_8F4D0(0, a4);
            return sub_8EEDC(v9, v10, v11, v12, v13);
          }
        }
      }
      else
      {
        sub_8EEDC(&v14, a2, v8 == 0x434C4E47432B2B00LL, a4, a5);
        result = v17;
        if ( v17 != 6 )
          return result;
      }
      _Unwind_SetGR();
      _Unwind_SetGR();
      _Unwind_SetIP();
      return 7LL;
    }
  }
  return result;
}
