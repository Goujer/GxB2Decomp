size_t *__fastcall sub_9CFD0(size_t *a1, void *src, size_t n)
{
  size_t v4; // x8
  unsigned __int64 v7; // x26
  size_t v8; // x22
  unsigned __int64 v9; // x27
  void *v10; // x23
  size_t v11; // x23
  unsigned __int64 v12; // x8
  size_t v13; // x24
  __int64 v14; // x8
  char *v15; // x8
  char *v16; // x0
  char *v17; // x25

  LOBYTE(v4) = *(_BYTE *)a1;
  if ( (*(_BYTE *)a1 & 1) != 0 )
  {
    v4 = *a1;
    v7 = (*a1 & 0xFFFFFFFFFFFFFFFELL) - 1;
    if ( (*a1 & 1) != 0 )
    {
      v8 = a1[1];
      goto LABEL_6;
    }
  }
  else
  {
    v7 = 22LL;
  }
  v8 = (unsigned __int64)((unsigned __int8)v4 & 0xFE) >> 1;
LABEL_6:
  if ( v7 - v8 < n )
  {
    v9 = v8 + n;
    if ( -18LL - v7 < v8 + n - v7 )
      abort();
    if ( (v4 & 1) != 0 )
      v10 = (void *)a1[2];
    else
      v10 = (char *)a1 + 1;
    if ( v7 > 0x7FFFFFFFFFFFFFE6LL )
    {
      v13 = -17LL;
    }
    else
    {
      v12 = 2 * v7;
      if ( v9 >= 2 * v7 )
        v12 = v8 + n;
      if ( v12 >= 0x17 )
        v13 = (v12 + 16) & 0xFFFFFFFFFFFFFFF0LL;
      else
        v13 = 23LL;
    }
    v16 = (char *)malloc(v13);
    v17 = v16;
    if ( v8 )
      memcpy(v16, v10, v8);
    memcpy(&v17[v8], src, n);
    if ( v7 != 22 )
      free(v10);
    *a1 = v13 | 1;
    v15 = &v17[v9];
    a1[1] = v9;
    a1[2] = (size_t)v17;
    goto LABEL_31;
  }
  if ( n )
  {
    if ( (v4 & 1) != 0 )
      v11 = a1[2];
    else
      v11 = (size_t)a1 + 1;
    memcpy((void *)(v11 + v8), src, n);
    v14 = v8 + n;
    if ( (*(_BYTE *)a1 & 1) != 0 )
      a1[1] = v14;
    else
      *(_BYTE *)a1 = 2 * v14;
    v15 = (char *)(v11 + v14);
LABEL_31:
    *v15 = 0;
  }
  return a1;
}
