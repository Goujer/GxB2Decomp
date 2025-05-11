// attributes: thunk
void *__dynamic_cast(
        const void *lpsrc,
        const struct __class_type_info *lpstype,
        const struct __class_type_info *lpdtype,
        ptrdiff_t s2d)
{
  return _dynamic_cast(lpsrc, lpstype, lpdtype, s2d);
}
