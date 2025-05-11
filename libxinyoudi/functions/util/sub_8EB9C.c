__int64 sub_8EB9C()
{
  __int64 result; // x0

  sub_8FCA4();
  result = pthread_setspecific(dword_69EA040, 0LL);
  if ( (_DWORD)result )
    sub_9035C("cannot zero out thread value for __cxa_get_globals()");
  return result;
}
