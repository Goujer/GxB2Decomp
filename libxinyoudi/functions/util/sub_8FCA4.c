void __fastcall sub_8FCA4(void *p)
{
  if ( p >= dword_69EA080 && p < &byte_69EA280 )
    JUMPOUT(0x8FBACLL);
  free(p);
}
