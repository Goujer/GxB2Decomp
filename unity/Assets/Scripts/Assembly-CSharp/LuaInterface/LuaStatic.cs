using System;

namespace LuaInterface
{
	public static class LuaStatic
	{
		public static int GetMetaReference(IntPtr L, Type t)
		{
			return 0;
		}

		public static int GetMissMetaReference(IntPtr L, Type t)
		{
			return 0;
		}

		public static Type GetClassType(IntPtr L, int reference)
		{
			return null;
		}

		public static LuaFunction GetFunction(IntPtr L, int reference)
		{
			return null;
		}

		public static LuaTable GetTable(IntPtr L, int reference)
		{
			return null;
		}

		public static LuaThread GetLuaThread(IntPtr L, int reference)
		{
			return null;
		}

		public static void GetUnpackRayRef(IntPtr L)
		{
		}

		public static void GetUnpackBounds(IntPtr L)
		{
		}

		public static void GetPackRay(IntPtr L)
		{
		}

		public static void GetPackRaycastHit(IntPtr L)
		{
		}

		public static void GetPackTouch(IntPtr L)
		{
		}

		public static void GetPackBounds(IntPtr L)
		{
		}

		public static int GetArrayMetatable(IntPtr L)
		{
			return 0;
		}

		public static int GetTypeMetatable(IntPtr L)
		{
			return 0;
		}

		public static int GetDelegateMetatable(IntPtr L)
		{
			return 0;
		}

		public static int GetEventMetatable(IntPtr L)
		{
			return 0;
		}

		public static int GetIterMetatable(IntPtr L)
		{
			return 0;
		}

		public static int GetEnumObject(IntPtr L, Enum e, out object obj)
		{
			obj = null;
			return 0;
		}

		public static LuaCSFunction GetPreModule(IntPtr L, Type t)
		{
			return null;
		}
	}
}
