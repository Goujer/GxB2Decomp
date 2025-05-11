__int64 __fastcall sub_BA278(__int64 a1)
{
  __int64 v1; // x20
  size_t v3; // x0
  char *v4; // x1
  int v5; // w2
  __int64 result; // x0
  char *v7; // x0
  char *v8; // x0
  char *v9; // x0
  unsigned __int8 *v10; // x19
  char *v11; // x0
  int v12; // w1
  unsigned __int64 v13; // [xsp+28h] [xbp+28h] BYREF
  __int64 v14; // [xsp+30h] [xbp+30h] BYREF
  __int64 v15; // [xsp+38h] [xbp+38h] BYREF

  v1 = a1 + 9;
  v3 = strlen((const char *)(a1 + 9)) + 1;
  v4 = (char *)(v1 + v3);
  if ( *(unsigned __int8 *)(a1 + 8) > 3u )
  {
    v5 = *(unsigned __int8 *)(v1 + v3);
    result = 255LL;
    if ( v5 != 8 || v4[1] )
      return result;
    v4 += 2;
  }
  if ( *(_BYTE *)(a1 + 9) != 122 )
    return 0LL;
  v7 = sub_B9DE0(v4, &v14);
  v8 = sub_B9E08(v7, &v15);
  if ( *(_BYTE *)(a1 + 8) == 1 )
    v9 = v8 + 1;
  else
    v9 = sub_B9DE0(v8, &v14);
  v10 = (unsigned __int8 *)(a1 + 10);
  v11 = sub_B9DE0(v9, &v14);
  while ( 1 )
  {
    v12 = *v10;
    if ( v12 == 82 )
      break;
    if ( v12 == 80 )
    {
      v11 = sub_BA0F8(*v11 & 0x7F, 0LL, v11 + 1, &v13);
    }
    else
    {
      if ( v12 != 76 )
        return 0LL;
      ++v11;
    }
    ++v10;
  }
  return (unsigned __int8)*v11;
}
