void __fastcall sub_B23DC(size_t *a1, char a2)
{
  unsigned __int64 v3; // x8
  size_t v5; // x9
  size_t v6; // x25
  size_t v7; // x21
  char *v8; // x23
  void *v9; // x22
  unsigned __int64 v10; // x8
  size_t v11; // x24
  char *v12; // x8

  v3 = *(unsigned __int8 *)a1;
  if ( (v3 & 1) != 0 )
  {
    v5 = *a1;
    v6 = a1[1];
    v7 = (*a1 & 0xFFFFFFFFFFFFFFFELL) - 1;
    if ( v6 != v7 )
      goto LABEL_3;
LABEL_6:
    if ( v7 == -17LL )
      abort();
    if ( (v5 & 1) != 0 )
      v9 = (void *)a1[2];
    else
      v9 = (char *)a1 + 1;
    if ( v7 > 0x7FFFFFFFFFFFFFE6LL )
    {
      v11 = -17LL;
    }
    else
    {
      if ( v7 + 1 >= 2 * v7 )
        v10 = v7 + 1;
      else
        v10 = 2 * v7;
      if ( v10 >= 0x17 )
        v11 = (v10 + 16) & 0xFFFFFFFFFFFFFFF0LL;
      else
        v11 = 23LL;
    }
    v8 = (char *)malloc(v11);
    memcpy(v8, v9, v7);
    if ( v7 != 22 )
      free(v9);
    a1[2] = (size_t)v8;
    *a1 = v11 | 1;
    goto LABEL_22;
  }
  v6 = v3 >> 1;
  v7 = 22LL;
  LOBYTE(v5) = *(_BYTE *)a1;
  if ( v3 >> 1 == 22 )
    goto LABEL_6;
LABEL_3:
  if ( (v3 & 1) != 0 )
  {
    v8 = (char *)a1[2];
LABEL_22:
    a1[1] = v6 + 1;
    goto LABEL_23;
  }
  *(_BYTE *)a1 = 2 * v6 + 2;
  v8 = (char *)a1 + 1;
LABEL_23:
  v12 = &v8[v6];
  *v12 = a2;
  v12[1] = 0;
}
