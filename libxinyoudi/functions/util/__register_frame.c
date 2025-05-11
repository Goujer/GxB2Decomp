_DWORD *__fastcall _register_frame(_DWORD *result)
{
  if ( *result )
  {
    malloc(0x30uLL);
    return (_DWORD *)__register_frame_info();
  }
  return result;
}
