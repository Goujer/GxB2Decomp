__int64 __fastcall sub_A9B9C(unsigned __int8 *a1, unsigned __int8 *a2, int a3, _QWORD *a4)
{
  unsigned __int8 *v6; // x20
  __int64 v7; // x19
  __int64 v8; // x8
  unsigned __int64 v9; // x9
  size_t v10; // x10
  void *v11; // x11
  size_t *v12; // x0
  void *v13; // x8
  bool v14; // zf
  size_t v15; // x9
  void *v16; // x1
  size_t v17; // x2
  size_t *v18; // x0
  void *v19; // x25
  char *v20; // x1
  size_t v21; // x2
  void *v22; // x8
  __int128 v23; // q0
  void *v24; // x26
  char v25; // w10
  __int64 v26; // x27
  __int64 *v27; // x22
  const void **v28; // x28
  __int64 v29; // x20
  unsigned __int64 v30; // x21
  unsigned __int64 v31; // x9
  int v32; // w8
  unsigned __int64 v33; // x25
  _BYTE *v34; // x21
  _BYTE *v35; // x0
  _BYTE *v36; // x0
  bool v37; // cc
  _BYTE *v38; // x21
  void *v39; // x0
  unsigned __int64 v41; // [xsp+8h] [xbp-D8h]
  char v42; // [xsp+14h] [xbp-CCh]
  unsigned __int64 v43; // [xsp+18h] [xbp-C8h]
  char v44; // [xsp+24h] [xbp-BCh]
  void *v45; // [xsp+28h] [xbp-B8h]
  __int128 v46; // [xsp+30h] [xbp-B0h] BYREF
  char *v47; // [xsp+40h] [xbp-A0h]
  __int128 v48; // [xsp+48h] [xbp-98h] BYREF
  void *p; // [xsp+58h] [xbp-88h]
  __int128 v50; // [xsp+60h] [xbp-80h] BYREF
  void *v51; // [xsp+70h] [xbp-70h]
  _QWORD v52[3]; // [xsp+78h] [xbp-68h] BYREF

  v6 = a1;
  v52[2] = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  v7 = sub_A20BC(a1, a2, (__int64)a4);
  if ( (unsigned __int8 *)v7 != v6 && *a4 != a4[1] )
  {
    sub_AB28C((__int64 *)&v48, a3, "(");
    v8 = a4[1];
    v9 = *(unsigned __int8 *)(v8 - 24);
    v10 = *(_QWORD *)(v8 - 16);
    v11 = *(void **)(v8 - 8);
    v12 = (size_t *)(v8 - 48);
    v13 = (void *)(v8 - 23);
    v14 = (v9 & 1) == 0;
    v15 = v9 >> 1;
    if ( v14 )
      v16 = v13;
    else
      v16 = v11;
    if ( v14 )
      v17 = v15;
    else
      v17 = v10;
    v18 = sub_9CFD0(v12, v16, v17);
    v47 = (char *)v18[2];
    v46 = *(_OWORD *)v18;
    v18[1] = 0LL;
    v18[2] = 0LL;
    *v18 = 0LL;
    v19 = v47;
    if ( (v46 & 1) != 0 )
      v20 = v47;
    else
      v20 = (char *)&v46 + 1;
    if ( (v46 & 1) != 0 )
      v21 = *((_QWORD *)&v46 + 1);
    else
      v21 = (unsigned __int64)(unsigned __int8)v46 >> 1;
    sub_9CFD0((size_t *)&v48, v20, v21);
    v22 = p;
    v23 = v48;
    p = 0LL;
    v48 = 0uLL;
    v51 = v22;
    v50 = v23;
    sub_9CFD0((size_t *)&v50, ")", 1uLL);
    v24 = v51;
    v25 = v50;
    v51 = 0LL;
    *(_QWORD *)((char *)v52 + 7) = *((_QWORD *)&v50 + 1);
    v52[0] = *(_QWORD *)((char *)&v50 + 1);
    v50 = 0uLL;
    v26 = a4[1];
    v27 = (__int64 *)(v26 - 48);
    if ( (*(_BYTE *)(v26 - 48) & 1) == 0 )
    {
      *(_WORD *)(v26 - 48) = 0;
      v28 = (const void **)(v26 - 32);
      goto LABEL_39;
    }
    v28 = (const void **)(v26 - 32);
    **(_BYTE **)(v26 - 32) = 0;
    LOBYTE(v29) = *(_BYTE *)(v26 - 48);
    *(_QWORD *)(v26 - 40) = 0LL;
    if ( (v29 & 1) != 0 )
    {
      v29 = *v27;
      v30 = (*v27 & 0xFFFFFFFFFFFFFFFELL) - 1;
      v45 = v19;
      if ( (*v27 & 1) != 0 )
      {
        v31 = 0LL;
        v32 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      v30 = 22LL;
      v45 = v19;
    }
    v31 = (unsigned __int64)((unsigned __int8)v29 & 0xFE) >> 1;
    if ( (unsigned __int8)v29 >= 0x2Eu )
    {
      v33 = ((unsigned __int8)(v31 + 16) & 0xF0) - 1LL;
      v32 = 1;
      if ( v33 == v30 )
        goto LABEL_24;
      goto LABEL_26;
    }
    v32 = 1;
LABEL_23:
    v33 = 22LL;
    if ( v30 == 22 )
    {
LABEL_24:
      v19 = v45;
      goto LABEL_39;
    }
LABEL_26:
    v44 = v25;
    v43 = v31;
    if ( v33 == 22 )
    {
      v34 = *v28;
      v35 = (_BYTE *)(v26 - 47);
      if ( v32 )
        memcpy(v35, *v28, ((unsigned __int64)((unsigned __int8)v29 & 0xFE) >> 1) + 1);
      else
        *v35 = *v34;
      free(v34);
      v19 = v45;
      *(_BYTE *)v27 = 2 * v43;
    }
    else
    {
      v42 = v32;
      v41 = v33 + 1;
      v36 = malloc(v33 + 1);
      v37 = v33 > v30;
      v38 = v36;
      if ( v37 || v36 )
      {
        v19 = v45;
        if ( (v42 & 1) != 0 )
        {
          memcpy(v36, (const void *)(v26 - 47), ((unsigned __int64)((unsigned __int8)v29 & 0xFE) >> 1) + 1);
        }
        else
        {
          v39 = (void *)*v28;
          *v38 = *(_BYTE *)*v28;
          free(v39);
        }
        *(_QWORD *)(v26 - 48) = v41 | 1;
        *(_QWORD *)(v26 - 40) = v43;
        *(_QWORD *)(v26 - 32) = v38;
      }
      else
      {
        v19 = v45;
      }
    }
    v25 = v44;
LABEL_39:
    *(_BYTE *)(v26 - 48) = v25;
    *(_QWORD *)(v26 - 47) = v52[0];
    *(_QWORD *)(v26 - 40) = *(_QWORD *)((char *)v52 + 7);
    *v28 = v24;
    memset(v52, 0, 15);
    if ( (v50 & 1) != 0 )
    {
      free(v51);
      if ( (v46 & 1) == 0 )
      {
LABEL_41:
        if ( (v48 & 1) == 0 )
          return v7;
LABEL_42:
        free(p);
        return v7;
      }
    }
    else if ( (v46 & 1) == 0 )
    {
      goto LABEL_41;
    }
    free(v19);
    if ( (v48 & 1) == 0 )
      return v7;
    goto LABEL_42;
  }
  return (__int64)v6;
}
