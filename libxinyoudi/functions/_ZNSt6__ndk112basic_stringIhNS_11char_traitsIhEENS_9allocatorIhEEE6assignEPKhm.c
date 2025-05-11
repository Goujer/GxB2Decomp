__int64 *__fastcall std::basic_string<unsigned char>::assign(__int64 *a1, unsigned __int64 a2, unsigned __int64 a3)
{
  __int64 v4; // x10
  unsigned __int64 v5; // x10
  unsigned __int64 v6; // x11
  unsigned __int64 v7; // x12
  unsigned __int64 v8; // x13
  unsigned __int64 v9; // x14
  unsigned __int64 v10; // x15
  __int128 *v11; // x9
  _OWORD *v12; // x15
  __int128 v13; // q0
  __int128 v14; // q1
  unsigned __int64 v15; // x14
  _BYTE *v16; // x11
  unsigned __int64 v17; // x12
  char *v18; // x13
  char v19; // t1
  _BYTE *v20; // x9
  char *v21; // x11
  char v22; // t1
  __int128 *v24; // x9
  _OWORD *v25; // x15
  unsigned __int64 v26; // x16
  __int128 v27; // q0
  __int128 v28; // q1

  LOBYTE(v4) = *(_BYTE *)a1;
  if ( (*(_BYTE *)a1 & 1) == 0 )
  {
    if ( a3 <= 0x16 )
      goto LABEL_3;
LABEL_16:
    std::basic_string<unsigned char>::__grow_by_and_replace();
    return a1;
  }
  v4 = *a1;
  if ( (*a1 & 0xFFFFFFFFFFFFFFFELL) - 1 < a3 )
    goto LABEL_16;
LABEL_3:
  if ( (v4 & 1) != 0 )
  {
    v5 = a1[2];
    if ( v5 >= a2 )
      goto LABEL_5;
  }
  else
  {
    v5 = (unsigned __int64)a1 + 1;
    if ( (unsigned __int64)a1 + 1 >= a2 )
    {
LABEL_5:
      if ( a3 && v5 > a2 )
      {
        v6 = a2 + a3;
        v7 = v5 + a3;
        if ( a3 < 0x20 || (v8 = a3 & 0x1F, v9 = a3 - v8, a3 == v8) )
        {
          v10 = a3;
        }
        else if ( v5 >= v6 || (v10 = a3, v7 <= a2) )
        {
          v7 = v5 + v8;
          v6 = a2 + v8;
          v11 = (__int128 *)(a2 + a3 - 16);
          v12 = (_OWORD *)(v5 + a3 - 16);
          do
          {
            v14 = *(v11 - 1);
            v13 = *v11;
            v9 -= 32LL;
            v11 -= 2;
            *(v12 - 1) = v14;
            *v12 = v13;
            v12 -= 2;
          }
          while ( v9 );
          v10 = a3 & 0x1F;
          if ( (a3 & 0x1F) == 0 )
            goto LABEL_29;
        }
        v20 = (_BYTE *)(v7 - 1);
        v21 = (char *)(v6 - 1);
        do
        {
          v22 = *v21--;
          --v10;
          *v20-- = v22;
        }
        while ( v10 );
      }
      goto LABEL_29;
    }
  }
  if ( a3 )
  {
    if ( a3 >= 0x20
      && (v15 = a3 & 0xFFFFFFFFFFFFFFE0LL, (a3 & 0xFFFFFFFFFFFFFFE0LL) != 0)
      && (v5 >= a2 + a3 || v5 + a3 <= a2) )
    {
      v16 = (_BYTE *)(v5 + v15);
      v17 = a3 - v15;
      v18 = (char *)(a2 + v15);
      v24 = (__int128 *)(a2 + 16);
      v25 = (_OWORD *)(v5 + 16);
      v26 = a3 & 0xFFFFFFFFFFFFFFE0LL;
      do
      {
        v27 = *(v24 - 1);
        v28 = *v24;
        v24 += 2;
        v26 -= 32LL;
        *(v25 - 1) = v27;
        *v25 = v28;
        v25 += 2;
      }
      while ( v26 );
      if ( v15 == a3 )
        goto LABEL_29;
    }
    else
    {
      v16 = (_BYTE *)v5;
      v17 = a3;
      v18 = (char *)a2;
    }
    do
    {
      v19 = *v18++;
      --v17;
      *v16++ = v19;
    }
    while ( v17 );
  }
LABEL_29:
  *(_BYTE *)(v5 + a3) = 0;
  if ( (*(_BYTE *)a1 & 1) != 0 )
    a1[1] = a3;
  else
    *(_BYTE *)a1 = 2 * a3;
  return a1;
}
