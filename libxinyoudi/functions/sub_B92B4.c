__int64 __fastcall sub_B92B4(__int64 *src, __int64 a2)
{
  int v4; // w0
  __int64 v5; // x26
  char *v6; // x22
  __int64 i; // x20
  unsigned int v8; // w0
  __int64 v9; // x0
  unsigned __int64 v10; // x1
  __int64 result; // x0
  __int64 v12; // [xsp+70h] [xbp+70h] BYREF
  __int64 v13; // [xsp+78h] [xbp+78h] BYREF
  _QWORD v14[110]; // [xsp+80h] [xbp+80h] BYREF
  char v15; // [xsp+3F7h] [xbp+3F7h]

  memcpy(v14, src, 0x3C0uLL);
  if ( ((v14[104] & 0x4000000000000000LL) == 0 || !v15) && !v14[31] )
    sub_B8100((__int64)v14, src[98], &v12);
  if ( (src[104] & 0x4000000000000000LL) != 0 )
    *((_BYTE *)src + 887) = 0;
  v4 = *(_DWORD *)(a2 + 1600);
  src[31] = 0LL;
  if ( v4 != 1 )
  {
    if ( v4 == 2 )
      ((void (__fastcall __noreturn *)(_QWORD, __int64 *))loc_B7E94)(*(_QWORD *)(a2 + 1592), &v13);
    abort();
  }
  src[98] = Unwind_GetGR((__int64)v14, *(_DWORD *)(a2 + 1584)) + *(_QWORD *)(a2 + 1576);
  v5 = a2;
  v6 = (char *)(src + 107);
  for ( i = 0LL; i != 98; ++i )
  {
    v8 = *(_DWORD *)(v5 + 8) - 1;
    if ( v8 <= 4 )
      __asm { BR              X0 }
    v5 += 16LL;
    ++v6;
  }
  v9 = src[104];
  v10 = v9 | 0x8000000000000000LL;
  result = v9 & 0x7FFFFFFFFFFFFFFFLL;
  if ( *(_BYTE *)(a2 + 1651) )
    result = v10;
  src[104] = result;
  return result;
}
