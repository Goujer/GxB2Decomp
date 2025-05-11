__int64 __fastcall sub_AB388(unsigned __int8 *a1, unsigned __int8 *a2, _QWORD *a3)
{
  unsigned __int8 *v3; // x21
  unsigned __int8 *v4; // x20
  int v6; // w8
  unsigned __int8 *v7; // x22
  unsigned __int8 *v8; // x23
  __int64 result; // x0
  __int64 v10; // x21
  unsigned __int64 v11; // x8
  bool v12; // zf
  size_t v13; // x8
  void *v14; // x1
  size_t v15; // x2
  __int64 v16; // x21
  _BYTE *v17; // x22
  size_t *v18; // x0
  char v19; // w21
  void *v20; // x19
  char *v21; // x1
  size_t v22; // x2
  unsigned __int8 *v23; // x22
  __int64 v24; // x21
  unsigned __int64 v25; // x8
  bool v26; // zf
  size_t v27; // x8
  void *v28; // x1
  size_t v29; // x2
  __int64 v30; // x21
  _BYTE *v31; // x22
  __int64 v32; // x23
  __int64 v33; // x8
  __int128 v34; // [xsp+0h] [xbp-50h] BYREF
  char *v35; // [xsp+10h] [xbp-40h]
  __int64 v36; // [xsp+18h] [xbp-38h]

  v3 = a2;
  v4 = a1;
  v36 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( a2 - a1 < 2 )
    return (__int64)v4;
  v6 = *a1;
  if ( (v6 == 111 || v6 == 100) && a1[1] == 110 )
  {
    v7 = a1 + 2;
    if ( v6 == 111 )
    {
      v8 = (unsigned __int8 *)sub_AC0B0(a1 + 2, a2, a3);
      result = (__int64)v4;
      if ( v8 != v7 )
      {
        v4 = sub_9D3DC(v8, v3, (__int64)a3);
        result = (__int64)v8;
        if ( v4 != v8 )
        {
          v10 = a3[1];
          if ( 0xAAAAAAAAAAAAAAABLL * ((v10 - *a3) >> 4) >= 2 )
          {
            v11 = *(unsigned __int8 *)(v10 - 24);
            v12 = (v11 & 1) == 0;
            v13 = v11 >> 1;
            if ( v12 )
              v14 = (void *)(v10 - 23);
            else
              v14 = *(void **)(v10 - 8);
            if ( v12 )
              v15 = v13;
            else
              v15 = *(_QWORD *)(v10 - 16);
            sub_9CFD0((size_t *)(v10 - 48), v14, v15);
            v35 = *(char **)(v10 - 32);
            v34 = *(_OWORD *)(v10 - 48);
            *(_QWORD *)(v10 - 40) = 0LL;
            *(_QWORD *)(v10 - 32) = 0LL;
            *(_QWORD *)(v10 - 48) = 0LL;
            v16 = a3[1];
            v17 = (_BYTE *)(v16 - 48);
            if ( (*(_BYTE *)(v16 - 24) & 1) != 0 )
              free(*(void **)(v16 - 8));
            if ( (*v17 & 1) != 0 )
              free(*(void **)(v16 - 32));
            a3[1] = v17;
            v18 = (size_t *)(v16 - 96);
            v19 = v34;
            v20 = v35;
            if ( (v34 & 1) != 0 )
              v21 = v35;
            else
              v21 = (char *)&v34 + 1;
            if ( (v34 & 1) != 0 )
              v22 = *((_QWORD *)&v34 + 1);
            else
              v22 = (unsigned __int64)(unsigned __int8)v34 >> 1;
LABEL_45:
            sub_9CFD0(v18, v21, v22);
            if ( (v19 & 1) != 0 )
              free(v20);
            return (__int64)v4;
          }
          return (__int64)v4;
        }
      }
    }
    else
    {
      if ( v7 != a2 )
      {
        v32 = sub_AB6CC(a1 + 2, a2, a3);
        if ( (unsigned __int8 *)v32 == v7 )
          v32 = sub_B1788(v4 + 2, v3, a3);
        if ( (unsigned __int8 *)v32 == v7 )
        {
          v3 = v4 + 2;
        }
        else
        {
          v33 = a3[1];
          v3 = v4 + 2;
          if ( *a3 != v33 )
          {
            sub_9CDD8((size_t *)(v33 - 48), 0LL, "~", 1uLL);
            v3 = (unsigned __int8 *)v32;
          }
        }
      }
      if ( v3 == v7 )
        return (__int64)v4;
      else
        return (__int64)v3;
    }
  }
  else
  {
    result = sub_B1788(a1, a2, a3);
    if ( (unsigned __int8 *)result == v4 )
    {
      v23 = (unsigned __int8 *)sub_AC0B0(v4, v3, a3);
      result = (__int64)v4;
      if ( v23 != v4 )
      {
        v4 = sub_9D3DC(v23, v3, (__int64)a3);
        result = (__int64)v23;
        if ( v4 != v23 )
        {
          v24 = a3[1];
          if ( 0xAAAAAAAAAAAAAAABLL * ((v24 - *a3) >> 4) >= 2 )
          {
            v25 = *(unsigned __int8 *)(v24 - 24);
            v26 = (v25 & 1) == 0;
            v27 = v25 >> 1;
            if ( v26 )
              v28 = (void *)(v24 - 23);
            else
              v28 = *(void **)(v24 - 8);
            if ( v26 )
              v29 = v27;
            else
              v29 = *(_QWORD *)(v24 - 16);
            sub_9CFD0((size_t *)(v24 - 48), v28, v29);
            v35 = *(char **)(v24 - 32);
            v34 = *(_OWORD *)(v24 - 48);
            *(_QWORD *)(v24 - 40) = 0LL;
            *(_QWORD *)(v24 - 32) = 0LL;
            *(_QWORD *)(v24 - 48) = 0LL;
            v30 = a3[1];
            v31 = (_BYTE *)(v30 - 48);
            if ( (*(_BYTE *)(v30 - 24) & 1) != 0 )
              free(*(void **)(v30 - 8));
            if ( (*v31 & 1) != 0 )
              free(*(void **)(v30 - 32));
            a3[1] = v31;
            v18 = (size_t *)(v30 - 96);
            v19 = v34;
            v20 = v35;
            if ( (v34 & 1) != 0 )
              v21 = v35;
            else
              v21 = (char *)&v34 + 1;
            if ( (v34 & 1) != 0 )
              v22 = *((_QWORD *)&v34 + 1);
            else
              v22 = (unsigned __int64)(unsigned __int8)v34 >> 1;
            goto LABEL_45;
          }
          return (__int64)v4;
        }
      }
    }
  }
  return result;
}
