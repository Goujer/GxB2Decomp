using System.Runtime.InteropServices;

namespace HTMLEngine
{
	[StructLayout(LayoutKind.Sequential, Size = 4)]
	public struct HtColor
	{
		public static readonly HtColor transparent;

		public static readonly HtColor _error;

		public static readonly HtColor maroon;

		public static readonly HtColor red;

		public static readonly HtColor orange;

		public static readonly HtColor yellow;

		public static readonly HtColor olive;

		public static readonly HtColor purple;

		public static readonly HtColor fuchsia;

		public static readonly HtColor white;

		public static readonly HtColor lime;

		public static readonly HtColor green;

		public static readonly HtColor navy;

		public static readonly HtColor blue;

		public static readonly HtColor aqua;

		public static readonly HtColor teal;

		public static readonly HtColor black;

		public static readonly HtColor silver;

		public static readonly HtColor gray;

		public byte R;

		public byte G;

		public byte B;

		public byte A;

		public bool IsTransparent
		{
			get
			{
				return false;
			}
		}

		public static HtColor RGBA(byte r, byte g, byte b, byte a = byte.MaxValue)
		{
			return default(HtColor);
		}

		private static bool TryParse(string rs, string gs, string bs, ref byte r, ref byte g, ref byte b)
		{
			return false;
		}

		private static bool TryParse(string rs, string gs, string bs, string aa, ref byte r, ref byte g, ref byte b, ref byte a)
		{
			return false;
		}

		public static HtColor Parse(string text)
		{
			return default(HtColor);
		}

		public static HtColor Parse(string text, HtColor onError)
		{
			return default(HtColor);
		}

		public override string ToString()
		{
			return null;
		}
	}
}
