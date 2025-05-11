using System;

namespace LuaInterface
{
	public class LuaStatePtr
	{
		protected IntPtr L;

		private string jit;

		public int LuaUpValueIndex(int i)
		{
			return 0;
		}

		public IntPtr LuaNewState()
		{
			return (IntPtr)0;
		}

		public void LuaOpenJit()
		{
		}

		public void LuaClose()
		{
		}

		public IntPtr LuaNewThread()
		{
			return (IntPtr)0;
		}

		public IntPtr LuaAtPanic(IntPtr panic)
		{
			return (IntPtr)0;
		}

		public int LuaGetTop()
		{
			return 0;
		}

		public void LuaSetTop(int newTop)
		{
		}

		public void LuaPushValue(int idx)
		{
		}

		public void LuaRemove(int index)
		{
		}

		public void LuaInsert(int idx)
		{
		}

		public void LuaReplace(int idx)
		{
		}

		public bool LuaCheckStack(int args)
		{
			return false;
		}

		public void LuaXMove(IntPtr to, int n)
		{
		}

		public bool LuaIsNumber(int idx)
		{
			return false;
		}

		public bool LuaIsString(int index)
		{
			return false;
		}

		public bool LuaIsCFunction(int index)
		{
			return false;
		}

		public bool LuaIsUserData(int index)
		{
			return false;
		}

		public bool LuaIsNil(int n)
		{
			return false;
		}

		public LuaTypes LuaType(int index)
		{
			return default(LuaTypes);
		}

		public string LuaTypeName(LuaTypes type)
		{
			return null;
		}

		public string LuaTypeName(int idx)
		{
			return null;
		}

		public bool LuaEqual(int idx1, int idx2)
		{
			return false;
		}

		public bool LuaRawEqual(int idx1, int idx2)
		{
			return false;
		}

		public bool LuaLessThan(int idx1, int idx2)
		{
			return false;
		}

		public double LuaToNumber(int idx)
		{
			return 0.0;
		}

		public int LuaToInteger(int idx)
		{
			return 0;
		}

		public bool LuaToBoolean(int idx)
		{
			return false;
		}

		public string LuaToString(int index)
		{
			return null;
		}

		public IntPtr LuaToLString(int index, out int len)
		{
			len = default(int);
			return (IntPtr)0;
		}

		public IntPtr LuaToCFunction(int idx)
		{
			return (IntPtr)0;
		}

		public IntPtr LuaToUserData(int idx)
		{
			return (IntPtr)0;
		}

		public IntPtr LuaToThread(int idx)
		{
			return (IntPtr)0;
		}

		public IntPtr LuaToPointer(int idx)
		{
			return (IntPtr)0;
		}

		public int LuaObjLen(int index)
		{
			return 0;
		}

		public void LuaPushNil()
		{
		}

		public void LuaPushNumber(double number)
		{
		}

		public void LuaPushInteger(int n)
		{
		}

		public void LuaPushLString(byte[] str, int size)
		{
		}

		public void LuaPushString(string str)
		{
		}

		public void LuaPushCClosure(IntPtr fn, int n)
		{
		}

		public void LuaPushBoolean(bool value)
		{
		}

		public void LuaPushLightUserData(IntPtr udata)
		{
		}

		public int LuaPushThread()
		{
			return 0;
		}

		public void LuaGetTable(int idx)
		{
		}

		public void LuaGetField(int index, string key)
		{
		}

		public void LuaRawGet(int idx)
		{
		}

		public void LuaRawGetI(int tableIndex, int index)
		{
		}

		public void LuaCreateTable(int narr = 0, int nec = 0)
		{
		}

		public IntPtr LuaNewUserData(int size)
		{
			return (IntPtr)0;
		}

		public int LuaGetMetaTable(int idx)
		{
			return 0;
		}

		public void LuaGetEnv(int idx)
		{
		}

		public void LuaSetTable(int idx)
		{
		}

		public void LuaSetField(int idx, string key)
		{
		}

		public void LuaRawSet(int idx)
		{
		}

		public void LuaRawSetI(int tableIndex, int index)
		{
		}

		public void LuaSetMetaTable(int objIndex)
		{
		}

		public void LuaSetEnv(int idx)
		{
		}

		public void LuaCall(int nArgs, int nResults)
		{
		}

		public int LuaPCall(int nArgs, int nResults, int errfunc)
		{
			return 0;
		}

		public int LuaYield(int nresults)
		{
			return 0;
		}

		public int LuaResume(int narg)
		{
			return 0;
		}

		public int LuaStatus()
		{
			return 0;
		}

		public int LuaGC(LuaGCOptions what, int data = 0)
		{
			return 0;
		}

		public bool LuaNext(int index)
		{
			return false;
		}

		public void LuaConcat(int n)
		{
		}

		public void LuaPop(int amount)
		{
		}

		public void LuaNewTable()
		{
		}

		public void LuaPushFunction(LuaCSFunction func)
		{
		}

		public bool lua_isfunction(int n)
		{
			return false;
		}

		public bool lua_istable(int n)
		{
			return false;
		}

		public bool lua_islightuserdata(int n)
		{
			return false;
		}

		public bool lua_isnil(int n)
		{
			return false;
		}

		public bool lua_isboolean(int n)
		{
			return false;
		}

		public bool lua_isthread(int n)
		{
			return false;
		}

		public bool lua_isnone(int n)
		{
			return false;
		}

		public bool lua_isnoneornil(int n)
		{
			return false;
		}

		public void LuaRawGlobal(string name)
		{
		}

		public void LuaSetGlobal(string name)
		{
		}

		public void LuaGetGlobal(string name)
		{
		}

		public void LuaOpenLibs()
		{
		}

		public int AbsIndex(int i)
		{
			return 0;
		}

		public int LuaGetN(int i)
		{
			return 0;
		}

		public double LuaCheckNumber(int stackPos)
		{
			return 0.0;
		}

		public int LuaCheckInteger(int idx)
		{
			return 0;
		}

		public bool LuaCheckBoolean(int stackPos)
		{
			return false;
		}

		public string LuaCheckLString(int numArg, out int len)
		{
			len = default(int);
			return null;
		}

		public int LuaLoadBuffer(byte[] buff, int size, string name)
		{
			return 0;
		}

		public IntPtr LuaFindTable(int idx, string fname, int szhint = 1)
		{
			return (IntPtr)0;
		}

		public int LuaTypeError(int stackPos, string tname, string t2 = null)
		{
			return 0;
		}

		public bool LuaDoString(string chunk, string chunkName = "@LuaStatePtr.cs")
		{
			return false;
		}

		public bool LuaDoFile(string fileName)
		{
			return false;
		}

		public void LuaGetMetaTable(string meta)
		{
		}

		public int LuaRef(int t)
		{
			return 0;
		}

		public void LuaGetRef(int reference)
		{
		}

		public void LuaUnRef(int reference)
		{
		}

		public int LuaRequire(string fileName)
		{
			return 0;
		}

		public void ThrowLuaException(Exception e)
		{
		}

		public int ToLuaRef()
		{
			return 0;
		}

		public int LuaUpdate(float delta, float unscaled)
		{
			return 0;
		}

		public int LuaLateUpdate()
		{
			return 0;
		}

		public int LuaFixedUpdate(float fixedTime)
		{
			return 0;
		}

		public void OpenToLuaLibs()
		{
		}

		public void ToLuaPushTraceback()
		{
		}

		public void ToLuaUnRef(int reference)
		{
		}

		public int LuaGetStack(int level, ref Lua_Debug ar)
		{
			return 0;
		}

		public int LuaGetInfo(string what, ref Lua_Debug ar)
		{
			return 0;
		}

		public string LuaGetLocal(ref Lua_Debug ar, int n)
		{
			return null;
		}

		public string LuaSetLocal(ref Lua_Debug ar, int n)
		{
			return null;
		}

		public string LuaGetUpvalue(int funcindex, int n)
		{
			return null;
		}

		public string LuaSetUpvalue(int funcindex, int n)
		{
			return null;
		}

		public int LuaSetHook(LuaHookFunc func, int mask, int count)
		{
			return 0;
		}

		public LuaHookFunc LuaGetHook()
		{
			return null;
		}

		public int LuaGetHookMask()
		{
			return 0;
		}

		public int LuaGetHookCount()
		{
			return 0;
		}
	}
}
