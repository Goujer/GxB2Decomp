void *_cxa_begin_catch(void *a1)
{
  unsigned __int64 v2; // x20
  __int64 globals; // x0
  char *v4; // x8
  int v5; // w9

  v2 = *(_QWORD *)a1;
  globals = __cxa_get_globals();
  v4 = (char *)a1 - 96;
  if ( v2 >> 8 == 0x434C4E47432B2BLL )
  {
    v5 = *((_DWORD *)a1 - 12);
    if ( v5 < 0 )
      v5 = -v5;
    *((_DWORD *)a1 - 12) = v5 + 1;
    if ( *(char **)globals != v4 )
    {
      *((_QWORD *)a1 - 7) = *(_QWORD *)globals;
      *(_QWORD *)globals = v4;
    }
    --*(_DWORD *)(globals + 8);
    return (void *)*((_QWORD *)a1 - 2);
  }
  else
  {
    if ( *(_QWORD *)globals )
      std::terminate();
    *(_QWORD *)globals = v4;
    return (char *)a1 + 32;
  }
}
