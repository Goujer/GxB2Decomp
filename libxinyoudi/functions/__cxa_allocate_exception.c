void *_cxa_allocate_exception(size_t thrown_size)
{
  size_t v1; // x19
  char *v2; // x0
  char *v3; // x20

  v1 = (thrown_size + 143) & 0xFFFFFFFFFFFFFFF0LL;
  v2 = (char *)sub_8F9C4(v1);
  v3 = v2;
  if ( !v2 )
    std::terminate();
  memset(v2, 0, v1);
  return v3 + 128;
}
