size_t *__usercall sub_9F8F0@<X0>(const char *a1@<X0>, unsigned __int8 *a2@<X1>, size_t *a3@<X8>)
{
  size_t v6; // x0
  unsigned __int64 v7; // x26
  size_t v8; // x23
  size_t v9; // x22
  unsigned __int64 v10; // x8
  void *v11; // x24
  size_t v12; // x25
  void *v13; // x1

  a3[1] = 0LL;
  a3[2] = 0LL;
  *a3 = 0LL;
  v6 = strlen(a1);
  v7 = *a2;
  v8 = v6;
  if ( (v7 & 1) != 0 )
    v9 = *((_QWORD *)a2 + 1);
  else
    v9 = v7 >> 1;
  v10 = v9 + v6;
  if ( v9 + v6 >= 0xFFFFFFFFFFFFFFF0LL )
    abort();
  if ( v10 > 0x16 )
  {
    v12 = (v10 + 16) & 0xFFFFFFFFFFFFFFF0LL;
    v11 = malloc(v12);
    a3[1] = v8;
    a3[2] = (size_t)v11;
    *a3 = v12 | 1;
    if ( !v8 )
      goto LABEL_10;
    goto LABEL_9;
  }
  *(_BYTE *)a3 = 2 * v6;
  v11 = (char *)a3 + 1;
  if ( v6 )
LABEL_9:
    memcpy(v11, a1, v8);
LABEL_10:
  *((_BYTE *)v11 + v8) = 0;
  if ( (v7 & 1) != 0 )
    v13 = (void *)*((_QWORD *)a2 + 2);
  else
    v13 = a2 + 1;
  return sub_9CFD0(a3, v13, v9);
}
