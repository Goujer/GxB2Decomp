using System;
using System.Collections.Generic;
using System.Reflection;

namespace LuaInterface
{
	public class LuaReflection : IDisposable
	{
		public List<Assembly> list;

		private static LuaReflection _reflection;

		public static void OpenLibs(IntPtr L)
		{
		}

		public static LuaReflection Get(IntPtr L)
		{
			return null;
		}

		private static int OpenReflectionLibs(IntPtr L)
		{
			return 0;
		}

		private static int FindType(IntPtr L)
		{
			return 0;
		}

		private static int LoadAssembly(IntPtr L)
		{
			return 0;
		}

		private static void PushLuaMethod(IntPtr L, MethodInfo md, Type t, Type[] types)
		{
		}

		private static int GetMethod(IntPtr L)
		{
			return 0;
		}

		private static void PushLuaConstructor(IntPtr L, ConstructorInfo func, Type[] types)
		{
		}

		private static int GetConstructor(IntPtr L)
		{
			return 0;
		}

		private static int GetTypeMethod(IntPtr L)
		{
			return 0;
		}

		private static void PushLuaProperty(IntPtr L, PropertyInfo p, Type t)
		{
		}

		private static int GetProperty(IntPtr L)
		{
			return 0;
		}

		private static void PushLuaField(IntPtr L, FieldInfo f, Type t)
		{
		}

		private static int GetField(IntPtr L)
		{
			return 0;
		}

		private static int CreateInstance(IntPtr L)
		{
			return 0;
		}

		private bool LoadAssembly(string name)
		{
			return false;
		}

		public void Dispose()
		{
		}
	}
}
