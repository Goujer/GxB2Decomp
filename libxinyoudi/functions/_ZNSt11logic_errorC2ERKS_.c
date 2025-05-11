_QWORD *__fastcall std::logic_error::logic_error(_QWORD *result, __int64 a2)
{
  __int64 v2; // x8
  unsigned int *v3; // x8
  unsigned int v4; // w9

  *result = off_69E8A70;
  v2 = *(_QWORD *)(a2 + 8);
  result[1] = v2;
  v3 = (unsigned int *)(v2 - 8);
  do
    v4 = __ldaxr(v3);
  while ( __stlxr(v4 + 1, v3) );
  return result;
}
