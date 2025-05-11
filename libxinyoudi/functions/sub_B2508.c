__int64 __fastcall sub_B2508(size_t *a1, __int64 a2, unsigned __int64 a3, char *a4)
{
  size_t v7; // x8
  char *v9; // x25
  unsigned __int64 v10; // x28
  size_t v11; // x23
  char *v12; // x9
  size_t v13; // x10
  _BYTE *v14; // x0
  unsigned __int64 v15; // x10
  char *v16; // x8
  _BYTE *v17; // x9
  _OWORD *v18; // x11
  __int128 *v19; // x12
  unsigned __int64 v20; // x13
  __int128 v21; // q0
  __int128 v22; // q1
  size_t v23; // x27
  unsigned __int64 v24; // x21
  char *v25; // x8
  size_t v26; // x24
  char v27; // t1
  char *v28; // x2
  unsigned __int64 v29; // x8
  __int64 v30; // x19
  __int64 v31; // x21
  size_t v32; // x9
  unsigned __int64 v33; // x8
  size_t v34; // x26
  char *v35; // x0
  char *v36; // x8
  char *v37; // x9
  unsigned __int64 v38; // x10
  __int128 *v39; // x11
  char *v40; // x12
  unsigned __int64 v41; // x13
  __int128 v42; // q0
  __int128 v43; // q1
  char v44; // t1
  char *v45; // x8
  char *src; // [xsp+10h] [xbp-80h]
  unsigned __int64 v49; // [xsp+20h] [xbp-70h] BYREF
  unsigned __int64 v50; // [xsp+28h] [xbp-68h]
  void *p; // [xsp+30h] [xbp-60h]
  __int64 v52; // [xsp+38h] [xbp-58h]

  v52 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  v7 = *(unsigned __int8 *)a1;
  if ( (v7 & 1) != 0 )
    v9 = (char *)a1[2];
  else
    v9 = (char *)a1 + 1;
  v10 = (unsigned __int64)&a4[-a3];
  v11 = a2 - (_QWORD)v9;
  if ( a4 == (char *)a3 )
    goto LABEL_74;
  if ( (v7 & 1) != 0 )
  {
    v13 = a1[1];
    v12 = (char *)a1[2];
    if ( (unsigned __int64)v12 > a3 )
    {
LABEL_19:
      if ( (v7 & 1) != 0 )
      {
        v7 = *a1;
        v23 = a1[1];
        v24 = (*a1 & 0xFFFFFFFFFFFFFFFELL) - 1;
      }
      else
      {
        v23 = v7 >> 1;
        v24 = 22LL;
      }
      if ( v24 - v23 >= v10 )
      {
        if ( (v7 & 1) != 0 )
          v26 = a1[2];
        else
          v26 = (size_t)a1 + 1;
        v31 = a2;
        if ( v23 != v11 )
        {
          memmove((void *)(v26 + v11 + v10), (const void *)(v26 + v11), v23 - v11);
          LOBYTE(v7) = *(_BYTE *)a1;
        }
        v32 = v23 + v10;
        if ( (v7 & 1) == 0 )
        {
          *(_BYTE *)a1 = 2 * v32;
LABEL_62:
          *(_BYTE *)(v26 + v32) = 0;
          if ( (char *)a3 == a4 )
            goto LABEL_74;
          v36 = (char *)(v26 + v11);
          if ( v10 < 0x20 )
          {
            v37 = (char *)a3;
            goto LABEL_73;
          }
          v38 = v10 & 0xFFFFFFFFFFFFFFE0LL;
          if ( (v10 & 0xFFFFFFFFFFFFFFE0LL) == 0 )
          {
            v37 = (char *)a3;
            do
            {
LABEL_73:
              v44 = *v37++;
              *v36++ = v44;
            }
            while ( a4 != v37 );
            goto LABEL_74;
          }
          if ( v36 < a4 && (unsigned __int64)&a4[v31 - a3 - (_QWORD)v9 + v26] > a3 )
          {
            v37 = (char *)a3;
            goto LABEL_73;
          }
          v36 += v38;
          v37 = (char *)(a3 + v38);
          v39 = (__int128 *)(a3 + 16);
          v40 = (char *)(v26 + v31 + 16 - (_QWORD)v9);
          v41 = v10 & 0xFFFFFFFFFFFFFFE0LL;
          do
          {
            v42 = *(v39 - 1);
            v43 = *v39;
            v39 += 2;
            v41 -= 32LL;
            *((_OWORD *)v40 - 1) = v42;
            *(_OWORD *)v40 = v43;
            v40 += 32;
          }
          while ( v41 );
          if ( v10 != v38 )
            goto LABEL_73;
LABEL_74:
          if ( (*(_BYTE *)a1 & 1) != 0 )
            v45 = (char *)a1[2];
          else
            v45 = (char *)a1 + 1;
          return (__int64)&v45[v11];
        }
LABEL_61:
        a1[1] = v32;
        goto LABEL_62;
      }
      if ( -17LL - v24 >= v23 + v10 - v24 )
      {
        if ( (v7 & 1) != 0 )
          v25 = (char *)a1[2];
        else
          v25 = (char *)a1 + 1;
        src = v25;
        if ( v24 > 0x7FFFFFFFFFFFFFE6LL )
        {
          v34 = -17LL;
        }
        else
        {
          v33 = 2 * v24;
          if ( v23 + v10 >= 2 * v24 )
            v33 = v23 + v10;
          if ( v33 >= 0x17 )
            v34 = (v33 + 16) & 0xFFFFFFFFFFFFFFF0LL;
          else
            v34 = 23LL;
        }
        v35 = (char *)malloc(v34);
        v26 = (size_t)v35;
        if ( v11 )
          memcpy(v35, src, v11);
        if ( v23 != v11 )
          memcpy((void *)(v26 + v11 + v10), &src[v11], v23 - v11);
        if ( v24 != 22 )
          free(src);
        a1[2] = v26;
        *a1 = v34 | 1;
        v31 = a2;
        v32 = v23 + v10;
        goto LABEL_61;
      }
LABEL_79:
      abort();
    }
  }
  else
  {
    v12 = (char *)a1 + 1;
    v13 = v7 >> 1;
    if ( (unsigned __int64)a1 + 1 > a3 )
      goto LABEL_19;
  }
  if ( (unsigned __int64)&v12[v13] <= a3 )
    goto LABEL_19;
  v50 = 0LL;
  p = 0LL;
  v49 = 0LL;
  if ( v10 >= 0xFFFFFFFFFFFFFFF0LL )
    goto LABEL_79;
  if ( v10 <= 0x16 )
  {
    LOBYTE(v49) = 2 * v10;
    v14 = (char *)&v49 + 1;
    if ( (char *)a3 == a4 )
      goto LABEL_33;
LABEL_13:
    if ( v10 >= 0x20 && (v15 = v10 & 0xFFFFFFFFFFFFFFE0LL, (v10 & 0xFFFFFFFFFFFFFFE0LL) != 0) )
    {
      v16 = (char *)(a3 + v15);
      v17 = &v14[v15];
      v18 = v14 + 16;
      v19 = (__int128 *)(a3 + 16);
      v20 = v10 & 0xFFFFFFFFFFFFFFE0LL;
      do
      {
        v21 = *(v19 - 1);
        v22 = *v19;
        v20 -= 32LL;
        v19 += 2;
        *(v18 - 1) = v21;
        *v18 = v22;
        v18 += 2;
      }
      while ( v20 );
      if ( v10 == v15 )
        goto LABEL_32;
    }
    else
    {
      v16 = (char *)a3;
      v17 = v14;
    }
    do
    {
      v27 = *v16++;
      *v17++ = v27;
    }
    while ( a4 != v16 );
LABEL_32:
    v14 += v10;
    goto LABEL_33;
  }
  v14 = malloc((v10 + 16) & 0xFFFFFFFFFFFFFFF0LL);
  v50 = (unsigned __int64)&a4[-a3];
  p = v14;
  v49 = (v10 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
  if ( (char *)a3 != a4 )
    goto LABEL_13;
LABEL_33:
  *v14 = 0;
  if ( (v49 & 1) != 0 )
    v28 = (char *)p;
  else
    v28 = (char *)&v49 + 1;
  if ( (v49 & 1) != 0 )
    v29 = v50;
  else
    v29 = (unsigned __int64)(unsigned __int8)v49 >> 1;
  v30 = sub_B2508(a1, a2, v28, &v28[v29]);
  if ( (v49 & 1) != 0 )
    free(p);
  return v30;
}
