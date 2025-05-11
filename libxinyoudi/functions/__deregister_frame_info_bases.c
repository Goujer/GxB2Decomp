__int64 __fastcall _deregister_frame_info_bases(_DWORD *a1)
{
  __int64 *j; // x0
  __int64 i; // x19

  if ( !a1 || !*a1 )
    return 0LL;
  if ( &pthread_create )
    pthread_mutex_lock(&stru_69EA488);
  j = &qword_69EA4B0;
  for ( i = qword_69EA4B0; i; i = *(_QWORD *)(i + 40) )
  {
    if ( *(_DWORD **)(i + 24) == a1 )
    {
LABEL_14:
      *j = *(_QWORD *)(i + 40);
      goto LABEL_21;
    }
    j = (__int64 *)(i + 40);
  }
  for ( j = &qword_69EA4B8; ; j = (__int64 *)(i + 40) )
  {
    i = *j;
    if ( !*j )
    {
      if ( !&pthread_create )
        goto LABEL_20;
      goto LABEL_19;
    }
    if ( (*(_BYTE *)(i + 32) & 1) != 0 )
      break;
    if ( *(_DWORD **)(i + 24) == a1 )
      goto LABEL_14;
LABEL_10:
    ;
  }
  if ( **(_DWORD ***)(i + 24) != a1 )
    goto LABEL_10;
  *j = *(_QWORD *)(i + 40);
  free(*(void **)(i + 24));
LABEL_21:
  if ( &pthread_create )
  {
LABEL_19:
    pthread_mutex_unlock(&stru_69EA488);
    if ( i )
      return i;
LABEL_20:
    abort();
  }
  return i;
}
