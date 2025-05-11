// attributes: thunk
int __android_log_print(int prio, const char *tag, const char *fmt, ...)
{
  return _android_log_print(prio, tag, fmt);
}
