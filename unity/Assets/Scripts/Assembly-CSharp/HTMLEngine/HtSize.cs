using System.Runtime.InteropServices;

namespace HTMLEngine
{
	[StructLayout(LayoutKind.Sequential, Size = 8)]
	public struct HtSize
	{
		public int Width;

		public int Height;

		public HtSize(int width, int height)
		{
			Width = 0;
			Height = 0;
		}

		public override string ToString()
		{
			return null;
		}
	}
}
