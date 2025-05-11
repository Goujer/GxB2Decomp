using System.Collections.Generic;

namespace HTMLEngine.Core
{
	internal class DeviceChunkDrawCompiled : DeviceChunk
	{
		public HtCompiler compiled;

		private bool offsetApplied;

		public void Parse(IEnumerator<HtmlChunk> source, int width, int lineGap, string id = null, HtFont font = null, HtColor color = default(HtColor), TextAlign align = TextAlign.Left, VertAlign valign = VertAlign.Bottom)
		{
		}

		internal override void OnAcquire()
		{
		}

		internal override void OnRelease()
		{
		}

		public override void Draw(float deltaTime, string linkText, object userData)
		{
		}

		public override void MeasureSize()
		{
		}
	}
}
