using System.Collections.Generic;
using HTMLEngine.Core;

namespace HTMLEngine
{
	public class HtCompiler : PoolableObject
	{
		private bool isMergeSameTextChunks;

		private readonly Reader reader;

		private DeviceChunkCollection d;

		public int CompiledWidth { get; private set; }

		public int CompiledHeight { get; private set; }

		public int DrewHeight { get; private set; }

		public int MaxWidth { get; private set; }

		public void SetIsMergeSameTextChunks(bool value)
		{
		}

		internal override void OnAcquire()
		{
		}

		internal override void OnRelease()
		{
		}

		public string GetLink(int x, int y)
		{
			return null;
		}

		public void Compile(string source, int width, int lineGap = 5)
		{
		}

		internal void Compile(IEnumerator<HtmlChunk> source, int width, int lineGap, string id = null, HtFont font = null, HtColor color = default(HtColor), TextAlign align = TextAlign.Left, VertAlign valign = VertAlign.Bottom)
		{
		}

		private void UpdateHeight()
		{
		}

		private void UpdateWidth()
		{
		}

		private void MergeSameTextChunks()
		{
		}

		public void Draw(float deltaTime, object userData = null, int maxLine = int.MaxValue)
		{
		}

		public void Offset(int dx, int dy)
		{
		}

		public int getLineNum()
		{
			return 0;
		}
	}
}
