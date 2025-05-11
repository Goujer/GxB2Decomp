using System;
using System.IO;
using System.Runtime.InteropServices;

namespace LuaInterface
{
	[StructLayout(LayoutKind.Sequential, Size = 16)]
	public struct LuaByteBuffer
	{
		public byte[] buffer;

		public int Length { get; private set; }

		public LuaByteBuffer(IntPtr source, int len)
		{
			buffer = null;
			Length = 0;
		}

		public LuaByteBuffer(byte[] buf)
		{
			buffer = null;
			Length = 0;
		}

		public LuaByteBuffer(byte[] buf, int len)
		{
			buffer = null;
			Length = 0;
		}

		public LuaByteBuffer(MemoryStream stream)
		{
			buffer = null;
			Length = 0;
		}

		public static implicit operator LuaByteBuffer(MemoryStream stream)
		{
			return default(LuaByteBuffer);
		}
	}
}
