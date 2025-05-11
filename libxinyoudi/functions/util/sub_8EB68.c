__int64 sub_8EB68()
{
  __int64 result; // x0

  result = pthread_key_create((pthread_key_t *)&dword_69EA040, (void (*)(void *))sub_8EB9C);
  if ( (_DWORD)result )
    sub_9035C("cannot create thread specific key for __cxa_get_globals()");
  return result;
}
