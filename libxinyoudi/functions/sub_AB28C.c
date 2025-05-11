size_t *__usercall sub_AB28C@<X0>(size_t *__return_ptr a1@<X8>, char *s@<X1>, unsigned __int8 *a3@<X0>)
{
  unsigned __int64 v5; // x22
  size_t v6; // x24
  size_t v8; // x0
  bool v9; // zf
  size_t v10; // x21
  size_t v11; // x22
  unsigned __int64 v12; // x8
  const void *v13; // x23
  char *v14; // x24
  size_t v15; // x25

  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = 0LL;
  v5 = *a3;
  v6 = *((_QWORD *)a3 + 1);
  v8 = strlen(s);
  v9 = (v5 & 1) == 0;
  v10 = v8;
  if ( (v5 & 1) != 0 )
    v11 = v6;
  else
    v11 = v5 >> 1;
  v12 = v11 + v8;
  if ( v9 )
    v13 = a3 + 1;
  else
    v13 = (const void *)*((_QWORD *)a3 + 2);
  if ( v12 >= 0xFFFFFFFFFFFFFFF0LL )
    abort();
  if ( v12 <= 0x16 )
  {
    *(_BYTE *)a1 = 2 * v11;
    v14 = (char *)a1 + 1;
    if ( !v11 )
      goto LABEL_13;
    goto LABEL_12;
  }
  v15 = (v12 + 16) & 0xFFFFFFFFFFFFFFF0LL;
  v14 = (char *)malloc(v15);
  a1[1] = v11;
  a1[2] = (size_t)v14;
  *a1 = v15 | 1;
  if ( v11 )
LABEL_12:
    memcpy(v14, v13, v11);
LABEL_13:
  v14[v11] = 0;
  return sub_9CFD0(a1, s, v10);
}
