using System.Collections.Generic;
using UnityEngine;

namespace HTMLEngine.NGUI
{
	public class NGUIDevice : HtDevice
	{
		private readonly Dictionary<string, NGUIFont> fonts;

		private readonly Dictionary<string, NGUIImage> images;

		private static Texture2D whiteTex;

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
}
