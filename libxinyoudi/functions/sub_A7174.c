long double __fastcall sub_A7174(unsigned __int64 *a1, __int64 a2)
{
  unsigned __int64 v4; // x24
  unsigned __int64 v5; // x22
  unsigned __int64 v6; // x23
  int v7; // w25
  unsigned __int64 v8; // x26
  _BYTE *v9; // x21
  _BYTE *v10; // x0
  _BYTE *v11; // x0
  bool v12; // cc
  _BYTE *v13; // x22
  _BYTE *v14; // x0
  long double *v15; // x22
  __int64 *v16; // x23
  __int64 v17; // x25
  unsigned __int64 v18; // x21
  unsigned __int64 v19; // x24
  int v20; // w26
  unsigned __int64 v21; // x27
  _BYTE *v22; // x19
  _BYTE *v23; // x0
  _BYTE *v24; // x0
  _BYTE *v25; // x21
  _BYTE *v26; // x0
  long double result; // q0

  if ( (*(_BYTE *)a1 & 1) == 0 )
  {
    *(_WORD *)a1 = 0;
    goto LABEL_23;
  }
  *(_BYTE *)a1[2] = 0;
  LOBYTE(v4) = *(_BYTE *)a1;
  a1[1] = 0LL;
  if ( (v4 & 1) != 0 )
  {
    v4 = *a1;
    v5 = (*a1 & 0xFFFFFFFFFFFFFFFELL) - 1;
    if ( (*a1 & 1) != 0 )
    {
      v6 = 0LL;
      v7 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v5 = 22LL;
  }
  v6 = (unsigned __int64)((unsigned __int8)v4 & 0xFE) >> 1;
  if ( (unsigned __int8)v4 >= 0x2Eu )
  {
    v8 = ((unsigned __int8)(v6 + 16) & 0xF0) - 1LL;
    v7 = 1;
    if ( v8 == v5 )
      goto LABEL_23;
    goto LABEL_10;
  }
  v7 = 1;
LABEL_9:
  v8 = 22LL;
  if ( v5 == 22 )
    goto LABEL_23;
LABEL_10:
  if ( v8 == 22 )
  {
    v9 = (_BYTE *)a1[2];
    v10 = (char *)a1 + 1;
    if ( v7 )
      memcpy(v10, (const void *)a1[2], ((unsigned __int64)((unsigned __int8)v4 & 0xFE) >> 1) + 1);
    else
      *v10 = *v9;
    free(v9);
    *(_BYTE *)a1 = 2 * v6;
  }
  else
  {
    v11 = malloc(v8 + 1);
    v12 = v8 > v5;
    v13 = v11;
    if ( v12 || v11 )
    {
      if ( (v7 & 1) != 0 )
      {
        memcpy(v11, (char *)a1 + 1, ((unsigned __int64)((unsigned __int8)v4 & 0xFE) >> 1) + 1);
      }
      else
      {
        v14 = (_BYTE *)a1[2];
        *v13 = *v14;
        free(v14);
      }
      *a1 = (v8 + 1) | 1;
      a1[1] = v6;
      a1[2] = (unsigned __int64)v13;
    }
  }
LABEL_23:
  v15 = (long double *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a2 + 8) = 0LL;
  *(_QWORD *)(a2 + 16) = 0LL;
  *(_QWORD *)a2 = 0LL;
  v16 = (__int64 *)(a1 + 3);
  if ( (a1[3] & 1) == 0 )
  {
    *(_WORD *)v16 = 0;
    goto LABEL_45;
  }
  *(_BYTE *)a1[5] = 0;
  LOBYTE(v17) = *((_BYTE *)a1 + 24);
  a1[4] = 0LL;
  if ( (v17 & 1) != 0 )
  {
    v17 = *v16;
    v18 = (*v16 & 0xFFFFFFFFFFFFFFFELL) - 1;
    if ( (*v16 & 1) != 0 )
    {
      v19 = 0LL;
      v20 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    v18 = 22LL;
  }
  v19 = (unsigned __int64)((unsigned __int8)v17 & 0xFE) >> 1;
  if ( (unsigned __int8)v17 < 0x2Eu )
  {
    v20 = 1;
LABEL_31:
    v21 = 22LL;
    if ( v18 == 22 )
      goto LABEL_45;
    goto LABEL_32;
  }
  v21 = ((unsigned __int8)(v19 + 16) & 0xF0) - 1LL;
  v20 = 1;
  if ( v21 == v18 )
    goto LABEL_45;
LABEL_32:
  if ( v21 == 22 )
  {
    v22 = (_BYTE *)a1[5];
    v23 = (char *)v16 + 1;
    if ( v20 )
      memcpy(v23, v22, ((unsigned __int64)((unsigned __int8)v17 & 0xFE) >> 1) + 1);
    else
      *v23 = *v22;
    free(v22);
    *(_BYTE *)v16 = 2 * v19;
  }
  else
  {
    v24 = malloc(v21 + 1);
    v12 = v21 > v18;
    v25 = v24;
    if ( v12 || v24 )
    {
      if ( (v20 & 1) != 0 )
      {
        memcpy(v24, (char *)a1 + 25, ((unsigned __int64)((unsigned __int8)v17 & 0xFE) >> 1) + 1);
      }
      else
      {
        v26 = (_BYTE *)a1[5];
        *v25 = *v26;
        free(v26);
      }
      a1[3] = (v21 + 1) | 1;
      a1[4] = v19;
      a1[5] = (unsigned __int64)v25;
    }
  }
LABEL_45:
  v16[2] = *(_QWORD *)(a2 + 40);
  result = *v15;
  *(long double *)v16 = *v15;
  *(_QWORD *)(a2 + 32) = 0LL;
  *(_QWORD *)(a2 + 40) = 0LL;
  *(_QWORD *)v15 = 0LL;
  return result;
}
