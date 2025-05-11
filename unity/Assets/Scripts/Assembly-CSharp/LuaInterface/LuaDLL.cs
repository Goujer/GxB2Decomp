using System;
using System.Runtime.InteropServices;

namespace LuaInterface
{
	public class LuaDLL
	{
		public static string version;

		public static int LUA_MULTRET;

		public static string[] LuaTypeName;

		private const string LUADLL = "tolua";

		[PreserveSig]
		public static extern int luaopen_sproto_core(IntPtr L);

		[PreserveSig]
		public static extern int luaopen_protobuf_c(IntPtr L);

		[PreserveSig]
		public static extern int luaopen_pb(IntPtr L);

		[PreserveSig]
		public static extern int luaopen_ffi(IntPtr L);

		[PreserveSig]
		public static extern int luaopen_bit(IntPtr L);

		[PreserveSig]
		public static extern int luaopen_struct(IntPtr L);

		[PreserveSig]
		public static extern int luaopen_lpeg(IntPtr L);

		[PreserveSig]
		public static extern int luaopen_socket_core(IntPtr L);

		[PreserveSig]
		public static extern int luaopen_mime_core(IntPtr L);

		[PreserveSig]
		public static extern int luaopen_cjson(IntPtr L);

		[PreserveSig]
		public static extern int luaopen_cjson_safe(IntPtr L);

		[PreserveSig]
		public static extern int luaopen_lsqlite3(IntPtr L);

		public static int lua_upvalueindex(int i)
		{
			return 0;
		}

		[PreserveSig]
		public static extern void lua_close(IntPtr luaState);

		[PreserveSig]
		public static extern IntPtr lua_newthread(IntPtr L);

		[PreserveSig]
		public static extern IntPtr lua_atpanic(IntPtr luaState, IntPtr panic);

		[PreserveSig]
		public static extern int lua_gettop(IntPtr luaState);

		[PreserveSig]
		public static extern void lua_settop(IntPtr luaState, int top);

		[PreserveSig]
		public static extern void lua_pushvalue(IntPtr luaState, int idx);

		[PreserveSig]
		public static extern void lua_remove(IntPtr luaState, int idx);

		[PreserveSig]
		public static extern void lua_insert(IntPtr luaState, int idx);

		[PreserveSig]
		public static extern void lua_replace(IntPtr luaState, int index);

		[PreserveSig]
		public static extern int lua_checkstack(IntPtr luaState, int extra);

		[PreserveSig]
		public static extern void lua_xmove(IntPtr from, IntPtr to, int n);

		[PreserveSig]
		public static extern int lua_isnumber(IntPtr luaState, int idx);

		[PreserveSig]
		public static extern int lua_isstring(IntPtr luaState, int index);

		[PreserveSig]
		public static extern int lua_iscfunction(IntPtr luaState, int index);

		[PreserveSig]
		public static extern int lua_isuserdata(IntPtr luaState, int stackPos);

		[PreserveSig]
		public static extern LuaTypes lua_type(IntPtr luaState, int index);

		public static string lua_typename(IntPtr luaState, LuaTypes type)
		{
			return null;
		}

		[PreserveSig]
		public static extern int lua_equal(IntPtr luaState, int idx1, int idx2);

		[PreserveSig]
		public static extern int lua_rawequal(IntPtr luaState, int idx1, int idx2);

		[PreserveSig]
		public static extern int lua_lessthan(IntPtr luaState, int idx1, int idx2);

		[PreserveSig]
		public static extern double lua_tonumber(IntPtr luaState, int idx);

		public static int lua_tointeger(IntPtr luaState, int idx)
		{
			return 0;
		}

		public static bool lua_toboolean(IntPtr luaState, int idx)
		{
			return false;
		}

		public static IntPtr lua_tolstring(IntPtr luaState, int index, out int strLen)
		{
			strLen = default(int);
			return (IntPtr)0;
		}

		public static int lua_objlen(IntPtr luaState, int idx)
		{
			return 0;
		}

		[PreserveSig]
		public static extern IntPtr lua_tocfunction(IntPtr luaState, int idx);

		[PreserveSig]
		public static extern IntPtr lua_touserdata(IntPtr luaState, int idx);

		[PreserveSig]
		public static extern IntPtr lua_tothread(IntPtr L, int idx);

		[PreserveSig]
		public static extern IntPtr lua_topointer(IntPtr L, int idx);

		[PreserveSig]
		public static extern void lua_pushnil(IntPtr luaState);

		[PreserveSig]
		public static extern void lua_pushnumber(IntPtr luaState, double number);

		public static void lua_pushinteger(IntPtr L, int n)
		{
		}

		public static void lua_pushlstring(IntPtr luaState, byte[] str, int size)
		{
		}

		[PreserveSig]
		public static extern void lua_pushstring(IntPtr luaState, string str);

		[PreserveSig]
		public static extern void lua_pushcclosure(IntPtr luaState, IntPtr fn, int n);

		[PreserveSig]
		public static extern void lua_pushboolean(IntPtr luaState, int value);

		public static void lua_pushboolean(IntPtr luaState, bool value)
		{
		}

		[PreserveSig]
		public static extern void lua_pushlightuserdata(IntPtr luaState, IntPtr udata);

		[PreserveSig]
		public static extern int lua_pushthread(IntPtr L);

		public static void lua_gettable(IntPtr L, int idx)
		{
		}

		public static void lua_getfield(IntPtr L, int idx, string key)
		{
		}

		[PreserveSig]
		public static extern void lua_rawget(IntPtr luaState, int idx);

		[PreserveSig]
		public static extern void lua_rawgeti(IntPtr luaState, int idx, int n);

		[PreserveSig]
		public static extern void lua_createtable(IntPtr luaState, int narr, int nrec);

		public static IntPtr lua_newuserdata(IntPtr luaState, int size)
		{
			return (IntPtr)0;
		}

		[PreserveSig]
		public static extern int lua_getmetatable(IntPtr luaState, int objIndex);

		[PreserveSig]
		public static extern void lua_getfenv(IntPtr luaState, int idx);

		public static void lua_settable(IntPtr L, int idx)
		{
		}

		public static void lua_setfield(IntPtr L, int idx, string key)
		{
		}

		[PreserveSig]
		public static extern void lua_rawset(IntPtr luaState, int idx);

		[PreserveSig]
		public static extern void lua_rawseti(IntPtr luaState, int tableIndex, int index);

		[PreserveSig]
		public static extern void lua_setmetatable(IntPtr luaState, int objIndex);

		[PreserveSig]
		public static extern int lua_setfenv(IntPtr luaState, int stackPos);

		[PreserveSig]
		public static extern void lua_call(IntPtr luaState, int nArgs, int nResults);

		[PreserveSig]
		public static extern int lua_pcall(IntPtr luaState, int nArgs, int nResults, int errfunc);

		[PreserveSig]
		public static extern int lua_cpcall(IntPtr L, IntPtr func, IntPtr ud);

		[PreserveSig]
		public static extern int lua_yield(IntPtr L, int nresults);

		[PreserveSig]
		public static extern int lua_resume(IntPtr L, int narg);

		[PreserveSig]
		public static extern int lua_status(IntPtr L);

		[PreserveSig]
		public static extern int lua_gc(IntPtr luaState, LuaGCOptions what, int data);

		[PreserveSig]
		public static extern int lua_next(IntPtr luaState, int index);

		[PreserveSig]
		public static extern void lua_concat(IntPtr luaState, int n);

		public static void lua_pop(IntPtr luaState, int amount)
		{
		}

		public static void lua_newtable(IntPtr luaState)
		{
		}

		public static void lua_register(IntPtr luaState, string name, LuaCSFunction func)
		{
		}

		public static void lua_pushcfunction(IntPtr luaState, LuaCSFunction func)
		{
		}

		public static bool lua_isfunction(IntPtr luaState, int n)
		{
			return false;
		}

		public static bool lua_istable(IntPtr luaState, int n)
		{
			return false;
		}

		public static bool lua_islightuserdata(IntPtr luaState, int n)
		{
			return false;
		}

		public static bool lua_isnil(IntPtr luaState, int n)
		{
			return false;
		}

		public static bool lua_isboolean(IntPtr luaState, int n)
		{
			return false;
		}

		public static bool lua_isthread(IntPtr luaState, int n)
		{
			return false;
		}

		public static bool lua_isnone(IntPtr luaState, int n)
		{
			return false;
		}

		public static bool lua_isnoneornil(IntPtr luaState, int n)
		{
			return false;
		}

		public static void lua_setglobal(IntPtr luaState, string name)
		{
		}

		public static void lua_getglobal(IntPtr luaState, string name)
		{
		}

		public static string lua_ptrtostring(IntPtr str, int len)
		{
			return null;
		}

		public static string lua_tostring(IntPtr luaState, int index)
		{
			return null;
		}

		public static IntPtr lua_open()
		{
			return (IntPtr)0;
		}

		public static void lua_getregistry(IntPtr L)
		{
		}

		public static int lua_getgccount(IntPtr L)
		{
			return 0;
		}

		[PreserveSig]
		public static extern int lua_getstack(IntPtr L, int level, ref Lua_Debug ar);

		[PreserveSig]
		public static extern int lua_getinfo(IntPtr L, string what, ref Lua_Debug ar);

		[PreserveSig]
		public static extern string lua_getlocal(IntPtr L, ref Lua_Debug ar, int n);

		[PreserveSig]
		public static extern string lua_setlocal(IntPtr L, ref Lua_Debug ar, int n);

		[PreserveSig]
		public static extern string lua_getupvalue(IntPtr L, int funcindex, int n);

		[PreserveSig]
		public static extern string lua_setupvalue(IntPtr L, int funcindex, int n);

		[PreserveSig]
		public static extern int lua_sethook(IntPtr L, LuaHookFunc func, int mask, int count);

		[PreserveSig]
		public static extern LuaHookFunc lua_gethook(IntPtr L);

		[PreserveSig]
		public static extern int lua_gethookmask(IntPtr L);

		[PreserveSig]
		public static extern int lua_gethookcount(IntPtr L);

		[PreserveSig]
		public static extern void luaL_openlibs(IntPtr luaState);

		public static int abs_index(IntPtr L, int i)
		{
			return 0;
		}

		public static int luaL_getn(IntPtr luaState, int i)
		{
			return 0;
		}

		[PreserveSig]
		public static extern int luaL_getmetafield(IntPtr luaState, int stackPos, string field);

		public static int luaL_callmeta(IntPtr L, int stackPos, string field)
		{
			return 0;
		}

		public static int luaL_argerror(IntPtr L, int narg, string extramsg)
		{
			return 0;
		}

		public static int luaL_typerror(IntPtr L, int stackPos, string tname, string t2 = null)
		{
			return 0;
		}

		public static string luaL_checklstring(IntPtr L, int numArg, out int len)
		{
			len = default(int);
			return null;
		}

		public static string luaL_optlstring(IntPtr L, int narg, string def, out int len)
		{
			len = default(int);
			return null;
		}

		public static double luaL_checknumber(IntPtr L, int stackPos)
		{
			return 0.0;
		}

		public static double luaL_optnumber(IntPtr L, int idx, double def)
		{
			return 0.0;
		}

		public static int luaL_checkinteger(IntPtr L, int stackPos)
		{
			return 0;
		}

		public static int luaL_optinteger(IntPtr L, int idx, int def)
		{
			return 0;
		}

		public static bool luaL_checkboolean(IntPtr luaState, int index)
		{
			return false;
		}

		public static void luaL_checkstack(IntPtr L, int space, string mes)
		{
		}

		public static void luaL_checktype(IntPtr L, int narg, LuaTypes t)
		{
		}

		public static void luaL_checkany(IntPtr L, int narg)
		{
		}

		[PreserveSig]
		public static extern int luaL_newmetatable(IntPtr luaState, string meta);

		public static IntPtr luaL_checkudata(IntPtr L, int ud, string tname)
		{
			return (IntPtr)0;
		}

		[PreserveSig]
		public static extern void luaL_where(IntPtr luaState, int level);

		public static int luaL_throw(IntPtr L, string message)
		{
			return 0;
		}

		[PreserveSig]
		public static extern int luaL_ref(IntPtr luaState, int t);

		[PreserveSig]
		public static extern void luaL_unref(IntPtr luaState, int registryIndex, int reference);

		[PreserveSig]
		public static extern int luaL_loadfile(IntPtr luaState, string filename);

		public static int luaL_loadbuffer(IntPtr luaState, byte[] buff, int size, string name)
		{
			return 0;
		}

		[PreserveSig]
		public static extern int luaL_loadstring(IntPtr luaState, string chunk);

		[PreserveSig]
		public static extern IntPtr luaL_newstate();

		[PreserveSig]
		public static extern IntPtr luaL_gsub(IntPtr luaState, string str, string pattern, string replacement);

		[PreserveSig]
		public static extern IntPtr luaL_findtable(IntPtr luaState, int idx, string fname, int szhint = 1);

		public static string luaL_typename(IntPtr luaState, int stackPos)
		{
			return null;
		}

		public static bool luaL_dofile(IntPtr luaState, string fileName)
		{
			return false;
		}

		public static bool luaL_dostring(IntPtr luaState, string chunk)
		{
			return false;
		}

		public static void luaL_getmetatable(IntPtr luaState, string meta)
		{
		}

		public static int lua_ref(IntPtr luaState)
		{
			return 0;
		}

		public static void lua_getref(IntPtr luaState, int reference)
		{
		}

		public static void lua_unref(IntPtr luaState, int reference)
		{
		}

		[PreserveSig]
		public static extern void tolua_openlibs(IntPtr L);

		[PreserveSig]
		public static extern void tolua_openint64(IntPtr L);

		[PreserveSig]
		public static extern int tolua_openlualibs(IntPtr L);

		[PreserveSig]
		public static extern IntPtr tolua_tag();

		[PreserveSig]
		public static extern void tolua_newudata(IntPtr luaState, int val);

		[PreserveSig]
		public static extern int tolua_rawnetobj(IntPtr luaState, int obj);

		[PreserveSig]
		public static extern bool tolua_pushudata(IntPtr L, int index);

		[PreserveSig]
		public static extern bool tolua_pushnewudata(IntPtr L, int metaRef, int index);

		[PreserveSig]
		public static extern int tolua_beginpcall(IntPtr L, int reference);

		[PreserveSig]
		public static extern void tolua_pushtraceback(IntPtr L);

		[PreserveSig]
		public static extern void tolua_getvec2(IntPtr luaState, int stackPos, out float x, out float y);

		[PreserveSig]
		public static extern void tolua_getvec3(IntPtr luaState, int stackPos, out float x, out float y, out float z);

		[PreserveSig]
		public static extern void tolua_getvec4(IntPtr luaState, int stackPos, out float x, out float y, out float z, out float w);

		[PreserveSig]
		public static extern void tolua_getclr(IntPtr luaState, int stackPos, out float r, out float g, out float b, out float a);

		[PreserveSig]
		public static extern void tolua_getquat(IntPtr luaState, int stackPos, out float x, out float y, out float z, out float w);

		[PreserveSig]
		public static extern int tolua_getlayermask(IntPtr luaState, int stackPos);

		[PreserveSig]
		public static extern void tolua_pushvec2(IntPtr luaState, float x, float y);

		[PreserveSig]
		public static extern void tolua_pushvec3(IntPtr luaState, float x, float y, float z);

		[PreserveSig]
		public static extern void tolua_pushvec4(IntPtr luaState, float x, float y, float z, float w);

		[PreserveSig]
		public static extern void tolua_pushquat(IntPtr luaState, float x, float y, float z, float w);

		[PreserveSig]
		public static extern void tolua_pushclr(IntPtr luaState, float r, float g, float b, float a);

		[PreserveSig]
		public static extern void tolua_pushlayermask(IntPtr luaState, int mask);

		[PreserveSig]
		public static extern bool tolua_isint64(IntPtr luaState, int stackPos);

		[PreserveSig]
		public static extern long tolua_toint64(IntPtr luaState, int stackPos);

		public static long tolua_checkint64(IntPtr L, int stackPos)
		{
			return 0L;
		}

		[PreserveSig]
		public static extern void tolua_pushint64(IntPtr luaState, long n);

		[PreserveSig]
		public static extern bool tolua_isuint64(IntPtr luaState, int stackPos);

		[PreserveSig]
		public static extern ulong tolua_touint64(IntPtr luaState, int stackPos);

		public static ulong tolua_checkuint64(IntPtr L, int stackPos)
		{
			return 0uL;
		}

		[PreserveSig]
		public static extern void tolua_pushuint64(IntPtr luaState, ulong n);

		[PreserveSig]
		public static extern void tolua_setindex(IntPtr L);

		[PreserveSig]
		public static extern void tolua_setnewindex(IntPtr L);

		[PreserveSig]
		public static extern int toluaL_ref(IntPtr L);

		[PreserveSig]
		public static extern void toluaL_unref(IntPtr L, int reference);

		[PreserveSig]
		public static extern IntPtr tolua_getmainstate(IntPtr L);

		[PreserveSig]
		public static extern int tolua_getvaluetype(IntPtr L, int stackPos);

		[PreserveSig]
		public static extern bool tolua_createtable(IntPtr L, string fullPath, int szhint = 0);

		[PreserveSig]
		public static extern bool tolua_pushluatable(IntPtr L, string fullPath);

		[PreserveSig]
		public static extern bool tolua_beginmodule(IntPtr L, string name);

		[PreserveSig]
		public static extern void tolua_endmodule(IntPtr L);

		[PreserveSig]
		public static extern bool tolua_beginpremodule(IntPtr L, string fullPath, int szhint = 0);

		[PreserveSig]
		public static extern void tolua_endpremodule(IntPtr L, int reference);

		[PreserveSig]
		public static extern bool tolua_addpreload(IntPtr L, string path);

		[PreserveSig]
		public static extern int tolua_beginclass(IntPtr L, string name, int baseMetaRef, int reference = -1);

		[PreserveSig]
		public static extern void tolua_endclass(IntPtr L);

		[PreserveSig]
		public static extern void tolua_function(IntPtr L, string name, IntPtr fn);

		[PreserveSig]
		public static extern IntPtr tolua_tocbuffer(string name, int sz);

		[PreserveSig]
		public static extern void tolua_freebuffer(IntPtr buffer);

		[PreserveSig]
		public static extern void tolua_variable(IntPtr L, string name, IntPtr get, IntPtr set);

		[PreserveSig]
		public static extern void tolua_constant(IntPtr L, string name, double val);

		[PreserveSig]
		public static extern int tolua_beginenum(IntPtr L, string name);

		[PreserveSig]
		public static extern void tolua_endenum(IntPtr L);

		[PreserveSig]
		public static extern void tolua_beginstaticclass(IntPtr L, string name);

		[PreserveSig]
		public static extern void tolua_endstaticclass(IntPtr L);

		[PreserveSig]
		public static extern int tolua_require(IntPtr L, string fileName);

		[PreserveSig]
		public static extern int tolua_getmetatableref(IntPtr L, int pos);

		[PreserveSig]
		public static extern void tolua_setflag(int bit, bool flag);

		[PreserveSig]
		public static extern bool tolua_isvptrtable(IntPtr L, int index);

		public static int toluaL_exception(IntPtr L, Exception e)
		{
			return 0;
		}

		public static int toluaL_exception(IntPtr L, Exception e, object o, string msg)
		{
			return 0;
		}

		[PreserveSig]
		public static extern int tolua_loadbuffer(IntPtr luaState, byte[] buff, int size, string name);

		[PreserveSig]
		public static extern bool tolua_toboolean(IntPtr luaState, int index);

		[PreserveSig]
		public static extern int tolua_tointeger(IntPtr luaState, int idx);

		[PreserveSig]
		public static extern IntPtr tolua_tolstring(IntPtr luaState, int index, out int strLen);

		[PreserveSig]
		public static extern void tolua_pushlstring(IntPtr luaState, byte[] str, int size);

		[PreserveSig]
		public static extern int tolua_objlen(IntPtr luaState, int stackPos);

		[PreserveSig]
		public static extern IntPtr tolua_newuserdata(IntPtr luaState, int size);

		[PreserveSig]
		public static extern int tolua_argerror(IntPtr luaState, int narg, string extramsg);

		[PreserveSig]
		public static extern int tolua_error(IntPtr L, string msg);

		[PreserveSig]
		public static extern int tolua_getfield(IntPtr L, int idx, string key);

		[PreserveSig]
		public static extern int tolua_setfield(IntPtr L, int idx, string key);

		[PreserveSig]
		public static extern int tolua_gettable(IntPtr luaState, int idx);

		[PreserveSig]
		public static extern int tolua_settable(IntPtr luaState, int idx);

		[PreserveSig]
		public static extern int tolua_getn(IntPtr luaState, int stackPos);

		[PreserveSig]
		public static extern int tolua_strlen(IntPtr str);

		[PreserveSig]
		public static extern void tolua_pushcfunction(IntPtr L, IntPtr fn);

		public static void tolua_pushcfunction(IntPtr luaState, LuaCSFunction func)
		{
		}

		public static string tolua_findtable(IntPtr L, int idx, string name, int size = 1)
		{
			return null;
		}

		public static IntPtr tolua_atpanic(IntPtr L, LuaCSFunction func)
		{
			return (IntPtr)0;
		}

		[PreserveSig]
		public static extern IntPtr tolua_buffinit(IntPtr luaState);

		[PreserveSig]
		public static extern void tolua_addlstring(IntPtr b, string str, int l);

		[PreserveSig]
		public static extern void tolua_addstring(IntPtr b, string s);

		[PreserveSig]
		public static extern void tolua_addchar(IntPtr b, byte s);

		[PreserveSig]
		public static extern void tolua_pushresult(IntPtr b);

		[PreserveSig]
		public static extern int tolua_update(IntPtr L, float deltaTime, float unscaledDelta);

		[PreserveSig]
		public static extern int tolua_lateupdate(IntPtr L);

		[PreserveSig]
		public static extern int tolua_fixedupdate(IntPtr L, float fixedTime);

		[PreserveSig]
		public static extern void tolua_regthis(IntPtr L, IntPtr get, IntPtr set);

		[PreserveSig]
		public static extern int tolua_where(IntPtr L, int level);

		public static void tolua_bindthis(IntPtr L, LuaCSFunction get, LuaCSFunction set)
		{
		}

		[PreserveSig]
		public static extern int tolua_getclassref(IntPtr L, int pos);
	}
}
