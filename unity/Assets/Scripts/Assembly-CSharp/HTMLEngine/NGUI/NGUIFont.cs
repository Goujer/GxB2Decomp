using HTMLEngine.Core;
using UnityEngine;

namespace HTMLEngine.NGUI
{
	public class NGUIFont : HtFont
	{
		public UIFont uiFont;

		private static Font truefont;

		private readonly int whiteSize;

		private AbstractLoader _loader;

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

		public NGUIFont(string face, int size, bool bold, bool italic)
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

		public void OnRelease()
		{
		}
	}
}
