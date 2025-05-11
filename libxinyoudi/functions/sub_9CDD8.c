size_t *__fastcall sub_9CDD8(size_t *a1, size_t a2, char *src, size_t n)
{
  size_t v5; // x8
  char *v7; // x21
  size_t v9; // x24
  size_t v10; // x22
  unsigned __int64 v11; // x28
  unsigned __int64 v12; // x24
  char *v13; // x8
  char *v14; // x25
  char *v15; // x23
  unsigned __int64 v16; // x8
  size_t v17; // x25
  size_t v19; // x8
  char *v20; // x8
  char *v21; // x0
  char *v22; // x26
  char *srca; // [xsp+8h] [xbp-58h]

  v5 = *(unsigned __int8 *)a1;
  v7 = src;
  if ( (v5 & 1) != 0 )
  {
    v9 = a1[1];
    v10 = v9 - a2;
    if ( v9 < a2 )
      goto LABEL_44;
  }
  else
  {
    v9 = v5 >> 1;
    v10 = (v5 >> 1) - a2;
    if ( v5 >> 1 < a2 )
LABEL_44:
      abort();
  }
  if ( (v5 & 1) != 0 )
  {
    v5 = *a1;
    v11 = (*a1 & 0xFFFFFFFFFFFFFFFELL) - 1;
  }
  else
  {
    v11 = 22LL;
  }
  if ( v11 - v9 < n )
  {
    v12 = v9 + n;
    if ( -18LL - v11 < v12 - v11 )
      goto LABEL_44;
    if ( (v5 & 1) != 0 )
      v13 = (char *)a1[2];
    else
      v13 = (char *)a1 + 1;
    srca = v13;
    if ( v11 > 0x7FFFFFFFFFFFFFE6LL )
    {
      v17 = -17LL;
    }
    else
    {
      v16 = 2 * v11;
      if ( v12 >= 2 * v11 )
        v16 = v12;
      if ( v16 >= 0x17 )
        v17 = (v16 + 16) & 0xFFFFFFFFFFFFFFF0LL;
      else
        v17 = 23LL;
    }
    v21 = (char *)malloc(v17);
    v22 = v21;
    if ( a2 )
      memcpy(v21, srca, a2);
    memcpy(&v22[a2], v7, n);
    if ( v10 )
      memcpy(&v22[a2 + n], &srca[a2], v10);
    if ( v11 != 22 )
      free(srca);
    *a1 = v17 | 1;
    v20 = &v22[v12];
    a1[1] = v12;
    a1[2] = (size_t)v22;
    goto LABEL_42;
  }
  if ( n )
  {
    if ( (v5 & 1) != 0 )
    {
      v14 = (char *)a1[2];
      v15 = &v14[a2];
      if ( !v10 )
      {
LABEL_30:
        memmove(v15, v7, n);
        v19 = v9 + n;
        if ( (*(_BYTE *)a1 & 1) != 0 )
          a1[1] = v19;
        else
          *(_BYTE *)a1 = 2 * v19;
        v20 = &v14[v19];
LABEL_42:
        *v20 = 0;
        return a1;
      }
    }
    else
    {
      v14 = (char *)a1 + 1;
      v15 = (char *)a1 + a2 + 1;
      if ( !v10 )
        goto LABEL_30;
    }
    if ( &v14[v9] > src && v15 <= src )
      v7 = &src[n];
    memmove(&v15[n], v15, v10);
    goto LABEL_30;
  }
  return a1;
}
