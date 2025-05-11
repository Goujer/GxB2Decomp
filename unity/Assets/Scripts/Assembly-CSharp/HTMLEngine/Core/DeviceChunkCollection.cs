using System.Collections.Generic;

namespace HTMLEngine.Core
{
	internal class DeviceChunkCollection : PoolableObject
	{
		private readonly List<DeviceChunkLine> list;

		internal readonly Stack<HtFont> fontStack;

		internal readonly Stack<HtColor> colorStack;

		private readonly Stack<TextAlign> alignStack;

		private readonly Stack<VertAlign> valignStack;

		public Dictionary<DeviceChunk, string> Links;

		protected int lineGap;

		protected string dir;

		public List<DeviceChunkLine> Lines
		{
			get
			{
				return null;
			}
		}

		internal override void OnAcquire()
		{
		}

		internal override void OnRelease()
		{
		}

		public void Clear(bool releaseItems = true)
		{
		}

		private DeviceChunkDrawText AcquireDeviceChunkDrawText(string id, string text, HtFont font, HtColor color, DrawTextDeco deco, bool decoStop, bool prevIsWord)
		{
			return null;
		}

		private DeviceChunkDrawTextEffect AcquireDeviceChunkDrawTextEffect(string id, string text, HtFont font, HtColor color, DrawTextDeco deco, bool decoStop, DrawTextEffect effect, int effectAmount, HtColor effectColor, bool prevIsWord)
		{
			return null;
		}

		public void Parse(IEnumerator<HtmlChunk> htmlChunks, int viewportWidth, int lineGap2, string id = null, HtFont font = null, HtColor color = default(HtColor), TextAlign align = TextAlign.Left, VertAlign valign = VertAlign.Bottom)
		{
		}

		private static void ExctractAligns(HtmlChunkTag tag, ref TextAlign align, ref VertAlign valign)
		{
		}

		internal DeviceChunkLine NewLine(DeviceChunkLine prevLine, int viewPortWidth, TextAlign prevAlign, VertAlign prevVAlign)
		{
			return null;
		}

		internal void FinishLine(DeviceChunkLine line, TextAlign align, VertAlign valign)
		{
		}
	}
}
