void __fastcall operator delete(void *p)
{
  if ( p )
    free(p);
}
