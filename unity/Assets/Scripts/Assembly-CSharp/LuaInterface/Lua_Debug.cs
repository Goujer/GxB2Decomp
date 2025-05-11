using System;
using System.Runtime.InteropServices;

namespace LuaInterface
{
	[StructLayout(LayoutKind.Sequential, Size = 192)]
	public struct Lua_Debug
	{
		public int eventcode;

		public IntPtr _name;

		public IntPtr _namewhat;

		public IntPtr _what;

		public IntPtr _source;

		public int currentline;

		public int nups;

		public int linedefined;

		public int lastlinedefined;

		public byte[] _short_src;

		public int i_ci;

		public string namewhat
		{
			get
			{
				return null;
			}
		}

		public string name
		{
			get
			{
				return null;
			}
		}

		public string what
		{
			get
			{
				return null;
			}
		}

		public string source
		{
			get
			{
				return null;
			}
		}

		public string short_src
		{
			get
			{
				return null;
			}
		}

		private string tostring(IntPtr p)
		{
			return null;
		}

		private int GetShortSrcLen(byte[] str)
		{
			return 0;
		}
	}
}
