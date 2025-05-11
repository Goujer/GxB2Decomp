// attributes: thunk
void __fastcall xinyoudi::FileRef::~FileRef(xinyoudi::FileRef *this)
{
  operator delete(this);
}
