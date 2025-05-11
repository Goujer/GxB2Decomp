using System.Runtime.InteropServices;

namespace HTMLEngine
{
	[StructLayout(LayoutKind.Sequential, Size = 16)]
	public struct HtRect
	{
		public int X;

		public int Y;

		public int Width;

		public int Height;

		public int Left
		{
			get
			{
				return 0;
			}
		}

		public int Right
		{
			get
			{
				return 0;
			}
		}

		public int Top
		{
			get
			{
				return 0;
			}
		}

		public int Bottom
		{
			get
			{
				return 0;
			}
		}

		public HtRect(int x, int y, int width, int height)
		{
			X = 0;
			Y = 0;
			Width = 0;
			Height = 0;
		}

		public HtRect Offset(int dx, int dy)
		{
			return default(HtRect);
		}

		public override string ToString()
		{
			return null;
		}
	}
}
