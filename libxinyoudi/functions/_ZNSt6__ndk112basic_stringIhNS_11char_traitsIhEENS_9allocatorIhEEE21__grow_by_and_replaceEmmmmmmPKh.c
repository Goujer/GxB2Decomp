void __fastcall std::basic_string<unsigned char>::__grow_by_and_replace(
        __int64 a1,
        unsigned __int64 a2,
        unsigned __int64 a3,
        __int64 a4,
        unsigned __int64 a5,
        __int64 a6,
        unsigned __int64 a7,
        __int64 a8)
{
  char *v15; // x22
  unsigned __int64 v16; // x8
  __int64 v17; // x23
  unsigned __int64 v18; // x0
  unsigned __int64 v19; // x24
  _BYTE *v20; // x8
  unsigned __int64 v21; // x9
  char *v22; // x10
  unsigned __int64 v23; // x11
  __int128 *v24; // x12
  _OWORD *v25; // x13
  unsigned __int64 v26; // x14
  __int128 v27; // q0
  __int128 v28; // q1
  char v29; // t1
  _BYTE *v30; // x8
  unsigned __int64 v31; // x11
  unsigned __int64 v32; // x9
  char *v33; // x10
  __int128 *v34; // x12
  _OWORD *v35; // x13
  unsigned __int64 v36; // x14
  __int128 v37; // q0
  __int128 v38; // q1
  char v39; // t1
  __int64 v40; // x28
  unsigned __int64 v41; // x8
  char *v42; // x9
  char *v43; // x10
  unsigned __int64 v44; // x11
  char *v45; // x13
  _OWORD *v46; // x14
  unsigned __int64 v47; // x15
  __int128 v48; // q0
  __int128 v49; // q1
  char v50; // t1

  if ( -18LL - a2 < a3 )
    abort();
  if ( (*(_BYTE *)a1 & 1) != 0 )
    v15 = *(char **)(a1 + 16);
  else
    v15 = (char *)(a1 + 1);
  if ( a2 > 0x7FFFFFFFFFFFFFE6LL )
  {
    v17 = -17LL;
  }
  else
  {
    v16 = a3 + a2;
    if ( a3 + a2 < 2 * a2 )
      v16 = 2 * a2;
    if ( v16 >= 0x17 )
      v17 = (v16 + 16) & 0xFFFFFFFFFFFFFFF0LL;
    else
      v17 = 23LL;
  }
  v18 = operator new(v17);
  v19 = v18;
  if ( a5 )
  {
    v20 = (_BYTE *)v18;
    v21 = a5;
    v22 = v15;
    if ( a5 < 0x20 )
      goto LABEL_45;
    v23 = a5 & 0xFFFFFFFFFFFFFFE0LL;
    v20 = (_BYTE *)v18;
    v21 = a5;
    v22 = v15;
    if ( (a5 & 0xFFFFFFFFFFFFFFE0LL) == 0 )
      goto LABEL_45;
    if ( v18 < (unsigned __int64)&v15[a5] )
    {
      v20 = (_BYTE *)v18;
      v21 = a5;
      v22 = v15;
      if ( (unsigned __int64)v15 < v18 + a5 )
        goto LABEL_45;
    }
    v20 = (_BYTE *)(v18 + v23);
    v21 = a5 - v23;
    v22 = &v15[v23];
    v24 = (__int128 *)(v15 + 16);
    v25 = (_OWORD *)(v18 + 16);
    v26 = a5 & 0xFFFFFFFFFFFFFFE0LL;
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
    if ( v23 != a5 )
    {
LABEL_45:
      do
      {
        v29 = *v22++;
        --v21;
        *v20++ = v29;
      }
      while ( v21 );
    }
  }
  if ( a7 )
  {
    v30 = (_BYTE *)(v18 + a5);
    if ( a7 >= 0x20 && (v31 = a7 & 0xFFFFFFFFFFFFFFE0LL, (a7 & 0xFFFFFFFFFFFFFFE0LL) != 0) )
    {
      v30 += v31;
      v32 = a7 - v31;
      v33 = (char *)(a8 + v31);
      v34 = (__int128 *)(a8 + 16);
      v35 = (_OWORD *)(v18 + a5 + 16);
      v36 = a7 & 0xFFFFFFFFFFFFFFE0LL;
      do
      {
        v37 = *(v34 - 1);
        v38 = *v34;
        v34 += 2;
        v36 -= 32LL;
        *(v35 - 1) = v37;
        *v35 = v38;
        v35 += 2;
      }
      while ( v36 );
      if ( v31 == a7 )
        goto LABEL_30;
    }
    else
    {
      v32 = a7;
      v33 = (char *)a8;
    }
    do
    {
      v39 = *v33++;
      --v32;
      *v30++ = v39;
    }
    while ( v32 );
  }
LABEL_30:
  v40 = a4 - a6;
  v41 = a4 - a6 - a5;
  if ( v41 )
  {
    v42 = (char *)(v18 + a5 + a7);
    v43 = &v15[a5 + a6];
    if ( v41 < 0x20 )
      goto LABEL_46;
    v44 = v41 & 0xFFFFFFFFFFFFFFE0LL;
    if ( (v41 & 0xFFFFFFFFFFFFFFE0LL) == 0 || v42 < &v15[a4] && (unsigned __int64)v43 < v18 + a7 + a4 - a6 )
      goto LABEL_46;
    v42 += v44;
    v43 += v44;
    v45 = &v15[a6 + 16 + a5];
    v46 = (_OWORD *)(v18 + a7 + a5 + 16);
    v47 = v41 & 0xFFFFFFFFFFFFFFE0LL;
    do
    {
      v48 = *((_OWORD *)v45 - 1);
      v49 = *(_OWORD *)v45;
      v47 -= 32LL;
      v45 += 32;
      *(v46 - 1) = v48;
      *v46 = v49;
      v46 += 2;
    }
    while ( v47 );
    v41 -= v44;
    if ( v41 )
    {
LABEL_46:
      do
      {
        v50 = *v43++;
        --v41;
        *v42++ = v50;
      }
      while ( v41 );
    }
  }
  if ( a2 != 22 )
    operator delete(v15);
  *(_QWORD *)a1 = v17 | 1;
  *(_QWORD *)(a1 + 8) = v40 + a7;
  *(_QWORD *)(a1 + 16) = v19;
  *(_BYTE *)(v19 + v40 + a7) = 0;
}
