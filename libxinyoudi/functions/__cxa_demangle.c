char *_cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  char *v6; // x19
  size_t v8; // x26
  size_t v9; // x0
  const char *v10; // x23
  int v11; // w8
  char *v12; // x21
  char *v13; // x20
  _QWORD *v14; // x0
  _QWORD *v15; // x20
  _QWORD *v16; // x24
  _QWORD *v17; // x27
  _QWORD *v18; // x28
  char *v19; // x24
  char *v20; // x27
  _QWORD *v21; // x21
  _QWORD *v22; // x0
  _QWORD *v23; // x22
  unsigned __int64 v25; // x8
  unsigned __int64 v26; // x8
  unsigned __int64 v27; // x10
  unsigned __int64 v28; // x9
  size_t v29; // x22
  size_t v30; // x23
  unsigned __int64 v31; // x9
  bool v32; // zf
  size_t v33; // x9
  char *v34; // x1
  size_t v35; // x2
  char *v36; // x1
  void *v37; // [xsp+8h] [xbp-1108h] BYREF
  _QWORD *v38; // [xsp+10h] [xbp-1100h]
  __int64 v39; // [xsp+18h] [xbp-10F8h]
  _QWORD *v40; // [xsp+20h] [xbp-10F0h]
  void *p; // [xsp+28h] [xbp-10E8h]
  char *v42; // [xsp+30h] [xbp-10E0h]
  __int64 v43; // [xsp+38h] [xbp-10D8h]
  _QWORD *v44; // [xsp+40h] [xbp-10D0h]
  _QWORD *v45; // [xsp+48h] [xbp-10C8h] BYREF
  _QWORD *v46; // [xsp+50h] [xbp-10C0h]
  _QWORD *v47; // [xsp+58h] [xbp-10B8h]
  _BYTE v48[21]; // [xsp+60h] [xbp-10B0h] BYREF
  __int16 v49; // [xsp+75h] [xbp-109Bh]
  char v50; // [xsp+77h] [xbp-1099h]
  _QWORD v51[5]; // [xsp+78h] [xbp-1098h] BYREF
  _QWORD v52[4]; // [xsp+A0h] [xbp-1070h] BYREF
  _QWORD v53[512]; // [xsp+C0h] [xbp-1050h] BYREF

  v6 = lpout;
  v53[511] = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( !lpmangled || lpout && !lpoutlen )
  {
    v6 = 0LL;
    if ( lpstatus )
      *lpstatus = -3;
    return v6;
  }
  if ( lpout )
    v8 = *lpoutlen;
  else
    v8 = 0LL;
  v51[4] = v48;
  memset(v52, 0, 24);
  v40 = v52;
  p = 0LL;
  v44 = v52;
  *(_QWORD *)v48 = v52;
  memset(&v48[8], 0, 13);
  v49 = 1;
  v50 = 1;
  v52[3] = v52;
  v38 = 0LL;
  v39 = 0LL;
  v37 = 0LL;
  v42 = 0LL;
  v43 = 0LL;
  v53[508] = v53;
  v45 = v52;
  v46 = v53;
  v47 = v53;
  memset(v51, 0, 32);
  sub_B2A24(v51);
  LODWORD(v51[0]) = 0;
  v9 = strlen(lpmangled);
  v10 = &lpmangled[v9];
  sub_90B64(lpmangled, &lpmangled[v9], &v37, v51);
  v11 = v51[0];
  if ( LODWORD(v51[0]) )
  {
LABEL_11:
    v6 = 0LL;
    if ( !lpstatus )
      goto LABEL_13;
    goto LABEL_12;
  }
  if ( HIBYTE(v49) && v45 != v46 && *v45 != v45[1] )
  {
    v16 = v37;
    v17 = v38;
    v49 = 0;
    if ( v38 != v37 )
    {
      do
      {
        if ( (*(_BYTE *)(v17 - 3) & 1) != 0 )
          free((void *)*(v17 - 1));
        v18 = v17 - 6;
        if ( (*(_BYTE *)(v17 - 6) & 1) != 0 )
          free((void *)*(v17 - 4));
        v17 -= 6;
      }
      while ( v16 != v18 );
    }
    v38 = v16;
    v20 = (char *)p;
    v19 = v42;
    if ( v42 != p )
    {
      do
      {
        v19 -= 32;
        sub_9D32C(v19);
      }
      while ( v20 != v19 );
    }
    v42 = v20;
    sub_90B64(lpmangled, v10, &v37, v51);
    if ( HIBYTE(v49) )
    {
      v11 = -2;
      v6 = 0LL;
      LODWORD(v51[0]) = -2;
      if ( !lpstatus )
        goto LABEL_13;
LABEL_12:
      *lpstatus = v11;
      goto LABEL_13;
    }
    v11 = v51[0];
    if ( LODWORD(v51[0]) )
      goto LABEL_11;
  }
  v25 = *((unsigned __int8 *)v38 - 48);
  if ( (v25 & 1) != 0 )
  {
    v26 = *(v38 - 5);
    v27 = *((unsigned __int8 *)v38 - 24);
    if ( (v27 & 1) != 0 )
      goto LABEL_54;
  }
  else
  {
    v26 = v25 >> 1;
    v27 = *((unsigned __int8 *)v38 - 24);
    if ( (v27 & 1) != 0 )
    {
LABEL_54:
      v28 = *(v38 - 2);
      goto LABEL_57;
    }
  }
  v28 = v27 >> 1;
LABEL_57:
  v29 = v28 + v26;
  v30 = v28 + v26 + 1;
  if ( v30 <= v8 )
  {
    if ( v6 )
      goto LABEL_62;
    v11 = 0;
    if ( lpstatus )
      goto LABEL_12;
  }
  else
  {
    v6 = (char *)realloc(v6, v28 + v26 + 1);
    if ( v6 )
    {
      if ( lpoutlen )
        *lpoutlen = v30;
LABEL_62:
      v31 = *((unsigned __int8 *)v38 - 24);
      v32 = (v31 & 1) == 0;
      v33 = v31 >> 1;
      if ( v32 )
        v34 = (char *)v38 - 23;
      else
        v34 = (char *)*(v38 - 1);
      if ( v32 )
        v35 = v33;
      else
        v35 = *(v38 - 2);
      sub_9CFD0((_DWORD)v38 - 48, v34, v35);
      if ( (*(_BYTE *)(v38 - 6) & 1) != 0 )
        v36 = (char *)*(v38 - 4);
      else
        v36 = (char *)v38 - 47;
      memcpy(v6, v36, v29);
      v11 = 0;
      v6[v29] = 0;
      if ( lpstatus )
        goto LABEL_12;
      goto LABEL_13;
    }
    v11 = -1;
    LODWORD(v51[0]) = -1;
    if ( lpstatus )
      goto LABEL_12;
  }
LABEL_13:
  sub_B64BC(&v45);
  v12 = (char *)p;
  if ( !p )
    goto LABEL_37;
  v13 = v42;
  v14 = p;
  if ( v42 != p )
  {
    do
    {
      v13 -= 32;
      sub_9D32C(v13);
    }
    while ( v12 != v13 );
    v14 = p;
  }
  v42 = v12;
  if ( v44 + 512 < v14 || v44 > v14 )
  {
    free(v14);
LABEL_37:
    v15 = v37;
    if ( !v37 )
      return v6;
    goto LABEL_38;
  }
  if ( v44[512] != v43 )
    goto LABEL_37;
  v44[512] = v14;
  v15 = v37;
  if ( !v37 )
    return v6;
LABEL_38:
  v21 = v38;
  v22 = v15;
  if ( v38 != v15 )
  {
    do
    {
      if ( (*(_BYTE *)(v21 - 3) & 1) != 0 )
        free((void *)*(v21 - 1));
      v23 = v21 - 6;
      if ( (*(_BYTE *)(v21 - 6) & 1) != 0 )
        free((void *)*(v21 - 4));
      v21 -= 6;
    }
    while ( v15 != v23 );
    v22 = v37;
  }
  v38 = v15;
  if ( v40 + 512 < v22 || v40 > v22 )
  {
    free(v22);
  }
  else if ( v40[512] == v39 )
  {
    v40[512] = v22;
  }
  return v6;
}
