__int64 __fastcall sub_B88DC(_QWORD *a1, char *s)
{
  __int64 v4; // x1
  __int64 FDE; // x0
  _DWORD *v7; // x1
  __int64 v8; // x20
  __int64 v9; // x0
  char *v10; // x2
  _DWORD *i; // x0
  char *v12; // x2
  __int64 v13; // x22
  size_t v14; // x0
  __int64 v15; // t1
  __int64 v16; // [xsp+78h] [xbp+78h] BYREF

  memset(s, 0, 0x680uLL);
  v4 = a1[99];
  a1[106] = 0LL;
  a1[100] = 0LL;
  if ( !v4 )
    return 5LL;
  FDE = _Unwind_Find_FDE();
  if ( FDE )
  {
    v13 = FDE + 4 - *(int *)(FDE + 4);
    *((_QWORD *)s + 201) = a1[103];
    v14 = v13 + 9 + strlen((const char *)(v13 + 9)) + 1;
    if ( *(_BYTE *)(v13 + 9) == 101 && *(_BYTE *)(v13 + 10) == 104 )
    {
      v15 = *(_QWORD *)v14;
      v14 += 8LL;
      *((_QWORD *)s + 207) = v15;
    }
    if ( *(unsigned __int8 *)(v13 + 8) > 3u )
    {
      if ( *(_BYTE *)v14 != 8 || *(_BYTE *)(v14 + 1) )
        return 3LL;
      v14 += 2LL;
    }
    ((void (__fastcall __noreturn *)(size_t, __int64 *))loc_B7E94)(v14, &v16);
  }
  v7 = (_DWORD *)a1[99];
  if ( *v7 != -763358872 || v7[1] != -738197503 )
    return 5LL;
  v8 = a1[98];
  *((_QWORD *)s + 198) = 31LL;
  *((_DWORD *)s + 400) = 1;
  *((_QWORD *)s + 197) = 304LL;
  v9 = 8LL;
  v10 = s;
  do
  {
    *((_DWORD *)v10 + 2) = 1;
    *(_QWORD *)v10 = v9;
    v10 += 16;
    v9 += 8LL;
  }
  while ( v9 != 256 );
  for ( i = (_DWORD *)(v8 + 592); *i; i = (_DWORD *)((char *)i + (unsigned int)i[1]) )
  {
    if ( *i == 1179680769 )
    {
      v12 = s + 1024;
      do
      {
        *((_DWORD *)v12 + 2) = 1;
        *(_QWORD *)v12 = &v12[-1312 - v8 - (_QWORD)s + (_QWORD)i];
        v12 += 16;
      }
      while ( v12 != s + 1536 );
    }
  }
  s[1651] = 1;
  *((_QWORD *)s + 62) = 256LL;
  *((_DWORD *)s + 126) = 1;
  *((_DWORD *)s + 386) = 4;
  *((_QWORD *)s + 192) = *(_QWORD *)(v8 + 568) - (v8 + 304);
  *((_QWORD *)s + 205) = 96LL;
  return 0LL;
}
