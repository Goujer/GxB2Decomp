unsigned __int8 *__fastcall sub_AB6CC(unsigned __int8 *a1, unsigned __int8 *a2, void **a3)
{
  int v6; // w8
  unsigned __int64 v7; // x24
  __int64 v8; // x0
  _BYTE *v9; // x8
  unsigned __int8 *v10; // x20
  unsigned __int64 v11; // x9
  char *v12; // x8
  char *v13; // x9
  void **v14; // x19
  __int64 v15; // x21
  size_t *v16; // x8
  __int64 v17; // x1
  char *v18; // x8
  char *v19; // x9
  void **v20; // x19
  void *v21; // x8
  char *v22; // x8
  char *v23; // x9
  void **v24; // x20
  unsigned __int64 v25; // x21
  _BYTE *v27; // x10
  __int64 v28; // x21
  __int64 v29; // x9
  unsigned __int64 v30; // x9
  __int64 v31; // x22
  char *v32; // x0
  _BYTE *v33; // x10
  __int64 v34; // x20
  __int64 v35; // x9
  unsigned __int64 v36; // x9
  __int64 v37; // x22
  char *v38; // x0
  _QWORD *v39; // x9
  char *v40; // x8
  char *v41; // x10
  void **v42; // x11
  void **v43; // x21
  char *v44; // x9
  __int128 v45; // t1
  void **v46; // x22
  _QWORD *v47; // x9
  void *v48; // x24
  unsigned __int64 v49; // x8
  char *v50; // x8
  char *v51; // x10
  void **v52; // x11
  void **v53; // x20
  char *v54; // x9
  __int128 v55; // t1
  void **v56; // x22
  void **v57; // x21
  void **v58; // x22
  void *v59; // x24
  unsigned __int64 v60; // x8
  void **v61; // x20
  void **v62; // x22
  _BYTE *v63; // x10
  __int64 v64; // x20
  __int64 v65; // x9
  unsigned __int64 v66; // x9
  __int64 v67; // x22
  char *v68; // x0
  _QWORD *v69; // x9
  char *v70; // x8
  char *v71; // x10
  void **v72; // x11
  void **v73; // x20
  char *v74; // x9
  __int128 v75; // t1
  void **v76; // x22
  void *v77; // x24
  unsigned __int64 v78; // x8
  void **v79; // x20
  void **v80; // x22
  void *v81; // [xsp+8h] [xbp-78h] BYREF
  void *p[2]; // [xsp+10h] [xbp-70h] BYREF
  __int64 v83; // [xsp+20h] [xbp-60h]
  unsigned __int64 v84; // [xsp+28h] [xbp-58h]
  __int64 v85; // [xsp+38h] [xbp-48h]

  v85 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( a1 == a2 )
    return a1;
  v6 = *a1;
  if ( v6 == 68 )
  {
    v15 = (__int64)sub_A0A48(a1, a2, a3);
    if ( (unsigned __int8 *)v15 == a1 )
      return a1;
    v21 = a3[1];
    v10 = a1;
    if ( *a3 == v21 )
      return v10;
    v81 = a3[3];
    sub_9D15C((size_t **)p, (__int64)v21 - 48, (__int64 *)&v81);
    v22 = (char *)a3[5];
    v23 = (char *)a3[6];
    if ( v22 < v23 )
    {
      *((_QWORD *)v22 + 3) = v84;
      *(_OWORD *)v22 = *(_OWORD *)p;
      *((_QWORD *)v22 + 2) = v83;
      p[1] = 0LL;
      v83 = 0LL;
      p[0] = 0LL;
      a3[5] = (char *)a3[5] + 32;
      v20 = (void **)p[0];
      if ( !p[0] )
        return (unsigned __int8 *)v15;
      goto LABEL_93;
    }
    v33 = a3[4];
    v34 = (v22 - v33) >> 5;
    if ( (unsigned __int64)(v34 + 1) >> 59 )
      abort();
    v35 = v23 - v33;
    if ( (unsigned __int64)(v35 >> 5) > 0x3FFFFFFFFFFFFFELL )
    {
      v37 = 0x7FFFFFFFFFFFFFFLL;
    }
    else
    {
      v36 = v35 >> 4;
      if ( v36 >= v34 + 1 )
        v37 = v36;
      else
        v37 = v34 + 1;
      if ( !v37 )
      {
        v38 = 0LL;
        goto LABEL_66;
      }
    }
    v47 = a3[7];
    v38 = (char *)v47[512];
    if ( (char *)(v47 + 512) - v38 >= (unsigned __int64)(32 * v37) )
      v47[512] = &v38[32 * v37];
    else
      v38 = (char *)malloc(32 * v37);
LABEL_66:
    v50 = &v38[32 * v34];
    *((_QWORD *)v50 + 1) = 0LL;
    *((_QWORD *)v50 + 2) = 0LL;
    v51 = v50 + 32;
    *((_QWORD *)v50 + 3) = v84;
    *(_OWORD *)v50 = *(_OWORD *)p;
    *((_QWORD *)v50 + 2) = v83;
    p[1] = 0LL;
    v83 = 0LL;
    p[0] = 0LL;
    v53 = (void **)a3[4];
    v52 = (void **)a3[5];
    v54 = &v38[32 * v37];
    if ( v52 == v53 )
    {
      v56 = (void **)a3[4];
    }
    else
    {
      do
      {
        *((_QWORD *)v50 - 3) = 0LL;
        *((_QWORD *)v50 - 2) = 0LL;
        *((_QWORD *)v50 - 4) = 0LL;
        *((_QWORD *)v50 - 1) = *(v52 - 1);
        v55 = *((_OWORD *)v52 - 2);
        v52 -= 4;
        *((_OWORD *)v50 - 2) = v55;
        *((_QWORD *)v50 - 2) = v52[2];
        v50 -= 32;
        v52[1] = 0LL;
        v52[2] = 0LL;
        *v52 = 0LL;
      }
      while ( v53 != v52 );
      v56 = (void **)a3[4];
      v53 = (void **)a3[5];
    }
    v59 = a3[6];
    a3[4] = v50;
    a3[5] = v51;
    a3[6] = v54;
    while ( v56 != v53 )
    {
      v53 -= 4;
      sub_9D32C(v53);
    }
    if ( v56 )
    {
      v60 = (unsigned __int64)a3[7];
      if ( v60 + 4096 < (unsigned __int64)v56 || v60 > (unsigned __int64)v56 )
      {
        free(v56);
      }
      else if ( *(void **)(v60 + 4096) == v59 )
      {
        *(_QWORD *)(v60 + 4096) = v56;
        v20 = (void **)p[0];
        if ( !p[0] )
          return (unsigned __int8 *)v15;
        goto LABEL_93;
      }
    }
    v20 = (void **)p[0];
    if ( !p[0] )
      return (unsigned __int8 *)v15;
LABEL_93:
    v61 = (void **)p[1];
    if ( p[1] != v20 )
    {
      do
      {
        if ( (*(_BYTE *)(v61 - 3) & 1) != 0 )
          free(*(v61 - 1));
        v62 = v61 - 6;
        if ( (*(_BYTE *)(v61 - 6) & 1) != 0 )
          free(*(v61 - 4));
        v61 -= 6;
      }
      while ( v20 != v62 );
    }
    goto LABEL_99;
  }
  if ( v6 == 83 )
  {
    v10 = sub_9E1F8(a1, a2, a3);
    if ( v10 != a1 )
      return v10;
    if ( a2 - a1 < 3 )
      return a1;
    if ( a1[1] != 116 )
      return a1;
    v15 = sub_A0C94(a1 + 2, a2, (char **)a3);
    if ( (unsigned __int8 *)v15 == a1 + 2 )
      return a1;
    v16 = (size_t *)a3[1];
    v10 = a1;
    if ( *a3 == v16 )
      return v10;
    sub_9CDD8(v16 - 6, 0LL, "std::", 5uLL);
    v17 = (__int64)a3[1] - 48;
    v81 = a3[3];
    sub_9D15C((size_t **)p, v17, (__int64 *)&v81);
    v18 = (char *)a3[5];
    v19 = (char *)a3[6];
    if ( v18 < v19 )
    {
      *((_QWORD *)v18 + 3) = v84;
      *(_OWORD *)v18 = *(_OWORD *)p;
      *((_QWORD *)v18 + 2) = v83;
      p[1] = 0LL;
      v83 = 0LL;
      p[0] = 0LL;
      a3[5] = (char *)a3[5] + 32;
      v20 = (void **)p[0];
      if ( !p[0] )
        return (unsigned __int8 *)v15;
      goto LABEL_130;
    }
    v63 = a3[4];
    v64 = (v18 - v63) >> 5;
    if ( (unsigned __int64)(v64 + 1) >> 59 )
      abort();
    v65 = v19 - v63;
    if ( (unsigned __int64)(v65 >> 5) > 0x3FFFFFFFFFFFFFELL )
    {
      v67 = 0x7FFFFFFFFFFFFFFLL;
    }
    else
    {
      v66 = v65 >> 4;
      if ( v66 >= v64 + 1 )
        v67 = v66;
      else
        v67 = v64 + 1;
      if ( !v67 )
      {
        v68 = 0LL;
LABEL_116:
        v70 = &v68[32 * v64];
        *((_QWORD *)v70 + 1) = 0LL;
        *((_QWORD *)v70 + 2) = 0LL;
        v71 = v70 + 32;
        *((_QWORD *)v70 + 3) = v84;
        *(_OWORD *)v70 = *(_OWORD *)p;
        *((_QWORD *)v70 + 2) = v83;
        p[1] = 0LL;
        v83 = 0LL;
        p[0] = 0LL;
        v73 = (void **)a3[4];
        v72 = (void **)a3[5];
        v74 = &v68[32 * v67];
        if ( v72 == v73 )
        {
          v76 = (void **)a3[4];
        }
        else
        {
          do
          {
            *((_QWORD *)v70 - 3) = 0LL;
            *((_QWORD *)v70 - 2) = 0LL;
            *((_QWORD *)v70 - 4) = 0LL;
            *((_QWORD *)v70 - 1) = *(v72 - 1);
            v75 = *((_OWORD *)v72 - 2);
            v72 -= 4;
            *((_OWORD *)v70 - 2) = v75;
            *((_QWORD *)v70 - 2) = v72[2];
            v70 -= 32;
            v72[1] = 0LL;
            v72[2] = 0LL;
            *v72 = 0LL;
          }
          while ( v73 != v72 );
          v76 = (void **)a3[4];
          v73 = (void **)a3[5];
        }
        v77 = a3[6];
        a3[4] = v70;
        a3[5] = v71;
        a3[6] = v74;
        while ( v76 != v73 )
        {
          v73 -= 4;
          sub_9D32C(v73);
        }
        if ( v76 )
        {
          v78 = (unsigned __int64)a3[7];
          if ( v78 + 4096 < (unsigned __int64)v76 || v78 > (unsigned __int64)v76 )
          {
            free(v76);
          }
          else if ( *(void **)(v78 + 4096) == v77 )
          {
            *(_QWORD *)(v78 + 4096) = v76;
            v20 = (void **)p[0];
            if ( !p[0] )
              return (unsigned __int8 *)v15;
            goto LABEL_130;
          }
        }
        v20 = (void **)p[0];
        if ( p[0] )
        {
LABEL_130:
          v79 = (void **)p[1];
          if ( p[1] != v20 )
          {
            do
            {
              if ( (*(_BYTE *)(v79 - 3) & 1) != 0 )
                free(*(v79 - 1));
              v80 = v79 - 6;
              if ( (*(_BYTE *)(v79 - 6) & 1) != 0 )
                free(*(v79 - 4));
              v79 -= 6;
            }
            while ( v20 != v80 );
          }
LABEL_99:
          p[1] = v20;
          if ( v84 + 4096 < (unsigned __int64)v20 || v84 > (unsigned __int64)v20 )
          {
            free(v20);
          }
          else if ( *(_QWORD *)(v84 + 4096) == v83 )
          {
            *(_QWORD *)(v84 + 4096) = v20;
          }
        }
        return (unsigned __int8 *)v15;
      }
    }
    v69 = a3[7];
    v68 = (char *)v69[512];
    if ( (char *)(v69 + 512) - v68 >= (unsigned __int64)(32 * v67) )
      v69[512] = &v68[32 * v67];
    else
      v68 = (char *)malloc(32 * v67);
    goto LABEL_116;
  }
  if ( v6 != 84 )
    return a1;
  v7 = 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a3[1] - (_BYTE *)*a3) >> 4);
  v8 = sub_9F9E8(a1, a2, (__int64)a3);
  v9 = a3[1];
  v10 = (unsigned __int8 *)v8;
  v11 = 0xAAAAAAAAAAAAAAABLL * ((v9 - (_BYTE *)*a3) >> 4);
  if ( (unsigned __int8 *)v8 == a1 || v11 != v7 + 1 )
  {
    if ( v11 != v7 )
    {
      v24 = (void **)(v9 - 48);
      v25 = v7 - v11;
      do
      {
        if ( ((_BYTE)v24[3] & 1) != 0 )
          free(v24[5]);
        if ( (*(_BYTE *)v24 & 1) != 0 )
          free(v24[2]);
        a3[1] = v24;
        ++v25;
        v24 -= 6;
      }
      while ( v25 );
    }
    return a1;
  }
  v81 = a3[3];
  sub_9D15C((size_t **)p, (__int64)(v9 - 48), (__int64 *)&v81);
  v12 = (char *)a3[5];
  v13 = (char *)a3[6];
  if ( v12 < v13 )
  {
    *((_QWORD *)v12 + 3) = v84;
    *(_OWORD *)v12 = *(_OWORD *)p;
    *((_QWORD *)v12 + 2) = v83;
    p[1] = 0LL;
    v83 = 0LL;
    p[0] = 0LL;
    a3[5] = (char *)a3[5] + 32;
    v14 = (void **)p[0];
    if ( !p[0] )
      return v10;
    goto LABEL_71;
  }
  v27 = a3[4];
  v28 = (v12 - v27) >> 5;
  if ( (unsigned __int64)(v28 + 1) >> 59 )
    abort();
  v29 = v13 - v27;
  if ( (unsigned __int64)(v29 >> 5) > 0x3FFFFFFFFFFFFFELL )
  {
    v31 = 0x7FFFFFFFFFFFFFFLL;
  }
  else
  {
    v30 = v29 >> 4;
    if ( v30 >= v28 + 1 )
      v31 = v30;
    else
      v31 = v28 + 1;
    if ( !v31 )
    {
      v32 = 0LL;
      goto LABEL_50;
    }
  }
  v39 = a3[7];
  v32 = (char *)v39[512];
  if ( (char *)(v39 + 512) - v32 >= (unsigned __int64)(32 * v31) )
    v39[512] = &v32[32 * v31];
  else
    v32 = (char *)malloc(32 * v31);
LABEL_50:
  v40 = &v32[32 * v28];
  *((_QWORD *)v40 + 1) = 0LL;
  *((_QWORD *)v40 + 2) = 0LL;
  v41 = v40 + 32;
  *((_QWORD *)v40 + 3) = v84;
  *(_OWORD *)v40 = *(_OWORD *)p;
  *((_QWORD *)v40 + 2) = v83;
  p[1] = 0LL;
  v83 = 0LL;
  p[0] = 0LL;
  v43 = (void **)a3[4];
  v42 = (void **)a3[5];
  v44 = &v32[32 * v31];
  if ( v42 == v43 )
  {
    v46 = (void **)a3[4];
  }
  else
  {
    do
    {
      *((_QWORD *)v40 - 3) = 0LL;
      *((_QWORD *)v40 - 2) = 0LL;
      *((_QWORD *)v40 - 4) = 0LL;
      *((_QWORD *)v40 - 1) = *(v42 - 1);
      v45 = *((_OWORD *)v42 - 2);
      v42 -= 4;
      *((_OWORD *)v40 - 2) = v45;
      *((_QWORD *)v40 - 2) = v42[2];
      v40 -= 32;
      v42[1] = 0LL;
      v42[2] = 0LL;
      *v42 = 0LL;
    }
    while ( v43 != v42 );
    v46 = (void **)a3[4];
    v43 = (void **)a3[5];
  }
  v48 = a3[6];
  a3[4] = v40;
  a3[5] = v41;
  a3[6] = v44;
  while ( v46 != v43 )
  {
    v43 -= 4;
    sub_9D32C(v43);
  }
  if ( !v46 )
  {
LABEL_70:
    v14 = (void **)p[0];
    if ( !p[0] )
      return v10;
    goto LABEL_71;
  }
  v49 = (unsigned __int64)a3[7];
  if ( v49 + 4096 < (unsigned __int64)v46 || v49 > (unsigned __int64)v46 )
  {
    free(v46);
    goto LABEL_70;
  }
  if ( *(void **)(v49 + 4096) != v48 )
    goto LABEL_70;
  *(_QWORD *)(v49 + 4096) = v46;
  v14 = (void **)p[0];
  if ( !p[0] )
    return v10;
LABEL_71:
  v57 = (void **)p[1];
  if ( p[1] != v14 )
  {
    do
    {
      if ( (*(_BYTE *)(v57 - 3) & 1) != 0 )
        free(*(v57 - 1));
      v58 = v57 - 6;
      if ( (*(_BYTE *)(v57 - 6) & 1) != 0 )
        free(*(v57 - 4));
      v57 -= 6;
    }
    while ( v14 != v58 );
  }
  p[1] = v14;
  if ( v84 + 4096 < (unsigned __int64)v14 || v84 > (unsigned __int64)v14 )
  {
    free(v14);
  }
  else if ( *(_QWORD *)(v84 + 4096) == v83 )
  {
    *(_QWORD *)(v84 + 4096) = v14;
  }
  return v10;
}
