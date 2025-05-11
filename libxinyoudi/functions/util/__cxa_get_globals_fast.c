void *_cxa_get_globals_fast()
{
  if ( pthread_once(&dword_69EA044, (void (*)(void))sub_8EB68) )
    sub_9035C("execute once failure in __cxa_get_globals_fast()");
  return pthread_getspecific(dword_69EA040);
}
