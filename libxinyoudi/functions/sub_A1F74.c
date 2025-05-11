void __fastcall sub_A1F74(size_t *a1, void *src, size_t n)
{
  size_t v4; // x8
  unsigned __int64 v7; // x25
  _BYTE *v8; // x22
  void *v9; // x22
  unsigned __int64 v10; // x8
  size_t v11; // x23
  void *v12; // x24

  LOBYTE(v4) = *(_BYTE *)a1;
  if ( (*(_BYTE *)a1 & 1) != 0 )
  {
    v4 = *a1;
    v7 = (*a1 & 0xFFFFFFFFFFFFFFFELL) - 1;
    if ( v7 >= n )
    {
LABEL_3:
      if ( (v4 & 1) != 0 )
      {
        v8 = (_BYTE *)a1[2];
        if ( !n )
          goto LABEL_12;
      }
      else
      {
        v8 = (char *)a1 + 1;
        if ( !n )
        {
LABEL_12:
          v8[n] = 0;
          if ( (*(_BYTE *)a1 & 1) != 0 )
            a1[1] = n;
          else
            *(_BYTE *)a1 = 2 * n;
          return;
        }
      }
      memmove(v8, src, n);
      goto LABEL_12;
    }
  }
  else
  {
    v7 = 22LL;
    if ( n <= 0x16 )
      goto LABEL_3;
  }
  if ( -18LL - v7 < n - v7 )
    abort();
  if ( (v4 & 1) != 0 )
    v9 = (void *)a1[2];
  else
    v9 = (char *)a1 + 1;
  if ( v7 > 0x7FFFFFFFFFFFFFE6LL )
  {
    v11 = -17LL;
  }
  else
  {
    v10 = 2 * v7;
    if ( 2 * v7 <= n )
      v10 = n;
    if ( v10 >= 0x17 )
      v11 = (v10 + 16) & 0xFFFFFFFFFFFFFFF0LL;
    else
      v11 = 23LL;
  }
  v12 = malloc(v11);
  memcpy(v12, src, n);
  if ( v7 != 22 )
    free(v9);
  a1[1] = n;
  a1[2] = (size_t)v12;
  *a1 = v11 | 1;
  *((_BYTE *)v12 + n) = 0;
}
