// attributes: thunk
void __fastcall std::type_info::~type_info(std::type_info *this)
{
  operator delete(this);
}
