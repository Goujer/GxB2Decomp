__int64 *__fastcall _register_frame_info_table_bases(__int64 a1, _QWORD *a2, __int64 a3, __int64 a4)
{
  __int16 v4; // w0
  __int64 *result; // x0
  _QWORD *v6; // [xsp+28h] [xbp+28h]

  a2[4] = 0LL;
  a2[3] = a1;
  *((_BYTE *)a2 + 32) = 2;
  a2[1] = a3;
  v4 = *((_WORD *)a2 + 16);
  *a2 = -1LL;
  a2[2] = a4;
  *((_WORD *)a2 + 16) = v4 | 0x7F8;
  if ( &pthread_create )
  {
    v6 = a2;
    pthread_mutex_lock(&stru_69EA488);
    a2 = v6;
  }
  result = &qword_69EA2E8;
  a2[5] = qword_69EA4B0;
  qword_69EA4B0 = (__int64)a2;
  if ( &pthread_create )
    return (__int64 *)pthread_mutex_unlock(&stru_69EA488);
  return result;
}
