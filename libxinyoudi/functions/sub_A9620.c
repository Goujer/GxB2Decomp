__int64 __fastcall sub_A9620(unsigned __int8 *a1, unsigned __int8 *a2, unsigned __int8 *a3, _QWORD *a4)
{
  unsigned __int8 *v7; // x22
  unsigned __int8 *v8; // x0
  unsigned __int8 *v9; // x23
  __int64 v10; // x19
  __int64 v11; // x25
  unsigned __int64 v12; // x8
  bool v13; // zf
  size_t v14; // x8
  void *v15; // x1
  size_t v16; // x2
  __int64 v17; // x22
  _BYTE *v18; // x25
  unsigned __int64 v19; // x8
  bool v20; // zf
  size_t v21; // x8
  void *v22; // x1
  size_t v23; // x2
  size_t *v24; // x0
  __int64 v25; // x8
  size_t *v26; // x21
  __int64 v27; // x19
  _BYTE *v28; // x20
  unsigned __int64 v29; // x8
  unsigned __int64 v30; // x9
  unsigned __int8 *v31; // x8
  void *v32; // x8
  __int128 v33; // q0
  unsigned __int64 v34; // x8
  bool v35; // zf
  size_t v36; // x8
  void *v37; // x1
  size_t v38; // x2
  void *v39; // x8
  __int128 v40; // q0
  char v41; // w25
  void *v42; // x8
  __int128 v43; // q0
  void *v44; // x22
  char *v45; // x1
  size_t v46; // x2
  void *v47; // x8
  __int128 v48; // q0
  char *v49; // x8
  __int128 v50; // q0
  char v51; // w26
  char *v52; // x23
  char *v53; // x1
  size_t v54; // x2
  unsigned __int64 v55; // x8
  unsigned __int64 v56; // x9
  unsigned __int8 *v57; // x8
  __int128 v59; // [xsp+8h] [xbp-148h] BYREF
  void *p; // [xsp+18h] [xbp-138h]
  __int128 v61; // [xsp+20h] [xbp-130h] BYREF
  void *v62; // [xsp+30h] [xbp-120h]
  __int128 v63; // [xsp+40h] [xbp-110h] BYREF
  void *v64; // [xsp+50h] [xbp-100h]
  __int128 v65; // [xsp+60h] [xbp-F0h] BYREF
  void *v66; // [xsp+70h] [xbp-E0h]
  __int128 v67; // [xsp+80h] [xbp-D0h] BYREF
  void *v68; // [xsp+90h] [xbp-C0h]
  __int128 v69; // [xsp+A0h] [xbp-B0h] BYREF
  char *v70; // [xsp+B0h] [xbp-A0h]
  __int128 v71; // [xsp+C0h] [xbp-90h] BYREF
  void *v72; // [xsp+D0h] [xbp-80h]
  __int128 v73; // [xsp+E0h] [xbp-70h] BYREF
  char *v74; // [xsp+F0h] [xbp-60h]

  v7 = a1;
  _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2));
  v8 = (unsigned __int8 *)sub_A20BC(a1, a2, (__int64)a4);
  v9 = v8;
  if ( v8 == v7 )
    return (__int64)v7;
  v10 = sub_A20BC(v8, a2, (__int64)a4);
  if ( (unsigned __int8 *)v10 != v9 )
  {
    v11 = a4[1];
    if ( 0xAAAAAAAAAAAAAAABLL * ((v11 - *a4) >> 4) < 2 )
      return (__int64)v7;
    v12 = *(unsigned __int8 *)(v11 - 24);
    v13 = (v12 & 1) == 0;
    v14 = v12 >> 1;
    if ( v13 )
      v15 = (void *)(v11 - 23);
    else
      v15 = *(void **)(v11 - 8);
    if ( v13 )
      v16 = v14;
    else
      v16 = *(_QWORD *)(v11 - 16);
    sub_9CFD0((size_t *)(v11 - 48), v15, v16);
    v74 = *(char **)(v11 - 32);
    v73 = *(_OWORD *)(v11 - 48);
    *(_QWORD *)(v11 - 40) = 0LL;
    *(_QWORD *)(v11 - 32) = 0LL;
    *(_QWORD *)(v11 - 48) = 0LL;
    v17 = a4[1];
    v18 = (_BYTE *)(v17 - 48);
    if ( (*(_BYTE *)(v17 - 24) & 1) != 0 )
      free(*(void **)(v17 - 8));
    if ( (*v18 & 1) != 0 )
      free(*(void **)(v17 - 32));
    a4[1] = v18;
    v19 = *(unsigned __int8 *)(v17 - 72);
    v20 = (v19 & 1) == 0;
    v21 = v19 >> 1;
    if ( v20 )
      v22 = (void *)(v17 - 71);
    else
      v22 = *(void **)(v17 - 56);
    if ( v20 )
      v23 = v21;
    else
      v23 = *(_QWORD *)(v17 - 64);
    v24 = sub_9CFD0((size_t *)(v17 - 96), v22, v23);
    v72 = (void *)v24[2];
    v71 = *(_OWORD *)v24;
    v24[1] = 0LL;
    v24[2] = 0LL;
    *v24 = 0LL;
    v25 = a4[1];
    v26 = (size_t *)(v25 - 48);
    if ( (*(_BYTE *)(v25 - 48) & 1) != 0 )
    {
      **(_BYTE **)(v25 - 32) = 0;
      *(_QWORD *)(v25 - 40) = 0LL;
    }
    else
    {
      *(_WORD *)v26 = 0;
    }
    v29 = *a3;
    v30 = *((_QWORD *)a3 + 1);
    if ( (v29 & 1) == 0 )
      v30 = v29 >> 1;
    if ( v30 == 1 )
    {
      v31 = (v29 & 1) != 0 ? (unsigned __int8 *)*((_QWORD *)a3 + 2) : a3 + 1;
      if ( *v31 == 62 )
        sub_B23DC(v26, 40LL);
    }
    sub_9F8F0("(", (unsigned __int8 *)&v71, (size_t *)&v59);
    sub_9CFD0((size_t *)&v59, ") ", 2uLL);
    v32 = p;
    v33 = v59;
    p = 0LL;
    v59 = 0uLL;
    v62 = v32;
    v61 = v33;
    v34 = *a3;
    v35 = (v34 & 1) == 0;
    v36 = v34 >> 1;
    if ( v35 )
      v37 = a3 + 1;
    else
      v37 = (void *)*((_QWORD *)a3 + 2);
    if ( v35 )
      v38 = v36;
    else
      v38 = *((_QWORD *)a3 + 1);
    sub_9CFD0((size_t *)&v61, v37, v38);
    v39 = v62;
    v40 = v61;
    v62 = 0LL;
    v61 = 0uLL;
    v64 = v39;
    v63 = v40;
    sub_9CFD0((size_t *)&v63, " (", 2uLL);
    v41 = v73;
    v42 = v64;
    v43 = v63;
    v64 = 0LL;
    v63 = 0uLL;
    v44 = v74;
    v66 = v42;
    if ( (v73 & 1) != 0 )
      v45 = v74;
    else
      v45 = (char *)&v73 + 1;
    v65 = v43;
    if ( (v73 & 1) != 0 )
      v46 = *((_QWORD *)&v73 + 1);
    else
      v46 = (unsigned __int64)(unsigned __int8)v73 >> 1;
    sub_9CFD0((size_t *)&v65, v45, v46);
    v47 = v66;
    v48 = v65;
    v66 = 0LL;
    v65 = 0uLL;
    v68 = v47;
    v67 = v48;
    sub_9CFD0((size_t *)&v67, ")", 1uLL);
    v49 = (char *)v68;
    v50 = v67;
    v68 = 0LL;
    v67 = 0uLL;
    v70 = v49;
    v69 = v50;
    v51 = v50;
    v52 = v49;
    if ( (v50 & 1) != 0 )
      v53 = v70;
    else
      v53 = (char *)&v69 + 1;
    if ( (v69 & 1) != 0 )
      v54 = *((_QWORD *)&v69 + 1);
    else
      v54 = (unsigned __int64)(unsigned __int8)v69 >> 1;
    sub_9CFD0(v26, v53, v54);
    if ( (v51 & 1) != 0 )
    {
      free(v52);
      if ( (v67 & 1) == 0 )
      {
LABEL_57:
        if ( (v65 & 1) == 0 )
          goto LABEL_58;
        goto LABEL_78;
      }
    }
    else if ( (v67 & 1) == 0 )
    {
      goto LABEL_57;
    }
    free(v68);
    if ( (v65 & 1) == 0 )
    {
LABEL_58:
      if ( (v63 & 1) == 0 )
        goto LABEL_59;
      goto LABEL_79;
    }
LABEL_78:
    free(v66);
    if ( (v63 & 1) == 0 )
    {
LABEL_59:
      if ( (v61 & 1) == 0 )
        goto LABEL_60;
      goto LABEL_80;
    }
LABEL_79:
    free(v64);
    if ( (v61 & 1) == 0 )
    {
LABEL_60:
      if ( (v59 & 1) == 0 )
      {
LABEL_62:
        v55 = *a3;
        v56 = *((_QWORD *)a3 + 1);
        if ( (v55 & 1) == 0 )
          v56 = v55 >> 1;
        if ( v56 == 1 )
        {
          v57 = (v55 & 1) != 0 ? (unsigned __int8 *)*((_QWORD *)a3 + 2) : a3 + 1;
          if ( *v57 == 62 )
            sub_B23DC(v26, 41LL);
        }
        if ( (v71 & 1) != 0 )
          free(v72);
        if ( (v41 & 1) != 0 )
          free(v44);
        return v10;
      }
LABEL_61:
      free(p);
      goto LABEL_62;
    }
LABEL_80:
    free(v62);
    if ( (v59 & 1) == 0 )
      goto LABEL_62;
    goto LABEL_61;
  }
  v27 = a4[1];
  if ( *a4 != v27 )
  {
    v28 = (_BYTE *)(v27 - 48);
    if ( (*(_BYTE *)(v27 - 24) & 1) != 0 )
      free(*(void **)(v27 - 8));
    if ( (*v28 & 1) != 0 )
      free(*(void **)(v27 - 32));
    a4[1] = v28;
  }
  return (__int64)v7;
}
