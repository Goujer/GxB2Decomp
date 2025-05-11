using HTMLEngine.Core;

namespace HTMLEngine
{
	public class HtEngine
	{
		internal class GenericFont : HtFont
		{
			public override int LineSpacing
			{
				get
				{
					return 0;
				}
			}

			public override int WhiteSize
			{
				get
				{
					return 0;
				}
			}

			public GenericFont(string face, int size, bool bold, bool italic)
				: base(null, 0, false, false)
			{
			}

			public override HtSize Measure(string text)
			{
				return default(HtSize);
			}

			public override void Draw(string id, HtRect rect, HtColor color, string text, bool isEffect, DrawTextEffect effect, HtColor effectColor, int effectAmount, string linkText, object userData)
			{
			}
		}

		internal class GenericImage : HtImage
		{
			public override int Width
			{
				get
				{
					return 0;
				}
			}

			public override int Height
			{
				get
				{
					return 0;
				}
			}

			public override void Draw(string id, HtRect rect, HtColor color, string linkText, object userData)
			{
			}
		}

		internal class GenericDevice : HtDevice
		{
			public override HtFont LoadFont(string face, int size, bool bold, bool italic)
			{
				return null;
			}

			public override HtImage LoadImage(string src, int fps)
			{
				return null;
			}

			public override void FillRect(HtRect rect, HtColor color, object userData)
			{
			}

			public override void OnRelease()
			{
			}
		}

		internal class ConsoleLogger : HtLogger
		{
			public override void Log(HtLogLevel level, string message)
			{
			}
		}

		internal static HtDevice Device;

		internal static HtLogger Logger;

		public static HtLogLevel LogLevel;

		public static HtColor DefaultColor;

		public static HtColor LinkHoverColor;

		public static float LinkPressedFactor;

		public static string LinkFunctionName;

		public static string DefaultFontFace;

		public static int DefaultFontSize;

		public static HtColor DefaultLinkColor;

		public static void RegisterDevice(HtDevice device)
		{
		}

		public static void RegisterLogger(HtLogger logger)
		{
		}

		public static HtCompiler GetCompiler()
		{
			return null;
		}

		public static void ReleaseDevice()
		{
		}

		internal static void Log(HtLogLevel level, string format, params object[] args)
		{
		}
	}
}
