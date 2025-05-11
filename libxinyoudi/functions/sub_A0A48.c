_BYTE *__fastcall sub_A0A48(_BYTE *a1, _BYTE *a2, _QWORD *a3)
{
  _BYTE *v4; // x21
  _BYTE *v6; // x23
  _BYTE *v7; // x0
  _BYTE *v8; // x19
  __int64 v9; // x22
  unsigned __int64 v10; // x8
  bool v11; // zf
  size_t v12; // x8
  void *v13; // x1
  size_t v14; // x2
  void *v15; // x8
  __int128 v16; // q0
  __int64 v17; // x9
  __int64 v18; // x10
  void *v19; // x11
  char v20; // w8
  __int64 v21; // x8
  __int64 v22; // x9
  __int128 v24; // [xsp+0h] [xbp-B0h] BYREF
  void *p; // [xsp+10h] [xbp-A0h]
  __int128 v26; // [xsp+20h] [xbp-90h] BYREF
  void *v27; // [xsp+30h] [xbp-80h]
  char v28; // [xsp+38h] [xbp-78h] BYREF
  _BYTE v29[15]; // [xsp+39h] [xbp-77h]
  void *v30; // [xsp+48h] [xbp-68h]
  __int64 v31; // [xsp+50h] [xbp-60h]
  __int64 v32; // [xsp+58h] [xbp-58h]
  void *v33; // [xsp+60h] [xbp-50h]
  _BYTE v34[15]; // [xsp+68h] [xbp-48h] BYREF
  __int64 v35; // [xsp+78h] [xbp-38h]

  v4 = a1;
  v35 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( a2 - a1 >= 4 && *a1 == 68 && ((unsigned __int8)a1[1] | 0x20) == 0x74 )
  {
    v6 = a1 + 2;
    v7 = (_BYTE *)sub_A20BC(a1 + 2, a2, a3);
    v8 = v7;
    if ( v7 != v6 && v7 != a2 && *v7 == 69 )
    {
      v9 = a3[1];
      if ( *a3 != v9 )
      {
        v10 = *(unsigned __int8 *)(v9 - 24);
        v11 = (v10 & 1) == 0;
        v12 = v10 >> 1;
        if ( v11 )
          v13 = (void *)(v9 - 23);
        else
          v13 = *(void **)(v9 - 8);
        if ( v11 )
          v14 = v12;
        else
          v14 = *(_QWORD *)(v9 - 16);
        sub_9CFD0((size_t *)(v9 - 48), v13, v14);
        p = *(void **)(v9 - 32);
        v24 = *(_OWORD *)(v9 - 48);
        *(_QWORD *)(v9 - 40) = 0LL;
        *(_QWORD *)(v9 - 32) = 0LL;
        *(_QWORD *)(v9 - 48) = 0LL;
        sub_9CDD8((size_t *)&v24, 0LL, "decltype(", 9uLL);
        v15 = p;
        v16 = v24;
        p = 0LL;
        v24 = 0uLL;
        v27 = v15;
        v26 = v16;
        sub_9CFD0((size_t *)&v26, ")", 1uLL);
        v17 = *(_QWORD *)((char *)&v26 + 1);
        v18 = *((_QWORD *)&v26 + 1);
        v19 = v27;
        v20 = v26;
        v27 = 0LL;
        v26 = 0uLL;
        *(_QWORD *)&v34[7] = v18;
        v34[7] = HIBYTE(v17);
        v28 = v20;
        v21 = v17;
        v22 = *(_QWORD *)&v34[7];
        memset(v34, 0, sizeof(v34));
        *(_QWORD *)v29 = v21;
        *(_QWORD *)&v29[7] = v22;
        v30 = v19;
        v32 = 0LL;
        v33 = 0LL;
        v31 = 0LL;
        sub_A7174(a3[1] - 48LL, &v28);
        if ( (v31 & 1) != 0 )
        {
          free(v33);
          if ( (v28 & 1) == 0 )
          {
LABEL_16:
            if ( (v26 & 1) == 0 )
              goto LABEL_17;
            goto LABEL_23;
          }
        }
        else if ( (v28 & 1) == 0 )
        {
          goto LABEL_16;
        }
        free(v30);
        if ( (v26 & 1) == 0 )
        {
LABEL_17:
          if ( (v24 & 1) == 0 )
            return v8 + 1;
LABEL_18:
          free(p);
          return v8 + 1;
        }
LABEL_23:
        free(v27);
        if ( (v24 & 1) == 0 )
          return v8 + 1;
        goto LABEL_18;
      }
    }
  }
  return v4;
}
