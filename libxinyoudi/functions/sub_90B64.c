void __fastcall sub_90B64(_BYTE *a1, unsigned __int64 a2, _QWORD *a3, _DWORD *a4)
{
  int v7; // w8
  _BYTE *v8; // x23
  _BYTE *v9; // x0
  unsigned __int64 v10; // x22
  unsigned __int64 v11; // x25
  _BYTE *v12; // x0
  _BYTE *v13; // x0
  _BYTE *v14; // x22
  _BYTE *v15; // x8
  _BYTE *v16; // x22
  char *v17; // x8
  unsigned __int64 v18; // x9
  unsigned __int64 v19; // x10
  _BYTE *v20; // x11
  _OWORD *v21; // x12
  __int128 *v22; // x13
  unsigned __int64 v23; // x14
  __int128 v24; // q0
  __int128 v25; // q1
  _BYTE *v26; // x9
  char v27; // t1
  void *v28; // x8
  __int128 v29; // q0
  __int128 v30; // q0
  char *v31; // x8
  char v32; // w22
  void *v33; // x21
  char *v34; // x1
  size_t v35; // x2
  __int64 v36; // x8
  __int128 v37; // [xsp+8h] [xbp-98h] BYREF
  void *v38; // [xsp+18h] [xbp-88h]
  __int128 v39; // [xsp+20h] [xbp-80h] BYREF
  void *p; // [xsp+30h] [xbp-70h]
  __int128 v41; // [xsp+40h] [xbp-60h] BYREF
  char *v42; // [xsp+50h] [xbp-50h]
  __int64 v43; // [xsp+58h] [xbp-48h]

  v43 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( (unsigned __int64)a1 >= a2 )
    goto LABEL_15;
  if ( *a1 != 95 )
  {
    v13 = (_BYTE *)sub_925FC();
    goto LABEL_14;
  }
  if ( (__int64)(a2 - (_QWORD)a1) < 4 )
    goto LABEL_15;
  v7 = (unsigned __int8)a1[1];
  if ( v7 == 95 )
  {
    if ( a1[2] != 95 )
      goto LABEL_15;
    if ( a1[3] != 90 )
      goto LABEL_15;
    v14 = a1 + 4;
    v13 = (_BYTE *)sub_91038(a1 + 4, a2, a3);
    if ( v13 == v14 || v13 == (_BYTE *)a2 )
      goto LABEL_15;
    if ( (__int64)(a2 - (_QWORD)v13) >= 13
      && *v13 == 95
      && v13[1] == 98
      && v13[2] == 108
      && v13[3] == 111
      && v13[4] == 99
      && v13[5] == 107
      && v13[6] == 95
      && v13[7] == 105
      && v13[8] == 110
      && v13[9] == 118
      && v13[10] == 111
      && v13[11] == 107
      && v13[12] == 101 )
    {
      v15 = v13 + 13;
      v16 = (_BYTE *)a2;
      if ( v13 + 13 != (_BYTE *)a2 )
      {
        if ( *v15 == 95 )
        {
          if ( v13 + 14 == (_BYTE *)a2 || (unsigned int)(unsigned __int8)v13[14] - 48 > 9 )
            goto LABEL_14;
          v15 = v13 + 15;
        }
        v16 = (_BYTE *)a2;
        if ( v15 != (_BYTE *)a2 )
        {
          while ( (unsigned int)(unsigned __int8)*v15 - 48 <= 9 )
          {
            if ( (_BYTE *)a2 == ++v15 )
            {
              v16 = (_BYTE *)a2;
              goto LABEL_76;
            }
          }
          v16 = v15;
        }
      }
LABEL_76:
      v36 = a3[1];
      if ( *a3 != v36 )
      {
        sub_9CDD8(v36 - 48, 0, "invocation function for block in ", 0x21uLL);
        if ( v16 == (_BYTE *)a2 )
          goto LABEL_45;
LABEL_15:
        *a4 = -2;
        return;
      }
    }
LABEL_14:
    if ( v13 == (_BYTE *)a2 )
      goto LABEL_45;
    goto LABEL_15;
  }
  if ( v7 != 90 )
    goto LABEL_15;
  v8 = a1 + 2;
  v9 = (_BYTE *)sub_91038(a1 + 2, a2, a3);
  v10 = (unsigned __int64)v9;
  if ( v9 == v8 || v9 == (_BYTE *)a2 || *v9 != 46 || *a3 == a3[1] )
  {
    if ( v9 == (_BYTE *)a2 )
      goto LABEL_45;
    goto LABEL_15;
  }
  v11 = a2 - (_QWORD)v9;
  v38 = 0LL;
  v37 = 0uLL;
  if ( a2 - (unsigned __int64)v9 >= 0xFFFFFFFFFFFFFFF0LL )
    abort();
  if ( v11 > 0x16 )
  {
    v12 = malloc((v11 + 16) & 0xFFFFFFFFFFFFFFF0LL);
    *((_QWORD *)&v37 + 1) = a2 - v10;
    v38 = v12;
    *(_QWORD *)&v37 = (v11 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
  }
  else
  {
    LOBYTE(v37) = 2 * v11;
    v12 = (char *)&v37 + 1;
  }
  v17 = (char *)(v10 + 1);
  *v12 = 46;
  if ( v10 + 1 != a2 )
  {
    v18 = a2 + ~v10;
    if ( v18 >= 0x20 && (v19 = v18 & 0xFFFFFFFFFFFFFFE0LL, (v18 & 0xFFFFFFFFFFFFFFE0LL) != 0) )
    {
      if ( (unsigned __int64)(v12 + 1) >= a2 || (v20 = v12, v17 >= &v12[v11]) )
      {
        v17 += v19;
        v20 = &v12[v19];
        v21 = v12 + 17;
        v22 = (__int128 *)(v10 + 17);
        v23 = v18 & 0xFFFFFFFFFFFFFFE0LL;
        do
        {
          v24 = *(v22 - 1);
          v25 = *v22;
          v23 -= 32LL;
          v22 += 2;
          *(v21 - 1) = v24;
          *v21 = v25;
          v21 += 2;
        }
        while ( v23 );
        if ( v19 == v18 )
          goto LABEL_61;
      }
    }
    else
    {
      v20 = v12;
    }
    v26 = v20 + 1;
    do
    {
      v27 = *v17++;
      *v26++ = v27;
    }
    while ( (char *)a2 != v17 );
  }
LABEL_61:
  v12[v11] = 0;
  sub_9CDD8((int)&v37, 0, " (", 2uLL);
  v28 = v38;
  v29 = v37;
  v38 = 0LL;
  v37 = 0uLL;
  p = v28;
  v39 = v29;
  sub_9CFD0((int)&v39, ")", 1uLL);
  v30 = v39;
  v31 = (char *)p;
  p = 0LL;
  v39 = 0uLL;
  v41 = v30;
  v42 = v31;
  v32 = v30;
  v33 = v31;
  if ( (v30 & 1) != 0 )
    v34 = v31;
  else
    v34 = (char *)&v41 + 1;
  if ( (v30 & 1) != 0 )
    v35 = *((_QWORD *)&v30 + 1);
  else
    v35 = (unsigned __int64)(unsigned __int8)v30 >> 1;
  sub_9CFD0(*((_DWORD *)a3 + 2) - 48, v34, v35);
  if ( (v32 & 1) == 0 )
  {
    if ( (v39 & 1) == 0 )
      goto LABEL_69;
LABEL_72:
    free(p);
    if ( (v37 & 1) != 0 )
      goto LABEL_73;
    goto LABEL_45;
  }
  free(v33);
  if ( (v39 & 1) != 0 )
    goto LABEL_72;
LABEL_69:
  if ( (v37 & 1) != 0 )
  {
LABEL_73:
    free(v38);
    if ( *a4 )
      return;
    goto LABEL_46;
  }
LABEL_45:
  if ( *a4 )
    return;
LABEL_46:
  if ( *a3 == a3[1] )
    goto LABEL_15;
}
