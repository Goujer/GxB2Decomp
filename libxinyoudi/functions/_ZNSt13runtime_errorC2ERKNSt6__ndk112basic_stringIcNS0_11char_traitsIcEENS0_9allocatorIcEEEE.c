void *__fastcall std::runtime_error::runtime_error(_QWORD *a1, __int64 a2)
{
  const char *v3; // x20
  size_t v4; // x21
  __int64 v5; // x0
  __int64 v6; // x22
  void *result; // x0

  *a1 = off_69E8A98;
  if ( (*(_BYTE *)a2 & 1) != 0 )
    v3 = *(const char **)(a2 + 16);
  else
    v3 = (const char *)(a2 + 1);
  v4 = strlen(v3);
  v5 = operator new(v4 + 25);
  v6 = v5 + 24;
  *(_QWORD *)v5 = v4;
  *(_QWORD *)(v5 + 8) = v4;
  *(_DWORD *)(v5 + 16) = 0;
  result = memcpy((void *)(v5 + 24), v3, v4 + 1);
  a1[1] = v6;
  return result;
}
