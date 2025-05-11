__int64 __fastcall std::runtime_error::operator=(__int64 a1, __int64 a2)
{
  __int64 v3; // x9
  __int64 v4; // x8
  unsigned int *v5; // x9
  unsigned int v6; // w10
  unsigned int *v7; // x9
  unsigned int v8; // w10
  unsigned int v9; // w10

  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v3;
  v5 = (unsigned int *)(v3 - 8);
  do
    v6 = __ldaxr(v5);
  while ( __stlxr(v6 + 1, v5) );
  v7 = (unsigned int *)(v4 - 8);
  do
  {
    v8 = __ldaxr(v7);
    v9 = v8 - 1;
  }
  while ( __stlxr(v9, v7) );
  if ( (v9 & 0x80000000) != 0 )
    operator delete((void *)(v4 - 24));
  return a1;
}
