unsigned __int8 *__fastcall sub_B190C(unsigned __int8 *a1, unsigned __int8 *a2, void **a3)
{
  unsigned __int8 *v3; // x22
  __int64 v5; // x8
  size_t v6; // x19
  unsigned __int8 *v7; // x20
  int v8; // w8
  unsigned __int8 *v9; // x9
  int v10; // t1
  char *v11; // x23
  char *v12; // x22
  unsigned __int64 v13; // x8
  size_t v14; // x22
  char v15; // w22
  unsigned __int64 v16; // x8
  _BOOL4 v17; // w24
  char *v18; // x0
  __int64 v19; // x23
  char *v20; // x9
  char *v21; // x10
  __int64 v22; // x9
  void *v23; // x22
  __int64 v24; // x10
  char v25; // w24
  __int64 v26; // x9
  char *v27; // x9
  char *v28; // x10
  unsigned __int64 v29; // x24
  unsigned __int64 v30; // x10
  _QWORD *v31; // x9
  char *v32; // x0
  unsigned __int64 v33; // x26
  unsigned __int64 v34; // x10
  _QWORD *v35; // x9
  char *v36; // x0
  char *v37; // x8
  char *v38; // x9
  void **v39; // x11
  void **v40; // x24
  char *v41; // x10
  __int64 v42; // x12
  void **v43; // x22
  void *v44; // x23
  void **v45; // x26
  unsigned __int64 v46; // x8
  char *v47; // x8
  char *v48; // x9
  void **v49; // x11
  void **v50; // x24
  char *v51; // x10
  __int64 v52; // x12
  void **v53; // x22
  void *v54; // x23
  void **v55; // x26
  unsigned __int64 v56; // x8
  __int128 v58; // [xsp+8h] [xbp-98h] BYREF
  void *v59; // [xsp+18h] [xbp-88h]
  _BYTE v60[15]; // [xsp+20h] [xbp-80h] BYREF
  _QWORD v61[2]; // [xsp+30h] [xbp-70h] BYREF
  __int128 v62; // [xsp+40h] [xbp-60h] BYREF
  void *p; // [xsp+50h] [xbp-50h]
  __int64 v64; // [xsp+58h] [xbp-48h]

  v3 = a1;
  v64 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( a1 == a2 )
    return v3;
  v5 = *a1;
  v6 = v5 - 48;
  if ( (unsigned int)(v5 - 48) > 9 )
    return v3;
  v7 = a1 + 1;
  if ( a1 + 1 == a2 )
    return v3;
  v8 = *v7 - 48;
  if ( (unsigned int)v8 > 9 )
  {
LABEL_9:
    if ( a2 - v7 < v6 )
      return v3;
    v59 = 0LL;
    v58 = 0uLL;
    if ( v6 >= 0xFFFFFFFFFFFFFFF0LL )
      abort();
    if ( v6 >= 0x17 )
    {
      v12 = (char *)malloc((v6 + 16) & 0xFFFFFFFFFFFFFFF0LL);
      *((_QWORD *)&v58 + 1) = v6;
      v59 = v12;
      *(_QWORD *)&v58 = (v6 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
      v11 = (char *)&v58 + 1;
    }
    else
    {
      v11 = (char *)&v58 + 1;
      v12 = (char *)&v58 + 1;
      LOBYTE(v58) = 2 * v6;
      if ( !v6 )
        goto LABEL_16;
    }
    memcpy(v12, v7, v6);
LABEL_16:
    v12[v6] = 0;
    v13 = *((_QWORD *)&v58 + 1);
    p = 0LL;
    v62 = 0uLL;
    if ( (v58 & 1) != 0 )
      v11 = (char *)v59;
    else
      v13 = (unsigned __int64)(unsigned __int8)v58 >> 1;
    if ( v13 >= 0xA )
      v14 = 10LL;
    else
      v14 = v13;
    LOBYTE(v62) = 2 * v14;
    if ( v14 )
      memcpy((char *)&v62 + 1, v11, v14);
    *((_BYTE *)&v62 + v14 + 1) = 0;
    v15 = v62;
    v16 = *((_QWORD *)&v62 + 1);
    v17 = 0;
    if ( (v62 & 1) == 0 )
      v16 = (unsigned __int64)(unsigned __int8)v62 >> 1;
    if ( v16 == 10 )
    {
      if ( (v62 & 1) != 0 )
        v18 = (char *)p;
      else
        v18 = (char *)&v62 + 1;
      v17 = memcmp(v18, "_GLOBAL__N", 0xAuLL) == 0;
    }
    if ( (v15 & 1) != 0 )
      free(p);
    v19 = 0x555555555555555LL;
    if ( v17 )
    {
      memset(v61, 0, 15);
      qmemcpy(&v62, "(anonymous name", 15);
      v20 = (char *)a3[1];
      v21 = (char *)a3[2];
      if ( v20 >= v21 )
      {
        v29 = 0xAAAAAAAAAAAAAAABLL * ((v20 - (_BYTE *)*a3) >> 4);
        if ( v29 + 1 > 0x555555555555555LL )
          abort();
        v30 = 0xAAAAAAAAAAAAAAABLL * ((v21 - (_BYTE *)*a3) >> 4);
        if ( v30 >= 0x2AAAAAAAAAAAAAALL || (2 * v30 >= v29 + 1 ? (v19 = 2 * v30) : (v19 = v29 + 1), v19) )
        {
          v31 = a3[3];
          v32 = (char *)v31[512];
          if ( (char *)(v31 + 512) - v32 >= (unsigned __int64)(48 * v19) )
            v31[512] = &v32[48 * v19];
          else
            v32 = (char *)malloc(48 * v19);
        }
        else
        {
          v32 = 0LL;
        }
        v37 = &v32[48 * v29];
        *v37 = 42;
        v38 = &v32[48 * v19];
        *((_QWORD *)v37 + 1) = *(_QWORD *)((char *)&v62 + 7);
        *((_QWORD *)v37 + 2) = 0x296563617073LL;
        *(_QWORD *)(v37 + 1) = v62;
        *(_QWORD *)((char *)&v62 + 7) = 0LL;
        *(_QWORD *)&v62 = 0LL;
        v37[24] = 0;
        *((_QWORD *)v37 + 4) = *(_QWORD *)((char *)v61 + 7);
        *((_QWORD *)v37 + 5) = 0LL;
        *(_QWORD *)(v37 + 25) = v61[0];
        memset(v61, 0, 15);
        v40 = (void **)*a3;
        v39 = (void **)a3[1];
        v41 = v37 + 48;
        if ( v39 == *a3 )
        {
          v43 = (void **)*a3;
        }
        else
        {
          do
          {
            *((_QWORD *)v37 - 4) = *(v39 - 4);
            *((_OWORD *)v37 - 3) = *((_OWORD *)v39 - 3);
            v42 = (__int64)*(v39 - 1);
            *(v39 - 5) = 0LL;
            *(v39 - 4) = 0LL;
            *(v39 - 6) = 0LL;
            *((_QWORD *)v37 - 1) = v42;
            *(_OWORD *)(v37 - 24) = *(_OWORD *)(v39 - 3);
            *(v39 - 2) = 0LL;
            *(v39 - 1) = 0LL;
            *(v39 - 3) = 0LL;
            v39 -= 6;
            v37 -= 48;
          }
          while ( v40 != v39 );
          v43 = (void **)*a3;
          v40 = (void **)a3[1];
        }
        v44 = a3[2];
        *a3 = v37;
        a3[1] = v41;
        a3[2] = v38;
        if ( v40 != v43 )
        {
          do
          {
            if ( (*(_BYTE *)(v40 - 3) & 1) != 0 )
              free(*(v40 - 1));
            v45 = v40 - 6;
            if ( (*(_BYTE *)(v40 - 6) & 1) != 0 )
              free(*(v40 - 4));
            v40 -= 6;
          }
          while ( v43 != v45 );
        }
        if ( v43 )
        {
          v46 = (unsigned __int64)a3[3];
          if ( v46 + 4096 < (unsigned __int64)v43 || v46 > (unsigned __int64)v43 )
          {
            free(v43);
          }
          else if ( *(void **)(v46 + 4096) == v44 )
          {
            *(_QWORD *)(v46 + 4096) = v43;
          }
        }
      }
      else
      {
        *v20 = 42;
        *((_QWORD *)v20 + 1) = *(_QWORD *)((char *)&v62 + 7);
        *((_QWORD *)v20 + 2) = 0x296563617073LL;
        *(_QWORD *)(v20 + 1) = v62;
        *(_QWORD *)((char *)&v62 + 7) = 0LL;
        *(_QWORD *)&v62 = 0LL;
        v20[24] = 0;
        *((_QWORD *)v20 + 4) = *(_QWORD *)((char *)v61 + 7);
        *((_QWORD *)v20 + 5) = 0LL;
        *(_QWORD *)(v20 + 25) = v61[0];
        memset(v61, 0, 15);
        a3[1] = (char *)a3[1] + 48;
      }
      v3 = &v7[v6];
      if ( (v58 & 1) != 0 )
        free(v59);
    }
    else
    {
      v22 = *((_QWORD *)&v58 + 1);
      v23 = v59;
      v24 = *(_QWORD *)((char *)&v58 + 1);
      v25 = v58;
      v58 = 0uLL;
      *(_QWORD *)&v60[7] = v22;
      v59 = 0LL;
      v60[7] = HIBYTE(v24);
      v26 = *(_QWORD *)&v60[7];
      memset(v61, 0, 15);
      memset(v60, 0, sizeof(v60));
      *(_QWORD *)((char *)&v62 + 7) = v26;
      *(_QWORD *)&v62 = v24;
      v27 = (char *)a3[1];
      v28 = (char *)a3[2];
      if ( v27 >= v28 )
      {
        v33 = 0xAAAAAAAAAAAAAAABLL * ((v27 - (_BYTE *)*a3) >> 4);
        if ( v33 + 1 > 0x555555555555555LL )
          abort();
        v34 = 0xAAAAAAAAAAAAAAABLL * ((v28 - (_BYTE *)*a3) >> 4);
        if ( v34 >= 0x2AAAAAAAAAAAAAALL || (2 * v34 >= v33 + 1 ? (v19 = 2 * v34) : (v19 = v33 + 1), v19) )
        {
          v35 = a3[3];
          v36 = (char *)v35[512];
          if ( (char *)(v35 + 512) - v36 >= (unsigned __int64)(48 * v19) )
            v35[512] = &v36[48 * v19];
          else
            v36 = (char *)malloc(48 * v19);
        }
        else
        {
          v36 = 0LL;
        }
        v47 = &v36[48 * v33];
        *v47 = v25;
        v48 = &v36[48 * v19];
        *((_QWORD *)v47 + 1) = *(_QWORD *)((char *)&v62 + 7);
        *((_QWORD *)v47 + 2) = v23;
        *(_QWORD *)(v47 + 1) = v62;
        *(_QWORD *)((char *)&v62 + 7) = 0LL;
        *(_QWORD *)&v62 = 0LL;
        v47[24] = 0;
        *((_QWORD *)v47 + 4) = *(_QWORD *)((char *)v61 + 7);
        *((_QWORD *)v47 + 5) = 0LL;
        *(_QWORD *)(v47 + 25) = v61[0];
        memset(v61, 0, 15);
        v50 = (void **)*a3;
        v49 = (void **)a3[1];
        v51 = v47 + 48;
        if ( v49 == *a3 )
        {
          v53 = (void **)*a3;
        }
        else
        {
          do
          {
            *((_QWORD *)v47 - 4) = *(v49 - 4);
            *((_OWORD *)v47 - 3) = *((_OWORD *)v49 - 3);
            v52 = (__int64)*(v49 - 1);
            *(v49 - 5) = 0LL;
            *(v49 - 4) = 0LL;
            *(v49 - 6) = 0LL;
            *((_QWORD *)v47 - 1) = v52;
            *(_OWORD *)(v47 - 24) = *(_OWORD *)(v49 - 3);
            *(v49 - 2) = 0LL;
            *(v49 - 1) = 0LL;
            *(v49 - 3) = 0LL;
            v49 -= 6;
            v47 -= 48;
          }
          while ( v50 != v49 );
          v53 = (void **)*a3;
          v50 = (void **)a3[1];
        }
        v54 = a3[2];
        *a3 = v47;
        a3[1] = v51;
        a3[2] = v48;
        if ( v50 != v53 )
        {
          do
          {
            if ( (*(_BYTE *)(v50 - 3) & 1) != 0 )
              free(*(v50 - 1));
            v55 = v50 - 6;
            if ( (*(_BYTE *)(v50 - 6) & 1) != 0 )
              free(*(v50 - 4));
            v50 -= 6;
          }
          while ( v53 != v55 );
        }
        if ( v53 )
        {
          v56 = (unsigned __int64)a3[3];
          if ( v56 + 4096 < (unsigned __int64)v53 || v56 > (unsigned __int64)v53 )
          {
            free(v53);
          }
          else if ( *(void **)(v56 + 4096) == v54 )
          {
            *(_QWORD *)(v56 + 4096) = v53;
          }
        }
      }
      else
      {
        *v27 = v25;
        *((_QWORD *)v27 + 1) = *(_QWORD *)((char *)&v62 + 7);
        *((_QWORD *)v27 + 2) = v23;
        *(_QWORD *)(v27 + 1) = v62;
        *(_QWORD *)((char *)&v62 + 7) = 0LL;
        *(_QWORD *)&v62 = 0LL;
        v27[24] = 0;
        *((_QWORD *)v27 + 4) = *(_QWORD *)((char *)v61 + 7);
        *((_QWORD *)v27 + 5) = 0LL;
        *(_QWORD *)(v27 + 25) = v61[0];
        memset(v61, 0, 15);
        a3[1] = (char *)a3[1] + 48;
      }
      return &v7[v6];
    }
    return v3;
  }
  v9 = a1 + 2;
  while ( a2 != v9 )
  {
    v10 = *v9++;
    v6 = 10 * v6 + v8;
    v8 = v10 - 48;
    if ( (unsigned int)(v10 - 48) >= 0xA )
    {
      v7 = v9 - 1;
      goto LABEL_9;
    }
  }
  return v3;
}
