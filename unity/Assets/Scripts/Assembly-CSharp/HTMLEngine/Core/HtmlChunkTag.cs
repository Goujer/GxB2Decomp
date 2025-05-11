using System.Collections.Generic;

namespace HTMLEngine.Core
{
	internal class HtmlChunkTag : HtmlChunk
	{
		private static readonly char[] TAG_NAME_STOP_CHARS;

		private static readonly char[] ATTR_NAME_STOP_CHARS;

		private static readonly char[] ATTR_VALUE_STOP_CHARS;

		private readonly Dictionary<string, string> Attrs;

		public bool IsClosing;

		public bool IsSingle;

		public string Tag;

		internal override void OnRelease()
		{
		}

		public string GetAttr(string attrName)
		{
			return null;
		}

		public bool ReadTag(Reader reader)
		{
			return false;
		}

		private bool IsTagSupported()
		{
			return false;
		}

		public override string ToString()
		{
			return null;
		}
	}
}
