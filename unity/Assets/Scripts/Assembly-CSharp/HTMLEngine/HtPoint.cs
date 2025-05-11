using System.Runtime.InteropServices;

namespace HTMLEngine
{
	[StructLayout(LayoutKind.Sequential, Size = 8)]
	public struct HtPoint
	{
		public int X;

		public int Y;

		public HtPoint(int x, int y)
		{
			X = 0;
			Y = 0;
		}

		public override string ToString()
		{
			return null;
		}
	}
}
