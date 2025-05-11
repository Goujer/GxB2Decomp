size_t **__fastcall sub_9D15C(size_t **result, __int64 a2, __int64 *a3)
{
  size_t **v3; // x19
  size_t *v4; // x8
  size_t *v6; // x20
  size_t v7; // x22
  const void *v8; // x23
  void *v9; // x24
  size_t v10; // x22
  const void *v11; // x21
  void *v12; // x23

  v3 = result;
  result[1] = 0LL;
  result[2] = 0LL;
  *result = 0LL;
  v4 = (size_t *)*a3;
  result[3] = (size_t *)*a3;
  v6 = (size_t *)v4[512];
  if ( (unsigned __int64)((char *)(v4 + 512) - (char *)v6) >= 0x30 )
  {
    v4[512] = (size_t)(v6 + 6);
  }
  else
  {
    result = (size_t **)malloc(0x30uLL);
    v6 = (size_t *)result;
  }
  *v3 = v6;
  v3[1] = v6;
  v3[2] = v6 + 6;
  v6[1] = 0LL;
  v6[2] = 0LL;
  *v6 = 0LL;
  if ( (*(_BYTE *)a2 & 1) == 0 )
  {
    v6[2] = *(_QWORD *)(a2 + 16);
    *(_OWORD *)v6 = *(_OWORD *)a2;
    goto LABEL_13;
  }
  v7 = *(_QWORD *)(a2 + 8);
  if ( v7 >= 0xFFFFFFFFFFFFFFF0LL )
    abort();
  v8 = *(const void **)(a2 + 16);
  if ( v7 >= 0x17 )
  {
    v9 = malloc((v7 + 16) & 0xFFFFFFFFFFFFFFF0LL);
    v6[1] = v7;
    v6[2] = (size_t)v9;
    *v6 = (v7 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
  }
  else
  {
    *(_BYTE *)v6 = 2 * v7;
    v9 = (char *)v6 + 1;
    if ( !v7 )
      goto LABEL_12;
  }
  result = (size_t **)memcpy(v9, v8, v7);
LABEL_12:
  *((_BYTE *)v9 + v7) = 0;
LABEL_13:
  v6[3] = 0LL;
  v6[4] = 0LL;
  v6[5] = 0LL;
  if ( (*(_BYTE *)(a2 + 24) & 1) != 0 )
  {
    v10 = *(_QWORD *)(a2 + 32);
    if ( v10 >= 0xFFFFFFFFFFFFFFF0LL )
      abort();
    v11 = *(const void **)(a2 + 40);
    if ( v10 >= 0x17 )
    {
      v12 = malloc((v10 + 16) & 0xFFFFFFFFFFFFFFF0LL);
      v6[4] = v10;
      v6[5] = (size_t)v12;
      v6[3] = (v10 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
    }
    else
    {
      v12 = (char *)v6 + 25;
      *((_BYTE *)v6 + 24) = 2 * v10;
      if ( !v10 )
        goto LABEL_21;
    }
    result = (size_t **)memcpy(v12, v11, v10);
LABEL_21:
    *((_BYTE *)v12 + v10) = 0;
    goto LABEL_22;
  }
  v6[5] = *(_QWORD *)(a2 + 40);
  *(_OWORD *)(v6 + 3) = *(_OWORD *)(a2 + 24);
LABEL_22:
  v3[1] += 6;
  return result;
}
