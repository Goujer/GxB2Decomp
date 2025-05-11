void __fastcall _deregister_frame(_DWORD *a1)
{
  void *v1; // x0

  if ( *a1 )
  {
    v1 = (void *)__deregister_frame_info();
    free(v1);
  }
}
