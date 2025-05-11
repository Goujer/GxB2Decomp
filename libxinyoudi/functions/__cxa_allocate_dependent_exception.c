void *_cxa_allocate_dependent_exception()
{
  void *v0; // x0
  void *v1; // x19

  v0 = (void *)sub_8F9C4(128LL);
  v1 = v0;
  if ( !v0 )
    std::terminate();
  memset(v0, 0, 0x80uLL);
  return v1;
}
