_BYTE *__fastcall sub_B1788(_BYTE *a1, _BYTE *a2, _QWORD *a3)
{
  _BYTE *v6; // x0
  _BYTE *v7; // x22
  _BYTE *v8; // x19
  __int64 v9; // x24
  unsigned __int64 v10; // x8
  bool v11; // zf
  size_t v12; // x8
  void *v13; // x1
  size_t v14; // x2
  __int64 v15; // x21
  _BYTE *v16; // x22
  void *v17; // x20
  char *v18; // x1
  size_t v19; // x2
  __int128 v21; // [xsp+0h] [xbp-50h] BYREF
  char *v22; // [xsp+10h] [xbp-40h]
  __int64 v23; // [xsp+18h] [xbp-38h]

  v23 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( a1 == a2 )
    return a1;
  v6 = (_BYTE *)sub_B190C(a1, a2, a3);
  v7 = v6;
  if ( v6 == a1 )
    return a1;
  v8 = sub_9D3DC(v6, a2, (__int64)a3);
  if ( v8 != v7 )
  {
    v9 = a3[1];
    v7 = a1;
    if ( 0xAAAAAAAAAAAAAAABLL * ((v9 - *a3) >> 4) >= 2 )
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
      v22 = *(char **)(v9 - 32);
      v21 = *(_OWORD *)(v9 - 48);
      *(_QWORD *)(v9 - 40) = 0LL;
      *(_QWORD *)(v9 - 32) = 0LL;
      *(_QWORD *)(v9 - 48) = 0LL;
      v15 = a3[1];
      v16 = (_BYTE *)(v15 - 48);
      if ( (*(_BYTE *)(v15 - 24) & 1) != 0 )
        free(*(void **)(v15 - 8));
      if ( (*v16 & 1) != 0 )
        free(*(void **)(v15 - 32));
      a3[1] = v16;
      v17 = v22;
      if ( (v21 & 1) != 0 )
        v18 = v22;
      else
        v18 = (char *)&v21 + 1;
      if ( (v21 & 1) != 0 )
        v19 = *((_QWORD *)&v21 + 1);
      else
        v19 = (unsigned __int64)(unsigned __int8)v21 >> 1;
      sub_9CFD0((size_t *)(v15 - 96), v18, v19);
      if ( (v21 & 1) != 0 )
        free(v17);
      return v8;
    }
  }
  return v7;
}
