using System;
using System.Diagnostics;
using System.Text;

namespace LuaInterface
{
	public class LuaException : Exception
	{
		public static Exception luaStack;

		public static string projectFolder;

		public static int InstantiateCount;

		public static int SendMsgCount;

		public static IntPtr L;

		protected string _stack;

		public override string StackTrace
		{
			get
			{
				return null;
			}
		}

		public LuaException(string msg, Exception e = null, int skip = 1)
		{
		}

		public static Exception GetLastError()
		{
			return null;
		}

		public static void ExtractFormattedStackTrace(StackTrace trace, StringBuilder sb, StackTrace skip = null)
		{
		}

		public static void Init(IntPtr L0)
		{
		}
	}
}
