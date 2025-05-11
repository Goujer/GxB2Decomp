void *_cxa_get_globals()
{
  void *v0; // x19

  if ( pthread_once(&dword_69EA044, (void (*)(void))sub_8EB68) )
    sub_9035C("execute once failure in __cxa_get_globals_fast()");
  v0 = pthread_getspecific(dword_69EA040);
  if ( !v0 )
  {
    v0 = (void *)sub_8FB2C(1LL, 16LL);
    if ( !v0 )
      sub_9035C("cannot allocate __cxa_eh_globals");
    if ( pthread_setspecific(dword_69EA040, v0) )
      sub_9035C("std::__libcpp_tls_set failure in __cxa_get_globals()");
  }
  return v0;
}
