__int64 *__fastcall _register_frame_info_bases(__int64 *result, _QWORD *a2, __int64 a3, __int64 a4)
{
  if ( result && *(_DWORD *)result )
  {
    *a2 = -1LL;
    a2[4] = 0LL;
    a2[3] = result;
    a2[1] = a3;
    a2[2] = a4;
    *((_WORD *)a2 + 16) = 2040;
    if ( &pthread_create )
      pthread_mutex_lock(&stru_69EA488);
    result = &qword_69EA2E8;
    a2[5] = qword_69EA4B0;
    qword_69EA4B0 = (__int64)a2;
    if ( &pthread_create )
      return (__int64 *)pthread_mutex_unlock(&stru_69EA488);
  }
  return result;
}
