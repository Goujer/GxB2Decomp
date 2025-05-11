using System;

namespace LuaInterface
{
	public class LuaThread : LuaBaseRef
	{
		public LuaThread(int reference, LuaState state)
		{
		}

		protected int Resume(IntPtr L, int nArgs)
		{
			return 0;
		}

		public int Resume()
		{
			return 0;
		}

		public int Resume<T1>(T1 arg1)
		{
			return 0;
		}

		public int Resume<T1, T2>(T1 arg1, T2 arg2)
		{
			return 0;
		}

		public int Resume<T1, T2, T3>(T1 arg1, T2 arg2, T3 arg3)
		{
			return 0;
		}

		public int Resume<R1>(out R1 ret1)
		{
			ret1 = default(R1);
			return 0;
		}

		public int Resume<T1, R1>(T1 arg1, out R1 ret1)
		{
			ret1 = default(R1);
			return 0;
		}

		public int Resume<T1, T2, R1>(T1 arg1, T2 arg2, out R1 ret1)
		{
			ret1 = default(R1);
			return 0;
		}

		public int Resume<T1, T2, T3, R1>(T1 arg1, T2 arg2, T3 arg3, out R1 ret1)
		{
			ret1 = default(R1);
			return 0;
		}
	}
}
